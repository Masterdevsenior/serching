import streamlit as st
from api_handler import enviar_a_api
from visualizer import show_hrv_graphs, show_joint_angles
from pdf_exporter import generar_pdf
from csv_loader import cargar_csv, extraer_metadatos
from db import guardar_resultado
import json
import os
import sys
import glob

# Inicializar session_state para manejar la evaluación de IA
if 'evaluacion_ia' not in st.session_state:
    st.session_state.evaluacion_ia = None
if 'gemini_available' not in st.session_state:
    st.session_state.gemini_available = False
if 'csv_folder' not in st.session_state:
    st.session_state.csv_folder = ''
if 'csv_files' not in st.session_state:
    st.session_state.csv_files = {}

try:
    from utils.gemini_client import obtener_respuesta_ia
    from utils.prompt_generator import generar_prompt_evaluacion
    from utils.processor import procesar_archivos_tiempo
    st.session_state.gemini_available = True
except ImportError as e:
    st.warning(f"⚠️ No se pudo importar módulos de IA: {e}")
    st.session_state.gemini_available = False

st.set_page_config(page_title="Evaluación Ergonomía", layout="wide")

st.title("🦾 Evaluación ergonómica con traje háptico Tesla Suit")

# --- PANEL IZQUIERDO ---
with st.sidebar:
    st.title("🗂️ Selección de carpeta de datos")
    st.write("Selecciona la carpeta donde están los archivos CSV de HRV, PPG y Mocap.")

    # Campo de texto para ruta
    carpeta = st.text_input("Ruta de la carpeta de datos", value=st.session_state.csv_folder, key="csv_folder_input")

    # Botón para explorar usando tkinter
    if st.button("Explorar", help="Abrir explorador de carpetas"):
        try:
            import tkinter as tk
            from tkinter import filedialog
            root = tk.Tk()
            root.withdraw()
            root.attributes('-topmost', True)
            carpeta_seleccionada = filedialog.askdirectory(title="Selecciona la carpeta de datos")
            root.destroy()
            if carpeta_seleccionada:
                st.session_state.csv_folder = carpeta_seleccionada
                st.rerun()
        except Exception as e:
            st.error(f"Error al abrir el explorador: {e}")

    # Buscar los 3 archivos requeridos si hay carpeta
    archivos_encontrados = {}
    if st.session_state.csv_folder and os.path.isdir(st.session_state.csv_folder):
        lista_archivos = os.listdir(st.session_state.csv_folder)
        archivos_lower = [archivo.lower() for archivo in lista_archivos]
        # HRV
        hrv_file = next((archivo for archivo in lista_archivos if archivo.lower().startswith('ppghrv') and archivo.lower().endswith('.csv')), None)
        if not hrv_file:
            hrv_file = next((archivo for archivo in lista_archivos if 'ppghrv' in archivo.lower() and archivo.lower().endswith('.csv')), None)
        # PPG
        ppg_file = next((archivo for archivo in lista_archivos if archivo.lower().startswith('processedppg') and archivo.lower().endswith('.csv')), None)
        if not ppg_file:
            ppg_file = next((archivo for archivo in lista_archivos if 'processedppg' in archivo.lower() and archivo.lower().endswith('.csv')), None)
        # Mocap
        mocap_file = next((archivo for archivo in lista_archivos if archivo.lower().startswith('processedmocap') and archivo.lower().endswith('.csv')), None)
        if not mocap_file:
            mocap_file = next((archivo for archivo in lista_archivos if 'processedmocap' in archivo.lower() and archivo.lower().endswith('.csv')), None)
        # Guardar rutas si existen
        if hrv_file:
            archivos_encontrados['hrv'] = os.path.join(st.session_state.csv_folder, hrv_file)
        if ppg_file:
            archivos_encontrados['ppg'] = os.path.join(st.session_state.csv_folder, ppg_file)
        if mocap_file:
            archivos_encontrados['mocap'] = os.path.join(st.session_state.csv_folder, mocap_file)
        st.session_state.csv_files = archivos_encontrados

    # Mostrar estado de archivos encontrados
    st.markdown("---")
    st.subheader("Archivos requeridos:")
    col1, col2 = st.columns([1,4])
    with col1:
        st.write("HRV:")
        st.write("PPG:")
        st.write("Mocap:")
    with col2:
        if 'hrv' in st.session_state.csv_files:
            st.success(os.path.basename(st.session_state.csv_files['hrv']))
        else:
            st.error("No encontrado")
        if 'ppg' in st.session_state.csv_files:
            st.success(os.path.basename(st.session_state.csv_files['ppg']))
        else:
            st.error("No encontrado")
        if 'mocap' in st.session_state.csv_files:
            st.success(os.path.basename(st.session_state.csv_files['mocap']))
        else:
            st.error("No encontrado")

    # Botón para procesar si están los 3 archivos
    puede_procesar = all(k in st.session_state.csv_files for k in ['hrv','ppg','mocap'])
    if puede_procesar:
        if st.button("Procesar archivos CSV de la carpeta", key="process_csv_folder"):
            with st.spinner("Procesando archivos de la carpeta seleccionada..."):
                try:
                    paths = {
                        'PpgHrv': st.session_state.csv_files['hrv'],
                        'ProcessedPpg': st.session_state.csv_files['ppg'],
                        'ProcessedMocap': st.session_state.csv_files['mocap']
                    }
                    resumen = procesar_archivos_tiempo(paths)
                    st.session_state.resumen_data = resumen
                    st.session_state.processing_done = True
                    st.success("✅ Archivos procesados correctamente")
                except Exception as e:
                    st.error(f"❌ Error al procesar archivos: {str(e)}")
    else:
        st.info("Selecciona una carpeta válida con los 3 archivos CSV requeridos.")

    st.markdown("---")
    st.info("Puedes seguir usando la carga manual de archivos en la pestaña principal si lo prefieres.")

# --- FIN PANEL IZQUIERDO ---

# Mostrar resultados si se procesó desde el panel izquierdo
if st.session_state.get('processing_done', False) and st.session_state.get('resumen_data'):
    st.header("Resultados del procesamiento de carpeta")
    resumen = st.session_state.resumen_data
    st.subheader("🔬 Fisiología")
    show_hrv_graphs(resumen["resumen_fisiologico"])
    st.subheader("🦿 Biomecánica")
    show_joint_angles(resumen["resumen_biomecanico"])

    # --- Botón para evaluación con IA ---
    st.markdown("---")
    st.subheader("🤖 Evaluación automática con Google Gemini IA")
    st.caption("Modelo: gemini-pro | Versión API: v1beta")
    ia_error = None
    ia_respuesta = None
    if st.button("Evaluar con IA (Google Gemini)", key="eval_ia_gemini"):
        with st.spinner("Consultando Google Gemini IA..."):
            try:
                prompt = generar_prompt_evaluacion(resumen)
                respuesta_ia = obtener_respuesta_ia(prompt)
                if respuesta_ia and not respuesta_ia.lower().startswith("error"):
                    ia_respuesta = respuesta_ia
                else:
                    ia_error = f"Error en la respuesta de IA: {respuesta_ia}"
            except Exception as e:
                ia_error = f"❌ Error al conectar con Google Gemini: {str(e)}"
        if ia_respuesta:
            st.session_state.evaluacion_ia = ia_respuesta
            st.success("Evaluación generada correctamente.")
        elif ia_error:
            st.session_state.evaluacion_ia = None
            st.error(ia_error)
    # Mostrar resultado IA si existe
    if st.session_state.evaluacion_ia:
        st.markdown("#### Respuesta de la IA:")
        st.info(st.session_state.evaluacion_ia)

    st.session_state.processing_done = False

# El resto de la app (pestañas, carga manual, etc.) sigue igual...
