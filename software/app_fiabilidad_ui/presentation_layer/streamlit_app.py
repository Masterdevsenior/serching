import streamlit as st
import pandas as pd
import plotly.express as px
import plotly.graph_objects as go
from plotly.subplots import make_subplots
import os
import sys
from dotenv import load_dotenv
load_dotenv()

# Agregar el directorio raíz al path
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from application_layer.icc_service import ICCService

def main():
    """Función principal de la aplicación Streamlit"""
    
    # Configuración de la página
    st.set_page_config(
        page_title="Análisis ICC - Fiabilidad de Datos",
        page_icon="📊",
        layout="wide",
        initial_sidebar_state="expanded"
    )
    
    # Título principal
    st.title("📊 Análisis de Correlación Intraclase (ICC)")
    st.markdown("---")
    
    # Sidebar para configuración
    with st.sidebar:
        st.header("⚙️ Configuración")
        
        # Selección de archivo
        st.subheader("📁 Archivo de Datos")
        file_option = st.selectbox(
            "Seleccionar archivo:",
            ["ProcessedMocap.csv", "Subir archivo personalizado"],
            help="Selecciona el archivo de datos a analizar"
        )
        
        uploaded_file = None
        if file_option == "Subir archivo personalizado":
            uploaded_file = st.file_uploader(
                "Subir archivo CSV",
                type=['csv'],
                help="Sube tu archivo CSV con los datos de captura de movimiento"
            )
        
        # Carga de descripciones de variables
        st.subheader("📝 Descripciones de Variables")
        descriptions_option = st.selectbox(
            "Fuente de descripciones:",
            ["Sin descripciones", "Base de datos PostgreSQL", "Archivo CSV", "Base de datos SQLite", "Archivo Excel"],
            help="Selecciona la fuente de descripciones de variables"
        )
        
        descriptions_path = None
        
        # Configuración de PostgreSQL
        if descriptions_option == "Base de datos PostgreSQL":
            st.info("🔗 Conectando a PostgreSQL...")
            
            # Mostrar información de conexión
            from application_layer.icc_service import ICCService
            service = ICCService()
            conn_info = service.postgresql_descriptions.get_connection_info()
            
            col1, col2 = st.columns(2)
            with col1:
                st.write(f"**Host:** {conn_info['host']}")
                st.write(f"**Puerto:** {conn_info['port']}")
            with col2:
                st.write(f"**Base de datos:** {conn_info['database']}")
                st.write(f"**Usuario:** {conn_info['user']}")
            
            if conn_info['connected']:
                st.success("✅ Conexión exitosa a PostgreSQL")
                descriptions_path = "postgresql"
            else:
                st.error("❌ No se pudo conectar a PostgreSQL")
                st.info("💡 Verifica la configuración en el archivo .env o variables de entorno")
        
        elif descriptions_option == "Archivo CSV":
            descriptions_file = st.file_uploader(
                "Subir archivo CSV con descripciones",
                type=['csv'],
                help="Archivo CSV con columnas 'variable' y 'descripcion'"
            )
            if descriptions_file:
                # Guardar archivo temporalmente
                with open("temp_descriptions.csv", "wb") as f:
                    f.write(descriptions_file.getbuffer())
                descriptions_path = "temp_descriptions.csv"
        
        elif descriptions_option == "Base de datos SQLite":
            descriptions_file = st.file_uploader(
                "Subir base de datos SQLite",
                type=['db', 'sqlite'],
                help="Base de datos SQLite con tabla de descripciones"
            )
            if descriptions_file:
                with open("temp_descriptions.db", "wb") as f:
                    f.write(descriptions_file.getbuffer())
                descriptions_path = "temp_descriptions.db"
        
        elif descriptions_option == "Archivo Excel":
            descriptions_file = st.file_uploader(
                "Subir archivo Excel",
                type=['xlsx', 'xls'],
                help="Archivo Excel con descripciones de variables"
            )
            if descriptions_file:
                with open("temp_descriptions.xlsx", "wb") as f:
                    f.write(descriptions_file.getbuffer())
                descriptions_path = "temp_descriptions.xlsx"
        
        # Configuración de umbral
        st.subheader("🎯 Umbral de ICC")
        threshold = st.slider(
            "Umbral mínimo de ICC:",
            min_value=0.0,
            max_value=1.0,
            value=0.90,
            step=0.01,
            help="Variables con ICC por encima de este valor se considerarán de alta confiabilidad"
        )
        
        # Botón de análisis
        st.markdown("---")
        analyze_button = st.button(
            "🚀 Ejecutar Análisis ICC",
            type="primary",
            use_container_width=True
        )
    
    # Área principal
    if analyze_button:
        with st.spinner("🔄 Ejecutando análisis ICC..."):
            # Inicializar servicio
            service = ICCService()
            
            # Determinar ruta del archivo
            if uploaded_file is not None:
                # Guardar archivo subido temporalmente
                with open("temp_uploaded_file.csv", "wb") as f:
                    f.write(uploaded_file.getbuffer())
                file_path = "temp_uploaded_file.csv"
            else:
                file_path = "ProcessedMocap.csv"
            
            # Ejecutar análisis
            results = service.run_icc_analysis(file_path, threshold, descriptions_path)
            
            if results['success']:
                display_results(results, threshold)
            else:
                st.error(f"❌ Error en el análisis: {results['error']}")
    
    # Mostrar información inicial si no se ha ejecutado análisis
    else:
        display_welcome_screen()

def display_welcome_screen():
    """Muestra la pantalla de bienvenida"""
    
    st.markdown("""
    ## 🎯 ¿Qué hace esta aplicación?
    
    Esta aplicación analiza la **confiabilidad** de datos de captura de movimiento mediante el cálculo de la **Correlación Intraclase (ICC)**.
    
    ### 📋 Funcionalidades:
    - ✅ **Carga automática** de archivos CSV con datos de mocap
    - 🔍 **Validación** de estructura de datos requerida
    - 📊 **Análisis ICC** para todas las variables numéricas
    - 🎯 **Filtrado** de variables con alta confiabilidad (ICC > 0.90)
    - 📈 **Visualizaciones** interactivas de resultados
    - 💾 **Exportación** de resultados en formato CSV
    
    ### 📁 Estructura de datos requerida:
    El archivo CSV debe contener las siguientes columnas:
    - `Sujeto`: Identificador del participante
    - `Sesion`: Número de sesión
    - `Tiempo`: Número de repetición/tiempo
    - Variables numéricas adicionales para analizar
    
    ### 🚀 Para comenzar:
    1. Configura los parámetros en la barra lateral
    2. Haz clic en "Ejecutar Análisis ICC"
    3. Explora los resultados en las pestañas inferiores
    """)
    
    # Información técnica
    with st.expander("🔧 Información Técnica"):
        st.markdown("""
        **Arquitectura del Proyecto:**
        - **Capa de Presentación**: Interfaz Streamlit
        - **Capa de Aplicación**: Servicios y coordinación
        - **Capa de Dominio**: Lógica de negocio ICC
        - **Capa de Datos**: Carga y validación de datos
        
        **Tecnologías utilizadas:**
        - Streamlit para la interfaz web
        - Pandas para manipulación de datos
        - Plotly para visualizaciones interactivas
        - NumPy para cálculos numéricos
        """)

def display_results(results, threshold):
    """Muestra los resultados del análisis"""
    
    st.success("✅ Análisis completado exitosamente!")
    
    # Información del archivo
    with st.container():
        col1, col2, col3, col4 = st.columns(4)
        with col1:
            st.metric("📊 Registros", results['data_info']['total_registros'])
        with col2:
            st.metric("📋 Columnas", results['data_info']['total_columnas'])
        with col3:
            st.metric("🔢 Variables Numéricas", results['data_info']['columnas_numericas'])
        with col4:
            if results.get('descriptions_loaded', False):
                st.metric("📝 Descripciones", "✅ Cargadas", help="Descripciones de variables disponibles")
            else:
                st.metric("📝 Descripciones", "❌ No disponibles", help="No se cargaron descripciones de variables")
    
    # Pestañas para diferentes vistas
    tab1, tab2, tab3, tab4 = st.tabs([
        "📈 Variables de Alto ICC", 
        "📊 Estadísticas Generales", 
        "🔍 Explorar Todos los Resultados",
        "💾 Exportar Datos"
    ])
    
    with tab1:
        display_high_icc_variables(results, threshold)
    
    with tab2:
        display_general_statistics(results, threshold)
    
    with tab3:
        display_all_results(results)
    
    with tab4:
        display_export_options(results)

def display_high_icc_variables(results, threshold):
    """Muestra las variables con alto ICC"""
    
    variables_alto_icc = results['results']['variables_alto_icc']
    estadisticas = results['results']['estadisticas']
    
    # Obtener descripciones si están disponibles
    service = ICCService()
    variable_names = [var['variable'] for var in variables_alto_icc]
    descriptions = service.get_variable_descriptions(variable_names)
    
    if len(variables_alto_icc) > 0:
        st.subheader(f"🎯 Variables con ICC > {threshold}")
        
        # Crear DataFrame para visualización
        df_alto = pd.DataFrame(variables_alto_icc)
        
        # Métricas
        col1, col2, col3, col4 = st.columns(4)
        with col1:
            st.metric("Variables de Alto ICC", len(variables_alto_icc))
        with col2:
            st.metric("ICC Promedio", f"{estadisticas['correlacion_promedio']:.3f}")
        with col3:
            st.metric("ICC Máximo", f"{estadisticas['correlacion_maxima']:.3f}")
        with col4:
            st.metric("Porcentaje", f"{estadisticas['porcentaje_alto_icc']:.1f}%")
        
        # Gráfico de barras
        fig = px.bar(
            df_alto.head(20),  # Mostrar solo las primeras 20
            x='variable',
            y='correlacion',
            title=f"Top 20 Variables con ICC > {threshold}",
            labels={'correlacion': 'ICC', 'variable': 'Variable'},
            color='correlacion',
            color_continuous_scale='viridis'
        )
        fig.update_layout(xaxis_tickangle=-45)
        st.plotly_chart(fig, use_container_width=True)
        
        # Tabla de resultados con descripciones
        st.subheader("📋 Lista Completa")
        
        # Crear DataFrame con descripciones
        df_with_descriptions = df_alto.copy()
        df_with_descriptions['descripcion'] = df_with_descriptions['variable'].map(descriptions)
        
        # Mostrar tabla con descripciones
        st.dataframe(
            df_with_descriptions[['variable', 'descripcion', 'correlacion', 'sujetos']].sort_values('correlacion', ascending=False),
            use_container_width=True,
            column_config={
                "variable": st.column_config.TextColumn("Variable", width="medium"),
                "descripcion": st.column_config.TextColumn("Descripción", width="large"),
                "correlacion": st.column_config.NumberColumn("ICC", format="%.3f"),
                "sujetos": st.column_config.NumberColumn("Sujetos", format="%d")
            }
        )
        
    else:
        st.warning(f"⚠️ No se encontraron variables con ICC > {threshold}")
        st.info("💡 Considera reducir el umbral para ver más variables")

def display_general_statistics(results, threshold):
    """Muestra estadísticas generales"""
    
    estadisticas = results['results']['estadisticas']
    data_info = results['data_info']
    
    st.subheader("📊 Estadísticas Generales")
    
    # Métricas principales
    col1, col2 = st.columns(2)
    
    with col1:
        st.metric("Total Variables Analizadas", estadisticas['total_variables'])
        st.metric("Variables con Datos Válidos", estadisticas['variables_validas'])
        st.metric("Sujetos Únicos", data_info['sujetos_unicos'])
        st.metric("Repeticiones Únicas", data_info['repeticiones_unicas'])
    
    with col2:
        st.metric("Variables de Alto ICC", estadisticas['variables_alto_icc'])
        st.metric("Porcentaje de Alto ICC", f"{estadisticas['porcentaje_alto_icc']:.1f}%")
        st.metric("Sujetos Completos", data_info['sujetos_completos'])
        st.metric("Correlación Promedio", f"{estadisticas['correlacion_promedio']:.3f}")
    
    # Gráfico de distribución de ICC
    resultados_icc = results['results']['resultados_icc']
    df_resultados = pd.DataFrame(resultados_icc)
    df_validos = df_resultados.dropna()
    
    if len(df_validos) > 0:
        fig = px.histogram(
            df_validos,
            x='correlacion',
            nbins=30,
            title="Distribución de Valores ICC",
            labels={'correlacion': 'ICC', 'count': 'Frecuencia'}
        )
        fig.add_vline(x=threshold, line_dash="dash", line_color="red", 
                     annotation_text=f"Umbral ({threshold})")
        st.plotly_chart(fig, use_container_width=True)
        
        # Estadísticas descriptivas
        st.subheader("📈 Estadísticas Descriptivas")
        stats_df = pd.DataFrame({
            'Métrica': ['Promedio', 'Mediana', 'Mínimo', 'Máximo', 'Desv. Estándar'],
            'Valor': [
                f"{estadisticas['correlacion_promedio']:.3f}",
                f"{estadisticas['correlacion_mediana']:.3f}",
                f"{estadisticas['correlacion_minima']:.3f}",
                f"{estadisticas['correlacion_maxima']:.3f}",
                f"{df_validos['correlacion'].std():.3f}"
            ]
        })
        st.dataframe(stats_df, use_container_width=True)

def display_all_results(results):
    """Muestra todos los resultados en formato explorable"""
    
    st.subheader("🔍 Explorar Todos los Resultados")
    
    resultados_icc = results['results']['resultados_icc']
    df_resultados = pd.DataFrame(resultados_icc)
    
    # Obtener descripciones si están disponibles
    service = ICCService()
    variable_names = df_resultados['variable'].tolist()
    descriptions = service.get_variable_descriptions(variable_names)
    
    # Agregar descripciones al DataFrame
    df_resultados['descripcion'] = df_resultados['variable'].map(descriptions)
    
    # Validar que hay datos para mostrar
    if len(df_resultados) == 0:
        st.warning("⚠️ No hay resultados para mostrar")
        return
    
    # Obtener valores mínimos y máximos con validaciones
    correlacion_min = float(df_resultados['correlacion'].min())
    correlacion_max = float(df_resultados['correlacion'].max())
    sujetos_min = int(df_resultados['sujetos'].min())
    sujetos_max = int(df_resultados['sujetos'].max())
    
    # Ajustar valores si son iguales para evitar error en slider
    if correlacion_min == correlacion_max:
        correlacion_min = max(0.0, correlacion_min - 0.01)
        correlacion_max = min(1.0, correlacion_max + 0.01)
    
    if sujetos_min == sujetos_max:
        sujetos_min = max(1, sujetos_min - 1)
        sujetos_max = sujetos_max + 1
    
    # Filtros
    col1, col2 = st.columns(2)
    
    with col1:
        min_icc = st.slider(
            "ICC mínimo:",
            min_value=correlacion_min,
            max_value=correlacion_max,
            value=correlacion_min,
            step=0.01
        )
    
    with col2:
        min_subjects = st.slider(
            "Mínimo de sujetos:",
            min_value=sujetos_min,
            max_value=sujetos_max,
            value=sujetos_min,
            step=1
        )
    
    # Aplicar filtros
    df_filtrado = df_resultados[
        (df_resultados['correlacion'] >= min_icc) &
        (df_resultados['sujetos'] >= min_subjects)
    ].sort_values('correlacion', ascending=False)
    
    st.info(f"📊 Mostrando {len(df_filtrado)} de {len(df_resultados)} variables")
    
    # Tabla con filtros aplicados y descripciones
    st.dataframe(
        df_filtrado,
        use_container_width=True,
        column_config={
            "variable": st.column_config.TextColumn("Variable", width="medium"),
            "descripcion": st.column_config.TextColumn("Descripción", width="large"),
            "correlacion": st.column_config.NumberColumn("ICC", format="%.3f"),
            "sujetos": st.column_config.NumberColumn("Sujetos", format="%d")
        }
    )

def display_export_options(results):
    """Muestra opciones de exportación"""
    
    st.subheader("💾 Exportar Resultados")
    
    # Servicio para guardar
    service = ICCService()
    
    col1, col2 = st.columns(2)
    
    with col1:
        if st.button("📥 Descargar Todos los Resultados", type="primary"):
            save_result = service.save_results(results)
            if save_result['success']:
                st.success("✅ Archivos guardados exitosamente!")
                for file_type, filename in save_result['files'].items():
                    st.info(f"📄 {file_type}: {filename}")
            else:
                st.error(f"❌ Error al guardar: {save_result['error']}")
    
    with col2:
        if st.button("📊 Descargar Variables de Alto ICC"):
            if len(results['results']['variables_alto_icc']) > 0:
                df_alto = pd.DataFrame(results['results']['variables_alto_icc'])
                csv = df_alto.to_csv(index=False)
                st.download_button(
                    label="📥 Descargar CSV",
                    data=csv,
                    file_name="variables_alto_icc.csv",
                    mime="text/csv"
                )
            else:
                st.warning("⚠️ No hay variables de alto ICC para descargar")
    
    # Información del archivo procesado
    st.subheader("📁 Información del Archivo")
    st.info(f"**Archivo procesado:** {results['file_path']}")
    st.info(f"**Registros:** {results['data_info']['total_registros']:,}")
    st.info(f"**Variables analizadas:** {results['data_info']['columnas_numericas']}")

if __name__ == "__main__":
    main() 