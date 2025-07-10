import streamlit as st
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

def show_hrv_graphs(resumen):
    col1, col2 = st.columns(2)
    
    with col1:
        st.metric("Frecuencia cardíaca promedio", f"{resumen.get('frecuencia_cardiaca_prom', 'N/A')} bpm")
        st.metric("Frecuencia cardíaca máxima", f"{resumen.get('frecuencia_cardiaca_max', 'N/A')} bpm")
        st.metric("SpO2 promedio", f"{resumen.get('spo2_prom', 'N/A')}%")
    
    with col2:
        st.metric("RMSSD", f"{resumen.get('HRV_rmssd', 'N/A')}")
        st.metric("SDNN", f"{resumen.get('HRV_sdnn', 'N/A')}")
        st.metric("LF/HF Ratio", f"{resumen.get('HRV_lf_hf', 'N/A')}")
    
    # Gráfica de tendencias
    if 'frecuencia_cardiaca_prom' in resumen:
        st.subheader("📈 Tendencias fisiológicas")
        
        # Simular datos de tendencia
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
        st.metric("Flexión rodilla derecha", f"{biomecanica.get('KneeFlexExtR.angle', 'N/A')}°")
        st.metric("Flexión rodilla izquierda", f"{biomecanica.get('KneeFlexExtL.angle', 'N/A')}°")
    
    with col2:
        st.metric("Flexión cadera derecha", f"{biomecanica.get('HipFlexExtR.angle', 'N/A')}°")
        st.metric("Flexión cadera izquierda", f"{biomecanica.get('HipFlexExtL.angle', 'N/A')}°")
    
    with col3:
        st.metric("Flexión tronco", f"{biomecanica.get('TrunkFlexExt.angle', 'N/A')}°")
        st.metric("Inclinación pelvis", f"{biomecanica.get('PelvisTilt.angle', 'N/A')}°")
    
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
