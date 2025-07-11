import streamlit as st
import pandas as pd
from domain.visualizer import show_hrv_graphs, show_joint_angles

def panel_conexion_db(DB_HOST, DB_PORT, DB_NAME, DB_USER, db_status):
    st.markdown("---")
    st.subheader("🔌 Conexión a base de datos")
    st.write(f"**Host:** {DB_HOST}")
    st.write(f"**Puerto:** {DB_PORT}")
    st.write(f"**Base de datos:** {DB_NAME}")
    st.write(f"**Usuario:** {DB_USER}")
    if db_status == "Conectado":
        st.success("Conexión exitosa a la base de datos")
    else:
        st.error("Error de conexión: No se pudo conectar a la base de datos")
    st.markdown("---")

def panel_seleccion_sujeto_ejercicio(sujetos_ejs, sujeto_sel, ejercicio_sel):
    sujeto = st.selectbox("Selecciona el sujeto", sorted(sujetos_ejs.keys()), index=sorted(sujetos_ejs.keys()).index(sujeto_sel) if sujeto_sel in sujetos_ejs else 0)
    ejercicios = sujetos_ejs[sujeto]
    ejercicio = st.selectbox("Selecciona el ejercicio", ejercicios, index=ejercicios.index(ejercicio_sel) if ejercicio_sel in ejercicios else 0)
    return sujeto, ejercicio

def mostrar_resultados_batch(resumen, sujeto, ejercicio, registros, obtener_descripcion_variable, informe_ia=None):
    st.header(f"Resultados promedio - Sujeto: {sujeto}, Ejercicio: {ejercicio}")
    total_reg = len(registros)
    completas = [s for s in registros if all(k in s for k in ['PpgHrv', 'ProcessedPpg', 'ProcessedMocap'])]
    incompletas = [s for s in registros if not all(k in s for k in ['PpgHrv', 'ProcessedPpg', 'ProcessedMocap'])]
    col1, col2, col3 = st.columns(3)
    with col1:
        st.metric("Total de registros", total_reg)
    with col2:
        st.metric("Registros completos", len(completas))
    with col3:
        st.metric("Registros incompletos", len(incompletas))
    st.subheader("🔬 Fisiología (promedio)")
    show_hrv_graphs(resumen["resumen_fisiologico"])
    with st.expander("Ver tabla de variables fisiológicas (promedio)"):
        variables = list(resumen["resumen_fisiologico"].items())
        df_fisio = pd.DataFrame([
            {
                "Variable": var,
                "Descripción": obtener_descripcion_variable(var),
                "Promedio": val
            } for var, val in variables
        ])
        st.dataframe(df_fisio, use_container_width=True)
    st.subheader("🦿 Parámetros biomecánicos")
    st.write(f"Variables biomecánicas filtradas: {len(resumen['resumen_biomecanico'])}")
    show_joint_angles(resumen["resumen_biomecanico"])
    with st.expander("Ver tabla de variables biomecánicas (promedio)"):
        variables = list(resumen["resumen_biomecanico"].items())
        df_bio = pd.DataFrame([
            {
                "Variable": var,
                "Descripción": obtener_descripcion_variable(var),
                "Promedio": val
            } for var, val in variables
        ])
        st.dataframe(df_bio, use_container_width=True)
    if completas:
        st.markdown("---")
        st.subheader("🔎 Explorar registros individuales")
        tabs = st.tabs([f"Simulación {i+1}" for i in range(len(completas))])
        for i, sim in enumerate(completas):
            with tabs[i]:
                st.caption(f"Carpeta: {sim['carpeta']}")
                for tipo, nombre in zip(['PpgHrv', 'ProcessedPpg', 'ProcessedMocap'], ['HRV', 'PPG', 'Mocap']):
                    if tipo in sim:
                        try:
                            df = pd.read_csv(sim[tipo])
                            st.markdown(f"**{nombre}:**")
                            st.dataframe(df, use_container_width=True)
                        except Exception as e:
                            st.warning(f"No se pudo leer {nombre}: {e}")
    if informe_ia is not None:
        st.markdown("---")
        st.subheader("🤖 Informe de Análisis Ergonómico")
        if (
            informe_ia.startswith("Error 503") or 
            "model is overloaded" in informe_ia or 
            "UNAVAILABLE" in informe_ia
        ):
            st.error("⚠️ El servicio de IA está temporalmente saturado o no disponible. Por favor, intenta nuevamente en unos minutos.")
        elif "Timeout" in informe_ia or "tardó demasiado" in informe_ia:
            st.error("⚠️ El análisis automático por IA tardó demasiado en responder. Por favor, intenta nuevamente en unos minutos. Si el problema persiste, verifica tu conexión a internet.")
        else:
            st.info(informe_ia) 