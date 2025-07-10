import streamlit as st
import pandas as pd
import plotly.express as px
import plotly.graph_objects as go
from plotly.subplots import make_subplots
import os
import sys
from dotenv import load_dotenv
load_dotenv()
import io

# Agregar el directorio raíz al path
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from application_layer.icc_service import ICCService

@st.cache_resource
def get_icc_service():
    from application_layer.icc_service import ICCService
    return ICCService()

@st.cache_data(show_spinner=False)
def get_resultados_icc(results, _service):
    resultados_icc = results['results']['resultados_icc']
    df_resultados = pd.DataFrame(resultados_icc)
    variable_names = df_resultados['variable'].tolist()
    descriptions = _service.get_variable_descriptions(variable_names)
    df_resultados['descripcion'] = df_resultados['variable'].map(descriptions)
    df_resultados['descripcion_corta'] = df_resultados['descripcion'].apply(
        lambda x: x[:100] + "..." if len(str(x)) > 100 else str(x)
    )
    return df_resultados

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
            service = get_icc_service()
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
            service = get_icc_service()
            
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
                display_results(results, threshold, service)
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

def display_results(results, threshold, service):
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
    tab1, tab2, tab3, tab4, tab5 = st.tabs([
        "📈 Variables de Alto ICC", 
        "📊 Todas las Variables",
        "📊 Estadísticas Generales", 
        "🔍 Explorar Todos los Resultados",
        "💾 Exportar Datos"
    ])
    
    with tab1:
        display_high_icc_variables(results, threshold, service)
    
    with tab2:
        display_all_variables_summary(results, threshold, service)
    
    with tab3:
        display_general_statistics(results, threshold)
    
    with tab4:
        display_all_results(results, service)
    
    with tab5:
        display_export_options(results, service)

def display_high_icc_variables(results, threshold, service):
    """Muestra las variables con alto ICC"""
    
    variables_alto_icc = results['results']['variables_alto_icc']
    estadisticas = results['results']['estadisticas']
    
    # Obtener descripciones si están disponibles
    variable_names = [var['variable'] for var in variables_alto_icc]
    descriptions = service.get_variable_descriptions(variable_names)
    
    if len(variables_alto_icc) > 0:
        st.subheader(f"🎯 Variables con ICC > {threshold}")
        
        # Crear DataFrame para visualización
        df_alto = pd.DataFrame(variables_alto_icc)
        
        # Métricas
        col1, col2, col3, col4, col5 = st.columns(5)
        with col1:
            st.metric("Variables de Alto ICC", len(variables_alto_icc))
        with col2:
            st.metric("ICC Promedio (Alto ICC)", f"{estadisticas['correlacion_promedio_alto_icc']:.3f}", 
                     help="Promedio ICC solo de variables con ICC > 0.9")
        with col3:
            st.metric("ICC Mínimo (Alto ICC)", f"{estadisticas['correlacion_minima_alto_icc']:.3f}", 
                     help="ICC mínimo de variables con ICC > 0.9")
        with col4:
            st.metric("ICC Máximo (Alto ICC)", f"{estadisticas['correlacion_maxima_alto_icc']:.3f}", 
                     help="ICC máximo de variables con ICC > 0.9")
        with col5:
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
        
        # Truncar descripciones muy largas para mejor visualización
        df_with_descriptions['descripcion_corta'] = df_with_descriptions['descripcion'].apply(
            lambda x: x[:100] + "..." if len(str(x)) > 100 else str(x)
        )
        
        # Mostrar tabla sin mensajes de debug
        st.dataframe(
            df_with_descriptions[['variable', 'descripcion_corta', 'correlacion', 'sujetos']].sort_values('correlacion', ascending=False),
            use_container_width=True,
            column_config={
                "variable": st.column_config.TextColumn("Variable", width="medium"),
                "descripcion_corta": st.column_config.TextColumn("Descripción", width="large"),
                "correlacion": st.column_config.NumberColumn("ICC", format="%.3f"),
                "sujetos": st.column_config.NumberColumn("Sujetos", format="%d")
            }
        )
        
    else:
        st.warning(f"⚠️ No se encontraron variables con ICC > {threshold}")
        st.info("💡 Considera reducir el umbral para ver más variables")

def display_all_variables_summary(results, threshold, service):
    """Muestra un resumen de todas las variables para comparar con las de alto ICC"""
    
    resultados_icc = results['results']['resultados_icc']
    estadisticas = results['results']['estadisticas']
    
    # Crear DataFrame con todas las variables
    df_todas = pd.DataFrame(resultados_icc)
    df_todas = df_todas.dropna()  # Eliminar valores NaN
    
    if len(df_todas) > 0:
        st.subheader(f"📊 Resumen de Todas las Variables")
        
        # Obtener descripciones si están disponibles
        variable_names = df_todas['variable'].tolist()
        descriptions = service.get_variable_descriptions(variable_names)
        
        # Métricas para todas las variables
        col1, col2, col3, col4, col5 = st.columns(5)
        with col1:
            st.metric("Total Variables", len(df_todas))
        with col2:
            st.metric("ICC Promedio (General)", f"{estadisticas['correlacion_promedio']:.3f}", 
                     help="Promedio ICC de todas las variables")
        with col3:
            st.metric("ICC Mínimo (General)", f"{estadisticas['correlacion_minima']:.3f}", 
                     help="ICC mínimo de todas las variables")
        with col4:
            st.metric("ICC Máximo (General)", f"{estadisticas['correlacion_maxima']:.3f}", 
                     help="ICC máximo de todas las variables")
        with col5:
            st.metric("Desv. Estándar", f"{df_todas['correlacion'].std():.3f}")
        
        # Gráfico de barras de todas las variables (top 20)
        fig = px.bar(
            df_todas.head(20).sort_values('correlacion', ascending=False),
            x='variable',
            y='correlacion',
            title=f"Top 20 Variables (Todas las Variables)",
            labels={'correlacion': 'ICC', 'variable': 'Variable'},
            color='correlacion',
            color_continuous_scale='plasma'
        )
        fig.update_layout(xaxis_tickangle=-45)
        st.plotly_chart(fig, use_container_width=True)
        
        # Comparación visual entre alto ICC y todas las variables
        variables_alto_icc = results['results']['variables_alto_icc']
        if len(variables_alto_icc) > 0:
            st.subheader("📊 Comparación: Alto ICC vs Todas las Variables")
            
            # Crear DataFrame de comparación
            df_comparacion = pd.DataFrame({
                'Métrica': ['Promedio', 'Mínimo', 'Máximo'],
                'Alto ICC (>0.9)': [
                    estadisticas['correlacion_promedio_alto_icc'],
                    estadisticas['correlacion_minima_alto_icc'],
                    estadisticas['correlacion_maxima_alto_icc']
                ],
                'Todas las Variables': [
                    estadisticas['correlacion_promedio'],
                    estadisticas['correlacion_minima'],
                    estadisticas['correlacion_maxima']
                ]
            })
            
            # Gráfico de comparación
            fig_comparacion = go.Figure()
            
            fig_comparacion.add_trace(go.Bar(
                name='Alto ICC (>0.9)',
                x=df_comparacion['Métrica'],
                y=df_comparacion['Alto ICC (>0.9)'],
                marker_color='#ff7f0e'
            ))
            
            fig_comparacion.add_trace(go.Bar(
                name='Todas las Variables',
                x=df_comparacion['Métrica'],
                y=df_comparacion['Todas las Variables'],
                marker_color='#1f77b4'
            ))
            
            fig_comparacion.update_layout(
                title="Comparación de Métricas: Alto ICC vs Todas las Variables",
                barmode='group',
                yaxis_title="Valor ICC"
            )
            
            st.plotly_chart(fig_comparacion, use_container_width=True)
            
            # Tabla de comparación
            st.dataframe(
                df_comparacion,
                use_container_width=True,
                column_config={
                    "Métrica": st.column_config.TextColumn("Métrica", width="medium"),
                    "Alto ICC (>0.9)": st.column_config.NumberColumn("Alto ICC (>0.9)", format="%.3f"),
                    "Todas las Variables": st.column_config.NumberColumn("Todas las Variables", format="%.3f")
                }
            )
        
        # Tabla de todas las variables con descripciones
        st.subheader("📋 Lista Completa de Todas las Variables")
        
        # Agregar descripciones al DataFrame
        df_todas['descripcion'] = df_todas['variable'].map(descriptions)
        
        # Truncar descripciones muy largas para mejor visualización
        df_todas['descripcion_corta'] = df_todas['descripcion'].apply(
            lambda x: x[:100] + "..." if len(str(x)) > 100 else str(x)
        )
        
        # Mostrar tabla sin mensajes de debug
        st.dataframe(
            df_todas[['variable', 'descripcion_corta', 'correlacion', 'sujetos']].sort_values('correlacion', ascending=False),
            use_container_width=True,
            column_config={
                "variable": st.column_config.TextColumn("Variable", width="medium"),
                "descripcion_corta": st.column_config.TextColumn("Descripción", width="large"),
                "correlacion": st.column_config.NumberColumn("ICC", format="%.3f"),
                "sujetos": st.column_config.NumberColumn("Sujetos", format="%d")
            }
        )
        
    else:
        st.warning("⚠️ No hay variables válidas para mostrar")

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
        st.metric("ICC Promedio (General)", f"{estadisticas['correlacion_promedio']:.3f}", 
                 help="Promedio ICC de todas las variables")
    
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
            'Métrica': ['Promedio (General)', 'Promedio (Alto ICC)', 'Mediana', 'Mínimo', 'Máximo', 'Desv. Estándar'],
            'Valor': [
                f"{estadisticas['correlacion_promedio']:.3f}",
                f"{estadisticas['correlacion_promedio_alto_icc']:.3f}",
                f"{estadisticas['correlacion_mediana']:.3f}",
                f"{estadisticas['correlacion_minima']:.3f}",
                f"{estadisticas['correlacion_maxima']:.3f}",
                f"{df_validos['correlacion'].std():.3f}"
            ]
        })
        st.dataframe(stats_df, use_container_width=True)
        
        # Comparación visual de promedios
        if estadisticas['variables_alto_icc'] > 0:
            st.subheader("📊 Comparación de Promedios")
            fig_comparison = go.Figure()
            
            fig_comparison.add_trace(go.Bar(
                x=['Promedio General', 'Promedio Alto ICC'],
                y=[estadisticas['correlacion_promedio'], estadisticas['correlacion_promedio_alto_icc']],
                text=[f"{estadisticas['correlacion_promedio']:.3f}", f"{estadisticas['correlacion_promedio_alto_icc']:.3f}"],
                textposition='auto',
                marker_color=['#1f77b4', '#ff7f0e']
            ))
            
            fig_comparison.update_layout(
                title="Comparación de Promedios ICC",
                yaxis_title="Valor ICC",
                showlegend=False
            )
            
            st.plotly_chart(fig_comparison, use_container_width=True)

def display_all_results(results, service):
    """Muestra todos los resultados en formato explorable"""
    
    st.subheader("🔍 Explorar Todos los Resultados")
    
    df_resultados = get_resultados_icc(results, service)
    
    # Validar que hay datos para mostrar
    if len(df_resultados) == 0:
        st.warning("⚠️ No hay resultados para mostrar")
        return
    
    st.info(f"📊 Mostrando {len(df_resultados)} variables")
    
    # Tabla sin sliders ni filtros
    st.dataframe(
        df_resultados[['variable', 'descripcion_corta', 'correlacion', 'sujetos']].rename(columns={"descripcion_corta": "Descripción"}),
        use_container_width=True,
        column_config={
            "variable": st.column_config.TextColumn("Variable", width="medium"),
            "Descripción": st.column_config.TextColumn("Descripción", width="large"),
            "correlacion": st.column_config.NumberColumn("ICC", format="%.3f"),
            "sujetos": st.column_config.NumberColumn("Sujetos", format="%d")
        }
    )

def display_export_options(results, service):
    """Muestra opciones de exportación"""
    st.subheader("💾 Exportar Resultados")

    # Directorio de exportación RELATIVO al workspace de Streamlit
    export_dir = os.path.join("data", "ICC")
    os.makedirs(export_dir, exist_ok=True)

    # DataFrame completo con descripciones
    df_completo = get_resultados_icc(results, service)
    # DataFrame de alto ICC
    df_alto = df_completo[df_completo['correlacion'] >= results['results']['estadisticas']['correlacion_minima_alto_icc']] if 'correlacion_minima_alto_icc' in results['results']['estadisticas'] else df_completo.copy()

    # Guardar archivos en disco SOLO en la carpeta relativa
    completo_path = os.path.join(export_dir, "resultados_icc_completo.csv")
    alto_path = os.path.join(export_dir, "resultados_icc_alto.csv")
    df_completo.to_csv(completo_path, index=False)
    df_alto.to_csv(alto_path, index=False)

    st.success("Archivo completo guardado en ./data/ICC/resultados_icc_completo.csv")
    st.success("Archivo de alto ICC guardado en ./data/ICC/resultados_icc_alto.csv")

    # Información del archivo procesado
    st.subheader("📁 Información del Archivo")
    st.info(f"**Archivo procesado:** {results['file_path']}")
    st.info(f"**Registros:** {results['data_info']['total_registros']:,}")
    st.info(f"**Variables analizadas:** {results['data_info']['columnas_numericas']}")

if __name__ == "__main__":
    main() 