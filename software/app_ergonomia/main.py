import streamlit as st
import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '.')))

st.set_page_config(page_title="Evaluación de ergonomía postural y Salud Ocupacional - Predicción de riesgos musculoesqueléticos y Prescripción ergonómica y recomendaciones", layout="wide")

from domain.visualizer import show_hrv_graphs, show_joint_angles
from datetime import datetime
from infrastructure.db import obtener_descripcion_variable, engine, DB_HOST, DB_PORT, DB_NAME, DB_USER
from sqlalchemy import text
from domain.email_service import enviar_email_pdf
from presentation.ui_panels import panel_conexion_db, panel_seleccion_sujeto_ejercicio, mostrar_resultados_batch
from app.utils.gemini_client import obtener_respuesta_ia
from app.utils.prompt_generator import generar_prompt_evaluacion
from app.utils.processor import procesar_archivos_tiempo
from infrastructure.data_loader import listar_sujetos_y_ejercicios, cargar_archivos_sujeto_ejercicio
from domain.processor import procesar_simulaciones
from domain.pdf_exporter import generar_pdf_batch
from domain.ia_handler import generar_informe_ia

try:
    st.session_state.gemini_available = True
except ImportError as e:
    st.warning(f"⚠️ No se pudo importar módulos de IA: {e}")
    st.session_state.gemini_available = False

st.title("Evaluación de ergonomía postural y Salud Ocupacional - Predicción de riesgos musculoesqueléticos y Prescripción ergonómica y recomendaciones")

# Inicializar session_state
if 'evaluacion_ia' not in st.session_state:
    st.session_state.evaluacion_ia = None
if 'gemini_available' not in st.session_state:
    st.session_state.gemini_available = False
if 'csv_folder' not in st.session_state:
    st.session_state.csv_folder = ''
if 'csv_files' not in st.session_state:
    st.session_state.csv_files = {}
if 'show_email_form' not in st.session_state:
    st.session_state.show_email_form = False

def main():
    with st.sidebar:
        st.title("🗂️ Configuración de análisis")
        carpeta_default = "../data"
        if 'carpeta_temp' in st.session_state:
            carpeta_datos = st.text_input("Carpeta de datos", value=st.session_state.carpeta_temp, key="carpeta_datos")
            del st.session_state.carpeta_temp
        else:
            carpeta_datos = st.text_input("Carpeta de datos", value=carpeta_default, key="carpeta_datos")
        if st.button("Buscar carpeta de datos"):
            try:
                import tkinter as tk
                from tkinter import filedialog
                root = tk.Tk()
                root.withdraw()
                root.attributes('-topmost', True)
                carpeta_seleccionada = filedialog.askdirectory(title="Selecciona la carpeta de datos")
                root.destroy()
                if carpeta_seleccionada:
                    st.session_state.carpeta_temp = carpeta_seleccionada
                    st.rerun()
            except Exception as e:
                st.error(f"Error al abrir el explorador: {e}")
        st.markdown("---")
        icc_default = "../data/ICC/resultados_icc_alto.csv"
        if 'archivo_icc_temp' in st.session_state:
            archivo_icc = st.text_input("Archivo ICC", value=st.session_state.archivo_icc_temp, key="archivo_icc")
            del st.session_state.archivo_icc_temp
        else:
            archivo_icc = st.text_input("Archivo ICC", value=icc_default, key="archivo_icc")
        if st.button("Buscar archivo ICC"):
            try:
                import tkinter as tk
                from tkinter import filedialog
                root = tk.Tk()
                root.withdraw()
                root.attributes('-topmost', True)
                archivo_seleccionado = filedialog.askopenfilename(title="Selecciona el archivo ICC", filetypes=[("CSV files", "*.csv")])
                root.destroy()
                if archivo_seleccionado:
                    st.session_state.archivo_icc_temp = archivo_seleccionado
                    st.rerun()
            except Exception as e:
                st.error(f"Error al abrir el explorador: {e}")
        st.markdown("---")
        ruta_base = st.session_state.get("carpeta_datos", carpeta_default)
        ruta_icc = st.session_state.get("archivo_icc", icc_default)
        if os.path.isdir(ruta_base):
            sujetos_ejs = listar_sujetos_y_ejercicios(ruta_base)
            if sujetos_ejs:
                sujeto_sel = st.session_state.get('sujeto_sel', sorted(sujetos_ejs.keys())[0])
                ejercicio_sel = st.session_state.get('ejercicio_sel', sujetos_ejs[sujeto_sel][0])
                sujeto_sel, ejercicio_sel = panel_seleccion_sujeto_ejercicio(sujetos_ejs, sujeto_sel, ejercicio_sel)
                st.session_state.sujeto_sel = sujeto_sel
                st.session_state.ejercicio_sel = ejercicio_sel
                st.markdown("---")
                registros = cargar_archivos_sujeto_ejercicio(ruta_base, sujeto_sel, ejercicio_sel)
                total_reg = len(registros)
                completas = [s for s in registros if all(k in s for k in ['PpgHrv', 'ProcessedPpg', 'ProcessedMocap'])]
                incompletas = [s for s in registros if not all(k in s for k in ['PpgHrv', 'ProcessedPpg', 'ProcessedMocap'])]
                st.info(f"📊 Total de registros encontrados: {total_reg}")
                st.success(f"✅ Registros completos (3 archivos): {len(completas)}")
                st.warning(f"⚠️ Registros incompletos: {len(incompletas)}")
                try:
                    import pandas as pd
                    icc_df = pd.read_csv(ruta_icc)
                    n_vars_icc = icc_df['variable'].nunique()
                    st.info(f"🔍 Variables biomecánicas filtradas por ICC: {n_vars_icc}")
                except Exception as e:
                    st.warning(f"No se pudo leer el archivo ICC para contar variables: {e}")
                panel_conexion_db(DB_HOST, DB_PORT, DB_NAME, DB_USER, st.session_state.get('db_status', 'Desconectado'))
                if st.button("🔄 Procesar evaluación grupal", key="process_batch"):
                    with st.spinner("Procesando registros..."):
                        try:
                            resumen = procesar_simulaciones(completas, ruta_icc)
                            st.session_state.resumen_batch = resumen
                            st.session_state.registros_batch = completas
                            if st.session_state.get('gemini_available', False):
                                with st.spinner("Consultando Gemini IA para informe automático..."):
                                    informe_ia, logs_ia = generar_informe_ia(resumen['resumen_fisiologico'], resumen['resumen_biomecanico'])
                                    st.session_state.informe_ia_batch = informe_ia
                                    st.session_state.logs_ia_batch = logs_ia
                                    if informe_ia:
                                        st.success("✅ Informe de IA generado correctamente.")
                                    else:
                                        st.error("❌ No se pudo generar el informe de IA. Revisa los logs de depuración arriba.")
                            else:
                                st.warning("⚠️ Los módulos de IA no están disponibles.")
                            st.success(f"✅ Procesamiento exitoso: {len(completas)} registros completos procesados.")
                            st.rerun()
                        except Exception as e:
                            st.error(f"❌ Error al procesar registros: {str(e)}")
            else:
                st.warning("⚠️ No se detectaron sujetos ni ejercicios en la carpeta seleccionada.")
        else:
            st.warning("⚠️ La carpeta de datos no existe o no es válida.")

    # --- PANEL PRINCIPAL ---
    if 'resumen_batch' in st.session_state:
        resumen = st.session_state['resumen_batch']
        sujeto_sel = st.session_state.get('sujeto_sel', '')
        ejercicio_sel = st.session_state.get('ejercicio_sel', '')
        registros_batch = st.session_state.get('registros_batch', [])
        informe_ia = st.session_state.get('informe_ia_batch', None)
        mostrar_resultados_batch(resumen, sujeto_sel, ejercicio_sel, registros_batch, obtener_descripcion_variable, informe_ia)
        st.markdown("---")
        st.subheader("📄 Exportación y envío")
        col1, col2 = st.columns(2)
        with col1:
            if st.button("📥 Exportar PDF"):
                try:
                    buffer = generar_pdf_batch(
                        sujeto_sel,
                        ejercicio_sel,
                        len(registros_batch),
                        resumen['resumen_fisiologico'],
                        resumen['resumen_biomecanico'],
                        informe_ia
                    )
                    st.session_state.pdf_buffer = buffer
                    st.success("✅ PDF generado correctamente")
                    st.rerun()
                except Exception as e:
                    st.error(f"❌ Error al generar PDF: {str(e)}")
        with col2:
            if st.button("📧 Enviar por email"):
                if 'pdf_buffer' in st.session_state:
                    st.session_state.show_email_form = True
                    st.rerun()
                else:
                    st.warning("⚠️ Primero debes generar el PDF")
        if st.session_state.get('show_email_form', False) and 'pdf_buffer' in st.session_state:
            st.markdown("---")
            st.subheader("📧 Configuración de envío por email")
            col_email1, col_email2 = st.columns([2, 1])
            with col_email1:
                email_destino = st.text_input("Email de destino:", key="email_destino", placeholder="ejemplo@empresa.com")
            with col_email2:
                if st.button("Enviar", key="send_email", type="primary"):
                    if email_destino and "@" in email_destino:
                        with st.spinner("Enviando email..."):
                            success, message = enviar_email_pdf(
                                st.session_state.pdf_buffer,
                                sujeto_sel,
                                ejercicio_sel,
                                email_destino
                            )
                            if success:
                                st.success(message)
                                st.session_state.show_email_form = False
                                st.rerun()
                            else:
                                st.error(message)
                    else:
                        st.error("❌ Por favor ingresa un email válido")
            if st.button("Cancelar", key="cancel_email"):
                st.session_state.show_email_form = False
                st.rerun()
        if 'pdf_buffer' in st.session_state:
            st.download_button(
                label="💾 Descargar PDF",
                data=st.session_state.pdf_buffer,
                file_name=f"reporte_ergonomia_{sujeto_sel}_{ejercicio_sel}.pdf",
                mime="application/pdf"
            )

if __name__ == "__main__":
    main()
