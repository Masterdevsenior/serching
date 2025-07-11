import streamlit as st
from visualizer import show_hrv_graphs, show_joint_angles
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

# Cambiar el nombre de la app en la configuración y el título principal
st.set_page_config(page_title="Evaluación de ergonomía postural y Salud Ocupacional - Predicción de riesgos musculoesqueléticos y Prescripción ergonómica y recomendaciones", layout="wide")

st.title("Evaluación de ergonomía postural y Salud Ocupacional - Predicción de riesgos musculoesqueléticos y Prescripción ergonómica y recomendaciones")

def mostrar_resultados(resumen):
    # Extraer y mostrar información estructurada del nombre de la carpeta
    carpeta = st.session_state.get('csv_folder', '')
    if carpeta:
        nombre_carpeta = os.path.basename(carpeta)
        partes = [p.strip() for p in nombre_carpeta.split('-')]
        persona = partes[1] if len(partes) > 1 else 'N/A'
        simulacion = partes[2] if len(partes) > 2 else 'N/A'
        ejercicio = partes[3] if len(partes) > 3 else 'N/A'
        carga_raw = partes[4] if len(partes) > 4 else 'N/A'
        valoracion = partes[5] if len(partes) > 5 else 'N/A'
        # Traducir carga
        if carga_raw.upper() == 'CC':
            carga = 'Con Carga'
        elif carga_raw.upper() == 'SC':
            carga = 'Sin Carga'
        else:
            carga = carga_raw
        st.markdown(f"""
        <div style='font-size:1.1em; font-weight:bold;'>
        🧑‍💼 Sujeto: {persona} &emsp; 📝 Simulación: {simulacion} &emsp; 🏋️‍♂️ Ejercicio: {ejercicio} &emsp; 📦 Carga: {carga} &emsp; ✅ Valoración: {valoracion}
        </div>
        """, unsafe_allow_html=True)
    st.header("Resultados del procesamiento de carpeta")
    st.subheader("🔬 Fisiología")
    show_hrv_graphs(resumen["resumen_fisiologico"])
    st.subheader("🦿 Biomecánica")
    show_joint_angles(resumen["resumen_biomecanico"])

    st.markdown("---")
    st.subheader("🤖 Evaluación automática con Google Gemini IA")
    st.caption("Modelo: gemini-1.5-flash | Versión API: v1beta")

    if not st.session_state.get('gemini_available', False):
        st.warning("⚠️ Los módulos de IA no están disponibles. Verifica las importaciones.")
    else:
        if st.button("Evaluar con IA (Google Gemini)", key="eval_ia_gemini"):
            with st.spinner("Consultando Google Gemini IA..."):
                try:
                    prompt = generar_prompt_evaluacion(resumen)
                    st.info(f"Prompt generado ({len(prompt)} caracteres)")
                    respuesta_ia = obtener_respuesta_ia(prompt, timeout=60)
                    if respuesta_ia and not respuesta_ia.lower().startswith("error"):
                        st.session_state.evaluacion_ia = respuesta_ia
                        st.success("✅ Evaluación generada correctamente.")
                        st.rerun()
                    else:
                        st.error(f"❌ Error en la respuesta de IA: {respuesta_ia}")
                except Exception as e:
                    st.error(f"❌ Error al conectar con Google Gemini: {str(e)}")
                    st.error(f"Detalles del error: {type(e).__name__}")
        if st.session_state.evaluacion_ia:
            st.markdown("#### 📋 Respuesta de la IA:")
            st.info(st.session_state.evaluacion_ia)
            if st.button("Limpiar evaluación", key="clear_eval"):
                st.session_state.evaluacion_ia = None
                st.rerun()

def main():
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

        # Mejor visualización de archivos requeridos
        st.markdown("---")
        st.subheader("📄 Archivos requeridos:")
        archivos = [
            ("HRV", "🧬", 'hrv'),
            ("PPG", "💓", 'ppg'),
            ("Mocap", "🦿", 'mocap')
        ]
        for nombre, icono, clave in archivos:
            if clave in st.session_state.csv_files:
                archivo = os.path.basename(st.session_state.csv_files[clave])
                st.markdown(f"{icono} **{nombre}:** <span style='color:green'>✅ {archivo}</span>", unsafe_allow_html=True)
            else:
                st.markdown(f"{icono} **{nombre}:** <span style='color:red'>❌ No encontrado</span>", unsafe_allow_html=True)
        # Mensaje si falta alguno
        if not all(k in st.session_state.csv_files for k in ['hrv','ppg','mocap']):
            st.warning("Debes seleccionar una carpeta válida que contenga los 3 archivos CSV requeridos para poder procesar los datos.")

        # Botón para procesar si están los 3 archivos
        puede_procesar = all(k in st.session_state.csv_files for k in ['hrv','ppg','mocap'])
        if puede_procesar:
            col_a, col_b, col_c = st.columns([1,2,1])
            boton_procesar = False
            with col_b:
                if st.button("Procesar archivos CSV", key="process_csv_folder"):
                    boton_procesar = True
            if boton_procesar:
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
                    except Exception as e:
                        st.error(f"❌ Error al procesar archivos: {str(e)}")
            if st.session_state.get('processing_done', False):
                st.success("Archivos procesados correctamente")
        else:
            st.info("Selecciona una carpeta válida con los 3 archivos CSV requeridos.")

        st.markdown("---")
        st.info("Puedes seguir usando la carga manual de archivos en la pestaña principal si lo prefieres.")

    # --- FIN PANEL IZQUIERDO ---

    # Mostrar resultados si se procesó desde el panel izquierdo
    if st.session_state.get('processing_done', False) and st.session_state.get('resumen_data'):
        mostrar_resultados(st.session_state.resumen_data)

# Llamar a main
main()
