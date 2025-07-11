import streamlit as st
import os
from data_loader import listar_sujetos_y_ejercicios, cargar_archivos_sujeto_ejercicio
from processor import procesar_simulaciones
from utils.gemini_client import obtener_respuesta_ia
from pdf_exporter import generar_pdf_batch

st.set_page_config(page_title="Evaluación de ergonomía postural y Salud Ocupacional - Predicción de riesgos musculoesqueléticos y Prescripción ergonómica y recomendaciones", layout="wide")
st.title("Evaluación de ergonomía postural y Salud Ocupacional - Predicción de riesgos musculoesqueléticos y Prescripción ergonómica y recomendaciones")

# Panel izquierdo
with st.sidebar:
    st.header("Evaluación de ergonomía postural y Salud Ocupacional - Predicción de riesgos musculoesqueléticos y Prescripción ergonómica y recomendaciones")
    # Selector de carpeta de datos
    carpeta_default = "../data"
    # Si hay un valor temporal, usarlo; sino usar el default
    if 'carpeta_temp' in st.session_state:
        carpeta_datos = st.text_input("Carpeta de datos", value=st.session_state.carpeta_temp, key="carpeta_datos")
        # Limpiar el valor temporal después de usarlo
        del st.session_state.carpeta_temp
    else:
        carpeta_datos = st.text_input("Carpeta de datos", value=carpeta_default, key="carpeta_datos")
    if st.button("Buscar carpeta de datos"):
        import tkinter as tk
        from tkinter import filedialog
        root = tk.Tk()
        root.withdraw()
        root.attributes('-topmost', True)
        carpeta_seleccionada = filedialog.askdirectory(title="Selecciona la carpeta de datos")
        root.destroy()
        if carpeta_seleccionada:
            # Usar una clave temporal para evitar el conflicto con el widget
            st.session_state.carpeta_temp = carpeta_seleccionada
            st.rerun()
    st.markdown("---")
    # Selector de archivo ICC
    icc_default = "../data/ICC/resultados_icc_alto.csv"
    # Si hay un valor temporal, usarlo; sino usar el default
    if 'archivo_icc_temp' in st.session_state:
        archivo_icc = st.text_input("Filtrado ICC", value=st.session_state.archivo_icc_temp, key="archivo_icc")
        # Limpiar el valor temporal después de usarlo
        del st.session_state.archivo_icc_temp
    else:
        archivo_icc = st.text_input("Filtrado ICC", value=icc_default, key="archivo_icc")
    if st.button("Buscar archivo ICC"):
        import tkinter as tk
        from tkinter import filedialog
        root = tk.Tk()
        root.withdraw()
        root.attributes('-topmost', True)
        archivo_seleccionado = filedialog.askopenfilename(title="Selecciona el archivo ICC", filetypes=[("CSV files", "*.csv")])
        root.destroy()
        if archivo_seleccionado:
            # Usar una clave temporal para evitar el conflicto con el widget
            st.session_state.archivo_icc_temp = archivo_seleccionado
            st.rerun()
    st.markdown("---")
    # Detectar sujetos y ejercicios
    ruta_base = st.session_state.get("carpeta_datos", carpeta_default)
    ruta_icc = st.session_state.get("archivo_icc", icc_default)
    sujetos_ejs = listar_sujetos_y_ejercicios(ruta_base)
    if sujetos_ejs:
        sujeto_sel = st.selectbox("Selecciona el sujeto", sorted(sujetos_ejs.keys()))
        ejercicios = sujetos_ejs[sujeto_sel]
        ejercicio_sel = st.selectbox("Selecciona el ejercicio", ejercicios)
        st.session_state.sujeto_sel = sujeto_sel
        st.session_state.ejercicio_sel = ejercicio_sel
        st.markdown("---")
        # Cargar todas las evaluaciones (completas e incompletas)
        registros = cargar_archivos_sujeto_ejercicio(ruta_base, sujeto_sel, ejercicio_sel)
        total_reg = len(registros)
        completas = [s for s in registros if all(k in s for k in ['PpgHrv', 'ProcessedPpg', 'ProcessedMocap'])]
        incompletas = [s for s in registros if not all(k in s for k in ['PpgHrv', 'ProcessedPpg', 'ProcessedMocap'])]
        st.info(f"Total de registros encontrados: {total_reg}")
        st.success(f"Registros completos (3 archivos): {len(completas)}")
        st.warning(f"Registros incompletos: {len(incompletas)}")
        # Mostrar cantidad de variables filtradas por ICC
        try:
            import pandas as pd
            icc_df = pd.read_csv(ruta_icc)
            n_vars_icc = icc_df['variable'].nunique()
            st.info(f"Variables biomecánicas filtradas por ICC: {n_vars_icc}")
        except Exception as e:
            st.warning(f"No se pudo leer el archivo ICC para contar variables: {e}")
        if completas:
            if st.button("Procesar evaluación grupal"):
                resumen = procesar_simulaciones(completas, ruta_icc)
                st.session_state.resumen_batch = resumen
                st.session_state.registros_batch = completas
                # Preparar prompt para Gemini IA
                prompt = f"""
Eres un experto en ergonomía y salud ocupacional.
Objetivo: Analisis de información de fisiología y biomecánica para identificar riesgos ergonómicos, Prescripción ergonómica y recomendaciones.

Analiza los siguientes resultados grupales:
---
Fisiología (promedio):\n{resumen['resumen_fisiologico']}
---
Parámetros biomecánicos:\n{resumen['resumen_biomecanico']}
---
Genera un informe profesional, breve y claro, que incluya:
- Identificación de riesgos ergonómicos
- Prescripción ergonómica
- Recomendaciones prácticas
(No uses formato markdown, responde solo en texto plano para un informe PDF.)
"""
                with st.spinner("Consultando Gemini IA para informe automático..."):
                    respuesta_ia = obtener_respuesta_ia(prompt)
                st.session_state.informe_ia_batch = respuesta_ia
                st.success(f"Procesamiento exitoso: {len(completas)} registros completos encontrados.")
        else:
            st.error("No se encontraron registros completos para ese sujeto y ejercicio.")
    else:
        st.warning("No se detectaron sujetos ni ejercicios en la carpeta seleccionada.")

# Panel principal
if 'resumen_batch' in st.session_state:
    resumen = st.session_state['resumen_batch']
    sujeto_sel = st.session_state.get('sujeto_sel', '')
    ejercicio_sel = st.session_state.get('ejercicio_sel', '')
    registros_batch = st.session_state.get('registros_batch', [])
    st.header(f"Resultados promedio - Sujeto: {sujeto_sel}, Ejercicio: {ejercicio_sel}")
    st.subheader("🔬 Fisiología (promedio)")
    st.json(resumen['resumen_fisiologico'])
    st.subheader("🦿 Parámetros biomecánicos")
    st.write(f"Variables biomecánicas filtradas: {len(resumen['resumen_biomecanico'])}")
    st.json(resumen['resumen_biomecanico'])
    # Mostrar informe IA si existe
    informe_ia = st.session_state.get('informe_ia_batch', None)
    if informe_ia:
        st.markdown("---")
        st.subheader("Informe de Análisis Ergonómico")
        ia_text = informe_ia
        if (
            ia_text.startswith("Error 503") or 
            "model is overloaded" in ia_text or 
            "UNAVAILABLE" in ia_text
        ):
            st.error("El servicio de IA está temporalmente saturado o no disponible. Por favor, intenta nuevamente en unos minutos.")
        elif "Timeout" in ia_text or "tardó demasiado" in ia_text:
            st.error("El análisis automático por IA tardó demasiado en responder. Por favor, intenta nuevamente en unos minutos. Si el problema persiste, verifica tu conexión a internet.")
        else:
            st.info(ia_text)
    # Botón para exportar PDF grupal
    if st.button("Exportar PDF"):
        buffer = generar_pdf_batch(
            sujeto_sel,
            ejercicio_sel,
            len(registros_batch),
            resumen['resumen_fisiologico'],
            resumen['resumen_biomecanico'],
            informe_ia
        )
        st.download_button(
            label="Descargar PDF",
            data=buffer,
            file_name=f"reporte_grupal_{sujeto_sel}_{ejercicio_sel}.pdf",
            mime="application/pdf"
        ) 