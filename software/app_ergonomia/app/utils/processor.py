# ergonomia_app/utils/processor.py
import pandas as pd
import os

def procesar_archivos_tiempo(paths):
    resumen = {"resumen_fisiologico": {}, "resumen_biomecanico": {}}

    # Procesar HRV
    hrv_df = pd.read_csv(paths['PpgHrv'])
    for col in hrv_df.columns:
        resumen["resumen_fisiologico"][f"HRV_{col}"] = round(hrv_df[col].mean(), 2)

    # Procesar señales fisiológicas
    ppg_df = pd.read_csv(paths['ProcessedPpg'])
    if 'node0.heartrate' in ppg_df.columns:
        resumen["resumen_fisiologico"]["frecuencia_cardiaca_prom"] = round(ppg_df['node0.heartrate'].mean(), 2)
        resumen["resumen_fisiologico"]["frecuencia_cardiaca_max"] = round(ppg_df['node0.heartrate'].max(), 2)
    if 'node0.spo2' in ppg_df.columns:
        resumen["resumen_fisiologico"]["spo2_prom"] = round(ppg_df['node0.spo2'].mean(), 2)

    # Procesar biomecánica
    mocap_df = pd.read_csv(paths['ProcessedMocap'])
    columnas_interes = [col for col in mocap_df.columns if any(k in col.lower() for k in [
        "angle", "pelvis", "hip", "knee", "trunk", "contact", "lumbar", "thorax", "shoulder", "rotation"
    ])]
    for col in columnas_interes:
        try:
            resumen["resumen_biomecanico"][col] = round(mocap_df[col].mean(), 2)
        except:
            continue

    return resumen
