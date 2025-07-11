import streamlit as st
import pandas as pd
import numpy as np

def get_var(resumen, *keys):
    # Busca variantes de nombre en el resumen
    for k in keys:
        for rk in resumen.keys():
            if rk.lower().replace("/", "_").replace(" ", "_") == k.lower().replace("/", "_").replace(" ", "_"):
                return resumen[rk]
    return "N/A"

def show_hrv_graphs(resumen):
    col1, col2, col3, col4, col5 = st.columns(5)
    with col1:
        st.metric("FC promedio", f"{get_var(resumen, 'frecuencia_cardiaca_prom')} bpm")
    with col2:
        st.metric("FC máxima", f"{get_var(resumen, 'frecuencia_cardiaca_max')} bpm")
    with col3:
        st.metric("RMSSD", f"{get_var(resumen, 'HRV_rmssd', 'rmssd')}")
    with col4:
        st.metric("SDNN", f"{get_var(resumen, 'HRV_sdnn', 'sdnn')}")
    with col5:
        st.metric("LF/HF Ratio", f"{get_var(resumen, 'HRV_lf_hf', 'lf/hf', 'lf_hf')}")

    # Gráfica de tendencias
    if 'frecuencia_cardiaca_prom' in resumen:
        st.subheader("📈 Tendencias fisiológicas")
        tiempo = np.linspace(0, 10, 50)
        hr_trend = resumen['frecuencia_cardiaca_prom'] + np.random.normal(0, 5, 50)
        df_trend = pd.DataFrame({
            'Tiempo (min)': tiempo,
            'Frecuencia Cardíaca (bpm)': hr_trend
        })
        st.line_chart(df_trend.set_index('Tiempo (min)'))

def show_joint_angles(biomecanica):
    st.subheader("🦿 Análisis de ángulos articulares")
    
    # Métricas principales
    col1, col2, col3 = st.columns(3)
    
    with col1:
        st.metric("Flexión rodilla derecha", f"{get_var(biomecanica, 'KneeFlexExtR.angle')}°")
        st.metric("Flexión rodilla izquierda", f"{get_var(biomecanica, 'KneeFlexExtL.angle')}°")
    
    with col2:
        st.metric("Flexión cadera derecha", f"{get_var(biomecanica, 'HipFlexExtR.angle')}°")
        st.metric("Flexión cadera izquierda", f"{get_var(biomecanica, 'HipFlexExtL.angle')}°")
    
    with col3:
        st.metric("Flexión tronco", f"{get_var(biomecanica, 'TrunkFlexExt.angle')}°")
        st.metric("Inclinación pelvis", f"{get_var(biomecanica, 'PelvisTilt.angle')}°")
    
    # Gráficas de ángulos
    col1, col2 = st.columns(2)
    
    with col1:
        st.write("📈 Flexión de rodillas:")
        rodillas_data = {
            'Rodilla Derecha': [biomecanica.get("KneeFlexExtR.angle", 0)],
            'Rodilla Izquierda': [biomecanica.get("KneeFlexExtL.angle", 0)]
        }
        st.bar_chart(rodillas_data)
    
    with col2:
        st.write("📈 Flexión de caderas:")
        caderas_data = {
            'Cadera Derecha': [biomecanica.get("HipFlexExtR.angle", 0)],
            'Cadera Izquierda': [biomecanica.get("HipFlexExtL.angle", 0)]
        }
        st.bar_chart(caderas_data)
    
    # Análisis de riesgo
    st.subheader("⚠️ Análisis de riesgo ergonómico")
    
    riesgos = []
    if biomecanica.get('KneeFlexExtR.angle', 0) > 60:
        riesgos.append("⚠️ Flexión excesiva de rodilla derecha")
    if biomecanica.get('KneeFlexExtL.angle', 0) > 60:
        riesgos.append("⚠️ Flexión excesiva de rodilla izquierda")
    if biomecanica.get('TrunkFlexExt.angle', 0) > 30:
        riesgos.append("⚠️ Flexión excesiva del tronco")
    if biomecanica.get('PelvisTilt.angle', 0) > 15:
        riesgos.append("⚠️ Inclinación excesiva de la pelvis")
    
    if riesgos:
        for riesgo in riesgos:
            st.warning(riesgo)
    else:
        st.success("✅ No se detectaron riesgos ergonómicos significativos")
