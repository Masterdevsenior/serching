import streamlit as st
import sys
import os
sys.path.insert(0, os.path.abspath(os.path.dirname(__file__)))
import data_processing

# Configuración de la página - DEBE SER LA PRIMERA LLAMADA DE STREAMLIT
st.set_page_config(
    page_title="Procesador de Datos Biométricos",
    layout="wide",
    initial_sidebar_state="expanded"
)

import re
import pandas as pd
import logging
from pathlib import Path
import time
from datetime import datetime
import plotly.express as px
import plotly.graph_objects as go
from streamlit_extras.metric_cards import style_metric_cards
import base64
import json

# Estilos CSS personalizados
st.markdown("""
<style>
    .main-header {
        background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
        padding: 2rem;
        border-radius: 10px;
        color: white;
        text-align: center;
        margin-bottom: 2rem;
    }
    
    .metric-card {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        padding: 1rem;
        border-radius: 10px;
        color: white;
        text-align: center;
    }
    
    .success-box {
        background-color: #d4edda;
        border: 1px solid #c3e6cb;
        border-radius: 5px;
        padding: 1rem;
        margin: 1rem 0;
    }
    
    .error-box {
        background-color: #f8d7da;
        border: 1px solid #f5c6cb;
        border-radius: 5px;
        padding: 1rem;
        margin: 1rem 0;
    }
    
    .info-box {
        background-color: #d1ecf1;
        border: 1px solid #bee5eb;
        border-radius: 5px;
        padding: 1rem;
        margin: 1rem 0;
    }
    
    .stProgress > div > div > div > div {
        background-color: #667eea;
    }
    
    /* Estilos para botones de exploración */
    .explore-button {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        border: none;
        border-radius: 8px;
        color: white;
        padding: 0.5rem 1rem;
        font-weight: 500;
        transition: all 0.3s ease;
    }
    
    .explore-button:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
    }
    
    /* Estilos para el código de directorio */
    .directory-code {
        background-color: #f8f9fa;
        border: 1px solid #e9ecef;
        border-radius: 6px;
        padding: 0.5rem;
        font-family: 'Courier New', monospace;
        font-size: 0.9rem;
    }
</style>
""", unsafe_allow_html=True)

# Configuración de logging
logging.basicConfig(level=logging.INFO, format="%(levelname)s - %(message)s")

# Constantes actualizadas para la nueva estructura
PATRON_FECHA_HORA = re.compile(r'^\d{4}-\d{2}-\d{2}[-_]\d{2}-\d{2}-\d{2}$')
SCENE_CAPTURE_PATTERN = re.compile(
    r'Scene Capture - (SUB\d+) - (S\d+) - (T\d+) - (CC|SC) - (OK|BAD)',
    re.IGNORECASE
)
CSV_PATTERN = re.compile(
    r'.*\.csv$',
    re.IGNORECASE
)
TIPOS_VALIDOS = ['PpgHrv', 'ProcessedMocap', 'ProcessedPpg', 'RawMocap', 'RawPpg']

# Función para obtener el directorio base
def get_base_dir():
    """Obtiene el directorio base de datos"""
    return os.path.join(os.path.dirname(__file__), "data")

# Función para obtener el archivo de histórico
def get_history_file():
    """Obtiene la ruta del archivo de histórico"""
    return os.path.join(os.path.dirname(__file__), "fusion_history.json")

# Función para cargar el histórico de fusiones
def cargar_historico():
    """Carga el histórico de fusiones desde el archivo JSON"""
    history_file = get_history_file()
    try:
        if os.path.exists(history_file):
            with open(history_file, 'r', encoding='utf-8') as f:
                return json.load(f)
        else:
            return []
    except Exception as e:
        st.error(f"Error cargando histórico: {e}")
        return []

# Función para guardar una nueva fusión en el histórico
def guardar_fusion_en_historico(resultados_totales, directorio_base):
    """Guarda la información de una fusión en el histórico"""
    try:
        # Cargar histórico existente
        historico = cargar_historico()
        
        # Crear entrada de la nueva fusión
        nueva_fusion = {
            "fecha": datetime.now().isoformat(),
            "directorio": directorio_base,
            "resumen": {
                "carpetas_procesadas": len(resultados_totales),
                "total_archivos": sum(r["archivos_procesados"] for r in resultados_totales),
                "total_errores": sum(len(r["errores"]) for r in resultados_totales),
                "tasa_exito": round(((sum(r["archivos_procesados"] for r in resultados_totales) - 
                                    sum(len(r["errores"]) for r in resultados_totales)) / 
                                   max(sum(r["archivos_procesados"] for r in resultados_totales), 1) * 100), 2)
            },
            "detalles_por_carpeta": []
        }
        
        # Agregar detalles por carpeta
        for resultado in resultados_totales:
            carpeta_info = {
                "fecha_hora": resultado["fecha_hora"],
                "archivos_procesados": resultado["archivos_procesados"],
                "total_archivos": resultado["total_archivos"],
                "errores": len(resultado["errores"]),
                "tipos_procesados": {}
            }
            
            # Agregar información por tipo
            for tipo, datos in resultado["resultados_fusion"].items():
                if datos['archivos_procesados'] > 0:
                    carpeta_info["tipos_procesados"][tipo] = {
                        "archivos": datos['archivos_procesados'],
                        "filas": datos['filas_totales']
                    }
            
            nueva_fusion["detalles_por_carpeta"].append(carpeta_info)
        
        # Agregar al histórico
        historico.append(nueva_fusion)
        
        # Mantener solo los últimos 50 registros
        if len(historico) > 50:
            historico = historico[-50:]
        
        # Guardar en archivo
        history_file = get_history_file()
        with open(history_file, 'w', encoding='utf-8') as f:
            json.dump(historico, f, indent=2, ensure_ascii=False)
        
        return True
        
    except Exception as e:
        st.error(f"Error guardando histórico: {e}")
        return False

# Función para crear gráficos del histórico
def crear_graficos_historico(historico):
    """Crea gráficos del histórico de procesamientos con mejor distribución"""
    if not historico:
        st.info("No hay datos históricos para mostrar.")
        return
    
    # Crear pestañas para mejor organización
    tab1, tab2, tab3 = st.tabs(["📊 Resumen General", "📈 Tendencias", "📋 Detalles por Ejecución"])
    
    with tab1:
        # Gráfico de líneas temporal
        fechas = [h["fecha"][:10] for h in historico]  # Solo fecha, sin hora
        carpetas_procesadas = [h["resumen"]["carpetas_procesadas"] for h in historico]
        archivos_procesados = [h["resumen"]["total_archivos"] for h in historico]
        
        fig_timeline = go.Figure()
        
        fig_timeline.add_trace(go.Scatter(
            x=fechas, y=carpetas_procesadas,
            mode='lines+markers',
            name='Carpetas Procesadas',
            line=dict(color='#1f77b4', width=3),
            marker=dict(size=8)
        ))
        
        fig_timeline.add_trace(go.Scatter(
            x=fechas, y=archivos_procesados,
            mode='lines+markers',
            name='Archivos Procesados',
            line=dict(color='#ff7f0e', width=3),
            marker=dict(size=8),
            yaxis='y2'
        ))
        
        fig_timeline.update_layout(
            title="Evolución del Procesamiento a lo Largo del Tiempo",
            xaxis_title="Fecha",
            yaxis_title="Carpetas Procesadas",
            yaxis2=dict(title="Archivos Procesados", overlaying='y', side='right'),
            height=400,
            showlegend=True,
            hovermode='x unified'
        )
        
        st.plotly_chart(fig_timeline, use_container_width=True)
        
        # Métricas de rendimiento
        col1, col2, col3 = st.columns(3)
        with col1:
            tasa_exito_actual = historico[-1]["resumen"]["tasa_exito"]
            st.metric("Tasa de Éxito Actual", f"{tasa_exito_actual}%")
        with col2:
            tiempo_promedio = sum(h.get("tiempo_ejecucion", 0) for h in historico) / len(historico)
            st.metric("Tiempo Promedio", f"{tiempo_promedio:.1f}s")
        with col3:
            archivos_por_ejecucion = sum(h["resumen"]["total_archivos"] for h in historico) / len(historico)
            st.metric("Archivos/Ejecución", f"{archivos_por_ejecucion:.0f}")
    
    with tab2:
        # Gráfico de tendencias de tasa de éxito
        tasas_exito = [h["resumen"]["tasa_exito"] for h in historico]
        
        fig_trend = go.Figure()
        fig_trend.add_trace(go.Scatter(
            x=fechas, y=tasas_exito,
            mode='lines+markers',
            name='Tasa de Éxito (%)',
            line=dict(color='#2ca02c', width=3),
            marker=dict(size=8)
        ))
        
        fig_trend.update_layout(
            title="Tendencia de Tasa de Éxito",
            xaxis_title="Fecha",
            yaxis_title="Tasa de Éxito (%)",
            height=400,
            yaxis=dict(range=[0, 100])
        )
        
        st.plotly_chart(fig_trend, use_container_width=True)
        
        # Análisis de tendencias
        if len(tasas_exito) > 1:
            tendencia = "↗️ Mejorando" if tasas_exito[-1] > tasas_exito[0] else "↘️ Deteriorando" if tasas_exito[-1] < tasas_exito[0] else "➡️ Estable"
            st.info(f"**Tendencia general:** {tendencia}")
    
    with tab3:
        # Tabla detallada de ejecuciones
        st.subheader("Detalles de Ejecuciones Recientes")
        
        # Crear DataFrame para la tabla
        datos_tabla = []
        for h in historico[-10:]:  # Solo las últimas 10 ejecuciones
            datos_tabla.append({
                "Fecha": h["fecha"][:19].replace("T", " "),
                "Carpetas": h["resumen"]["carpetas_procesadas"],
                "Archivos": h["resumen"]["total_archivos"],
                "Errores": h["resumen"]["total_errores"],
                "Tasa Éxito": f"{h['resumen']['tasa_exito']}%"
            })
        
        if datos_tabla:
            df_historico = pd.DataFrame(datos_tabla)
            st.dataframe(df_historico, use_container_width=True)
        
        # Expandible con información detallada de la última ejecución
        if historico:
            with st.expander("📋 Detalles de la Última Ejecución"):
                ultima = historico[-1]
                st.write(f"**Fecha:** {ultima['fecha']}")
                st.write(f"**Directorio:** {ultima['directorio']}")
                st.write(f"**Carpetas procesadas:** {ultima['resumen']['carpetas_procesadas']}")
                st.write(f"**Archivos totales:** {ultima['resumen']['total_archivos']}")
                st.write(f"**Errores:** {ultima['resumen']['total_errores']}")
                st.write(f"**Tasa de éxito:** {ultima['resumen']['tasa_exito']}%")
                
                # Detalles por carpeta
                if ultima['detalles_por_carpeta']:
                    st.write("**Detalles por carpeta:**")
                    for detalle in ultima['detalles_por_carpeta']:
                        st.write(f"- {detalle['fecha_hora']}: {detalle['archivos_procesados']}/{detalle['total_archivos']} archivos procesados")

# Función para encontrar el directorio de datos correcto
def find_data_directory(selected_path):
    """Encuentra el directorio de datos correcto, buscando subcarpetas si es necesario"""
    if not selected_path or not os.path.exists(selected_path):
        return None
    
    # Verificar si el directorio seleccionado tiene carpetas de fecha/hora directamente
    directorios = validar_directorios(selected_path)
    if directorios:
        return selected_path
    
    # Si no, buscar una subcarpeta llamada 'data' o 'datos'
    posibles_subcarpetas = ['data', 'datos', 'Data', 'Datos']
    
    for subcarpeta in posibles_subcarpetas:
        subcarpeta_path = os.path.join(selected_path, subcarpeta)
        if os.path.exists(subcarpeta_path) and os.path.isdir(subcarpeta_path):
            directorios = validar_directorios(subcarpeta_path)
            if directorios:
                return subcarpeta_path
    
    # Si no encuentra nada, devolver el directorio original
    return selected_path

# Función para validar directorios
def validar_directorios(base_dir):
    """Valida y retorna las carpetas de fecha/hora válidas"""
    if not os.path.exists(base_dir):
        return []
    
    return [
        os.path.join(base_dir, d) for d in os.listdir(base_dir)
        if os.path.isdir(os.path.join(base_dir, d)) and PATRON_FECHA_HORA.match(d)
    ]

# Función para buscar archivos CSV
def buscar_archivos_csv(fecha_hora_path):
    """Busca archivos CSV válidos en el directorio de fecha/hora especificado"""
    archivos = []
    fecha_hora = os.path.basename(fecha_hora_path)

    for root, dirs, files in os.walk(fecha_hora_path):
        # Buscar carpetas que coincidan con el patrón Scene Capture
        for dir_name in dirs:
            match = SCENE_CAPTURE_PATTERN.match(dir_name)
            if match:
                scene_capture_path = os.path.join(root, dir_name)
                
                # Buscar archivos CSV en esta carpeta
                for file in os.listdir(scene_capture_path):
                    if file.endswith('.csv') and CSV_PATTERN.match(file):
                        file_path = os.path.join(scene_capture_path, file)
                        
                        # Detectar tipo de archivo basado en el contenido o nombre
                        tipo_detectado = detectar_tipo_archivo(file_path, file)
                        
                        archivos.append({
                            "path": file_path,
                            "sujeto": match.group(1),      # SUB1, SUB2, etc.
                            "sesion": match.group(2),      # S1, S2, etc.
                            "tiempo": match.group(3),      # T1, T2, etc.
                            "tipo_captura": match.group(4), # CC o SC
                            "resultado": match.group(5),   # OK o BAD
                            "fecha_hora": fecha_hora,      # Nombre de la carpeta padre
                            "tipo": tipo_detectado,        # Tipo de archivo CSV
                            "nombre_original": file
                        })
    
    return archivos

# Función para detectar el tipo de archivo
def detectar_tipo_archivo(file_path, file_name):
    """Detecta el tipo de archivo basado en el nombre o contenido"""
    # Intentar detectar por nombre del archivo
    for tipo in TIPOS_VALIDOS:
        if tipo.lower() in file_name.lower():
            return tipo
    
    # Si no se detecta por nombre, intentar por contenido
    try:
        df = pd.read_csv(file_path, nrows=5)  # Leer solo las primeras 5 filas
        columnas = df.columns.tolist()
        
        # Detectar tipo basado en las columnas
        if any('ppg' in col.lower() for col in columnas):
            if any('hrv' in col.lower() for col in columnas):
                return 'PpgHrv'
            elif any('processed' in col.lower() for col in columnas):
                return 'ProcessedPpg'
            else:
                return 'RawPpg'
        elif any('mocap' in col.lower() for col in columnas):
            if any('processed' in col.lower() for col in columnas):
                return 'ProcessedMocap'
            else:
                return 'RawMocap'
        else:
            return 'Unknown'
    except Exception:
        return 'Unknown'

# Función para crear subcarpetas
def crear_subcarpetas(directorio_fecha):
    """Crea las subcarpetas necesarias para el procesamiento de datos"""
    processed_data_dir = os.path.join(directorio_fecha, "processed_data")
    staging_dir = os.path.join(processed_data_dir, "staging_xls")
    merged_dir = os.path.join(processed_data_dir, "merged")
    os.makedirs(staging_dir, exist_ok=True)
    os.makedirs(merged_dir, exist_ok=True)
    return staging_dir, merged_dir

# Función para convertir CSV a XLSX
def convertir_csv_a_xlsx_con_columnas(archivo_info, staging_dir):
    """Convierte CSV a XLSX con metadatos extraídos del nombre de la carpeta"""
    try:
        df = pd.read_csv(archivo_info["path"])
        
        # Insertar columnas en orden específico (de derecha a izquierda para mantener el orden)
        df.insert(0, "Resultado", archivo_info["resultado"])
        df.insert(0, "Tipo de Captura", archivo_info["tipo_captura"])
        df.insert(0, "Tiempo", archivo_info["tiempo"])
        df.insert(0, "Sesión", archivo_info["sesion"])
        df.insert(0, "Sujeto", archivo_info["sujeto"])
        df.insert(0, "Fecha y Hora del Ejercicio", archivo_info["fecha_hora"])
        
        # Crear archivo XLSX
        nombre_archivo = archivo_info["nombre_original"].replace(".csv", ".xlsx")
        ruta_salida = os.path.join(staging_dir, nombre_archivo)
        df.to_excel(ruta_salida, index=False, engine='openpyxl')
        
        return archivo_info["tipo"], ruta_salida, True
    except Exception as e:
        return archivo_info["tipo"], str(e), False

# Función para fusionar archivos
def fusionar_por_tipo(staging_dir, merged_dir):
    """Fusiona archivos XLSX por tipo"""
    archivos_por_tipo = {tipo: [] for tipo in TIPOS_VALIDOS}
    resultados = {}

    for archivo in os.listdir(staging_dir):
        if archivo.endswith(".xlsx") and not archivo.startswith("~$"):
            for tipo in TIPOS_VALIDOS:
                if tipo in archivo:
                    archivos_por_tipo[tipo].append(os.path.join(staging_dir, archivo))
                    break

    for tipo, archivos in archivos_por_tipo.items():
        if archivos:
            df_list = []
            for path in archivos:
                try:
                    df = pd.read_excel(path, engine='openpyxl')
                    df_list.append(df)
                except Exception as e:
                    st.warning(f"Error leyendo {path}: {e}")

            if df_list:
                merged_df = pd.concat(df_list, ignore_index=True)
                ruta_merged = os.path.join(merged_dir, f"{tipo}.csv")
                merged_df.to_csv(ruta_merged, index=False, encoding='utf-8-sig')
                resultados[tipo] = {
                    'archivos_procesados': len(df_list),
                    'filas_totales': len(merged_df),
                    'ruta': ruta_merged
                }
        else:
            resultados[tipo] = {'archivos_procesados': 0, 'filas_totales': 0, 'ruta': None}
    
    return resultados

# Función para procesar directorio
def procesar_directorio_fecha(fecha_path, progress_bar, status_text):
    """Procesa un directorio de fecha/hora específico"""
    staging_dir, merged_dir = crear_subcarpetas(fecha_path)
    archivos = buscar_archivos_csv(fecha_path)
    
    if not archivos:
        return {"error": f"No se encontraron archivos CSV válidos en {fecha_path}"}
    
    # Procesar archivos CSV
    archivos_procesados = 0
    errores = []
    
    for i, info in enumerate(archivos):
        progress_bar.progress((i + 1) / len(archivos))
        status_text.text(f"Procesando: {info['nombre_original']}")
        
        tipo, resultado, exito = convertir_csv_a_xlsx_con_columnas(info, staging_dir)
        if exito:
            archivos_procesados += 1
        else:
            errores.append(f"{info['path']}: {resultado}")
    
    # Fusionar archivos
    status_text.text("Fusionando archivos por tipo...")
    resultados_fusion = fusionar_por_tipo(staging_dir, merged_dir)
    
    return {
        "archivos_procesados": archivos_procesados,
        "total_archivos": len(archivos),
        "errores": errores,
        "resultados_fusion": resultados_fusion,
        "fecha_hora": os.path.basename(fecha_path)
    }

# Función para crear gráficos
def crear_graficos_estadisticas(resultados_totales):
    if not resultados_totales:
        return

    st.subheader("Gráficos de la Última Fusión")

    # Datos para el gráfico de archivos procesados por carpeta
    data_bar = {
        'Carpeta': [res['fecha_hora'] for res in resultados_totales],
        'Archivos Procesados': [res['archivos_procesados'] for res in resultados_totales],
        'Errores': [len(res['errores']) for res in resultados_totales]
    }
    df_bar = pd.DataFrame(data_bar)

    # Gráfico de barras
    fig_bar = px.bar(
        df_bar,
        x='Carpeta',
        y=['Archivos Procesados', 'Errores'],
        title='Archivos Procesados vs. Errores por Carpeta',
        barmode='group'
    )
    st.plotly_chart(fig_bar, use_container_width=True)

    # Datos para el gráfico de torta de distribución por tipo de dato
    data_pie = {'Tipo de Dato': [], 'Número de Archivos': []}
    for res in resultados_totales:
        for tipo, datos in res['resultados_fusion'].items():
            if datos['archivos_procesados'] > 0:
                data_pie['Tipo de Dato'].append(tipo)
                data_pie['Número de Archivos'].append(datos['archivos_procesados'])
    
    if data_pie['Número de Archivos']:
        df_pie = pd.DataFrame(data_pie).groupby('Tipo de Dato').sum().reset_index()
        fig_pie = px.pie(
            df_pie,
            names='Tipo de Dato',
            values='Número de Archivos',
            title='Distribución de Archivos por Tipo de Dato'
        )
        st.plotly_chart(fig_pie, use_container_width=True)

# Función para seleccionar directorio usando tkinter
def select_directory():
    """
    Abre un diálogo para seleccionar directorio usando tkinter.
    Retorna la ruta seleccionada o None si se cancela.
    """
    try:
        import tkinter as tk
        from tkinter import filedialog
        
        # Crear ventana raíz oculta
        root = tk.Tk()
        root.withdraw()  # Ocultar la ventana principal
        root.attributes('-topmost', True)  # Mantener en primer plano
        
        # Abrir diálogo de selección de directorio
        directory = filedialog.askdirectory(
            title="Seleccionar directorio del proyecto",
            initialdir=os.path.expanduser("~")
        )
        
        # Destruir la ventana raíz
        root.destroy()
        
        return directory if directory else None
        
    except Exception:
        return None

# Función para mostrar vista previa de archivos
def mostrar_vista_previa(directorio_base):
    if not directorio_base or not os.path.exists(directorio_base):
        st.warning("El directorio base no es válido.")
        return

    st.subheader("Vista Previa del Directorio")
    carpetas_validas = data_processing.validar_directorios(directorio_base)

    if not carpetas_validas:
        st.info("No se encontraron carpetas con la estructura de fecha-hora requerida para procesar.")
    else:
        st.success(f"Se encontraron {len(carpetas_validas)} carpetas válidas para procesar.")
        
        # Expander para mostrar los directorios
        with st.expander("Ver carpetas encontradas"):
            for carpeta in carpetas_validas:
                st.code(os.path.basename(carpeta), language='bash')
    
    st.session_state.directorios_a_procesar = carpetas_validas

# Función para mostrar información detallada del directorio
def mostrar_info_directorio(directorio):
    if not directorio or not os.path.isdir(directorio):
        return

    st.markdown("---")
    st.subheader("Estructura del Directorio Seleccionado")
    st.markdown("A continuación se muestra la estructura de carpetas esperada:")
    
    st.code("""
    directorio_seleccionado/
    └── data/
        ├── 2025-03-19-11-00-00/
        │   ├── Scene Capture - SUB1 - S1 - T1 - CC - OK/
        │   │   ├── ...-PpgHrv-....csv
        │   │   └── ...-ProcessedMocap-....csv
        │   └── ...
        └── 2025-03-20-14-30-00/
            └── ...
    """, language="bash")
    
    st.markdown("**Directorio `data` detectado:**")
    data_dir = data_processing.find_data_directory(directorio)
    if data_dir:
        st.success(f"✅ Directorio de datos: `{os.path.basename(data_dir)}`")
        st.session_state.data_dir = data_dir
    else:
        st.error(
            "❌ No se encontró la carpeta `data` en la ruta seleccionada. "
            "Seleccione el directorio raíz del proyecto."
        )
        st.session_state.data_dir = None

    # Obtener estadísticas del directorio
    try:
        total_items = len(os.listdir(directorio))
        subdirectories = [d for d in os.listdir(directorio) 
                         if os.path.isdir(os.path.join(directorio, d))]
        
        col1, col2 = st.columns(2)
        with col1:
            st.metric("Total elementos", total_items)
        with col2:
            st.metric("Subcarpetas", len(subdirectories))
        
        # Mostrar subcarpetas encontradas
        if subdirectories:
            st.markdown("**Subcarpetas encontradas:**")
            for subdir in subdirectories[:10]:  # Mostrar solo las primeras 10
                st.write(f"• {subdir}")
            
            if len(subdirectories) > 10:
                st.write(f"... y {len(subdirectories) - 10} más")
        
        # Buscar carpetas con formato de fecha/hora
        directorios_validos = data_processing.validar_directorios(directorio)
        if directorios_validos:
            st.success(f"🎯 Encontradas {len(directorios_validos)} carpetas válidas para procesar")
            # Establecer directorios a procesar
            st.session_state.directorios_a_procesar = directorios_validos
        else:
            # Buscar subcarpetas data/datos
            posibles_subcarpetas = ['data', 'datos', 'Data', 'Datos']
            subcarpeta_encontrada = None
            for subcarpeta in posibles_subcarpetas:
                subcarpeta_path = os.path.join(directorio, subcarpeta)
                if os.path.exists(subcarpeta_path) and os.path.isdir(subcarpeta_path):
                    subcarpeta_encontrada = subcarpeta
                    break
            if subcarpeta_encontrada:
                # Verificar si hay directorios válidos en la subcarpeta
                subcarpeta_path = os.path.join(directorio, subcarpeta_encontrada)
                directorios_en_subcarpeta = data_processing.validar_directorios(subcarpeta_path)
                if directorios_en_subcarpeta:
                    st.success(f"🎯 Encontradas {len(directorios_en_subcarpeta)} carpetas válidas en '{subcarpeta_encontrada}'")
                    st.session_state.directorios_a_procesar = directorios_en_subcarpeta
                else:
                    st.info(f"📁 Subcarpeta '{subcarpeta_encontrada}' encontrada, pero no contiene carpetas con formato de fecha/hora")
                    st.session_state.directorios_a_procesar = []
            else:
                st.warning("⚠️ No se encontraron carpetas con formato de fecha/hora (YYYY-MM-DD-HH-MM-SS)")
                st.session_state.directorios_a_procesar = []
        
    except Exception as e:
        st.error(f"Error analizando directorio: {e}")

# Función para limpiar el histórico
def limpiar_historico():
    """Limpia todo el histórico de fusiones"""
    try:
        history_file = get_history_file()
        if os.path.exists(history_file):
            os.remove(history_file)
        return True
    except Exception as e:
        st.error(f"Error limpiando histórico: {e}")
        return False

# Interfaz principal
def main():
    # Header principal
    st.markdown(
        "<h1 class='main-header'>Procesador y Visualizador de Datos Biométricos</h1>",
        unsafe_allow_html=True
    )

    # Inicializar estado
    if 'data_dir' not in st.session_state:
        st.session_state.data_dir = data_processing.get_base_dir()
    if 'processing_done' not in st.session_state:
        st.session_state.processing_done = False
    if 'resultados_totales' not in st.session_state:
        st.session_state.resultados_totales = []
    if 'directorios_a_procesar' not in st.session_state:
        st.session_state.directorios_a_procesar = []

    # --- Panel Lateral ---
    with st.sidebar:
        st.header("Configuración")

        st.markdown("Seleccione el directorio raíz del proyecto:")
        
        # Campo de texto para la ruta
        directorio_seleccionado = st.session_state.get("nuevo_directorio_input", os.path.dirname(st.session_state.data_dir))
        directorio_input = st.text_input(
            "Ruta del proyecto", 
            value=directorio_seleccionado,
            key="directorio_input",
            placeholder="Seleccione o escriba la ruta del directorio..."
        )
        # Si el usuario escribe manualmente, actualizar la variable auxiliar
        if directorio_input != st.session_state.get("nuevo_directorio_input", ""):
            st.session_state["nuevo_directorio_input"] = directorio_input

        # Botón primario debajo del campo de texto
        if st.button("Explorar", help="Abrir explorador de archivos para seleccionar directorio", type="primary", use_container_width=True):
            path = select_directory()
            if path:
                st.session_state["nuevo_directorio_input"] = path
                st.session_state["directorio_validado"] = False
                st.rerun()

        if directorio_input:
            mostrar_info_directorio(directorio_input)

        st.markdown("---")
        if st.session_state.get('directorios_a_procesar'):
            if st.button("Iniciar Procesamiento", type="primary", use_container_width=True, key="iniciar_lateral"):
                st.session_state.processing_done = False
                st.session_state.resultados_totales = []
                st.session_state.procesando = True
                st.rerun()
            
            # Mostrar lista de directorios a procesar en el panel lateral
            with st.expander("📁 Ver directorios a procesar"):
                for i, dir_path in enumerate(st.session_state.directorios_a_procesar, 1):
                    st.write(f"{i}. {os.path.basename(dir_path)}")
        
        st.header("Gestión del Histórico")
        if st.button("Limpiar Histórico de Fusión", use_container_width=True):
            if data_processing.limpiar_historico():
                st.success("Historial limpiado correctamente.")
                time.sleep(1)
                st.rerun()
            else:
                st.warning("No había historial para limpiar.")

    # --- Contenido Principal ---
    if st.session_state.get('directorios_a_procesar') and not st.session_state.processing_done:
        # Mostrar progreso en el dashboard principal
        if st.session_state.get('procesando', False):
            st.header("Procesamiento en Curso")
            
            total_directorios = len(st.session_state.directorios_a_procesar)
            
            # Crear contenedores para el progreso
            progress_container = st.container()
            status_container = st.container()
            
            with progress_container:
                st.markdown("### Progreso del Procesamiento")
                progress_bar = st.progress(0)
                progress_text = st.empty()
            
            with status_container:
                status_text = st.empty()
            
            start_time = time.time()
            
            for i, dir_path in enumerate(st.session_state.directorios_a_procesar):
                progress_text.text(f"Procesando directorio {i+1} de {total_directorios}")
                status_text.info(f"🔄 Iniciando: {os.path.basename(dir_path)}")
                
                try:
                    resultado_dir = data_processing.procesar_directorio_fecha(dir_path, progress_bar, status_text)
                    st.session_state.resultados_totales.append(resultado_dir)
                    status_text.success(f"✅ Completado: {os.path.basename(dir_path)}")
                except Exception as e:
                    st.error(f"❌ Error fatal procesando {os.path.basename(dir_path)}: {e}")
                
                # Actualizar progreso general
                progress_bar.progress((i + 1) / total_directorios)
            
            end_time = time.time()
            
            # Guardar en el histórico
            data_processing.guardar_fusion_en_historico(
                st.session_state.resultados_totales,
                st.session_state.data_dir
            )
            
            progress_text.text("¡Procesamiento completado!")
            status_text.success(f"🎉 Proceso completado en {end_time - start_time:.2f} segundos!")
            st.session_state.processing_done = True
            st.session_state.procesando = False
            st.rerun()

    if st.session_state.processing_done:
        st.header("Resultados del Procesamiento")
        
        resumen_proc = sum(r['archivos_procesados'] for r in st.session_state.resultados_totales)
        resumen_err = sum(len(r['errores']) for r in st.session_state.resultados_totales)
        
        col1, col2, col3 = st.columns(3)
        col1.metric("Carpetas Procesadas", len(st.session_state.resultados_totales))
        col2.metric("Archivos Convertidos", f"{resumen_proc}")
        col3.metric("Errores", f"{resumen_err}")
        style_metric_cards()

        # Mostrar detalles y gráficos
        with st.expander("Ver detalles del procesamiento", expanded=True):
            crear_graficos_estadisticas(st.session_state.resultados_totales)

        with st.expander("Ver errores detallados"):
            for resultado in st.session_state.resultados_totales:
                if resultado["errores"]:
                    st.error(f"Errores en la carpeta `{resultado['fecha_hora']}`:")
                    for error in resultado["errores"]:
                        st.code(error, language='bash')
        
        # Mostrar información histórica mejorada
        st.markdown("---")
        st.header("Dashboard del Histórico de Procesamiento")
        historico = data_processing.cargar_historico()
        
        if historico:
            crear_graficos_historico(historico)
        else:
            st.info("No hay datos históricos. Ejecute un procesamiento para empezar a generar estadísticas.")
    else:
        st.header("Bienvenido")
        st.info("Utilice el panel de la izquierda para configurar y ejecutar el proceso de fusión de datos.")

        # Dashboard del histórico
        st.markdown("---")
        st.header("Dashboard del Histórico de Procesamiento")
        historico = data_processing.cargar_historico()
        
        if historico:
            crear_graficos_historico(historico)
        else:
            st.info("No hay datos históricos. Ejecute un procesamiento para empezar a generar estadísticas.")

if __name__ == "__main__":
    main() 