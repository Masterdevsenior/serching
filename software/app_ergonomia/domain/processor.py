import pandas as pd
import os

def procesar_simulaciones(simulaciones, ruta_icc):
    '''
    simulaciones: lista de dicts con paths de archivos (output de cargar_archivos_sujeto_ejercicio)
    ruta_icc: path al archivo ICC/resultados_icc_alto.csv
    return: dict con promedios de fisiología y biomecánica filtrada
    '''
    # Concatenar todos los archivos de cada tipo
    hrv_dfs = []
    ppg_dfs = []
    mocap_dfs = []
    for sim in simulaciones:
        if os.path.exists(sim['PpgHrv']):
            hrv_dfs.append(pd.read_csv(sim['PpgHrv']))
        if os.path.exists(sim['ProcessedPpg']):
            ppg_dfs.append(pd.read_csv(sim['ProcessedPpg']))
        if os.path.exists(sim['ProcessedMocap']):
            mocap_dfs.append(pd.read_csv(sim['ProcessedMocap']))
    # Concatenar y calcular promedios
    resumen_fisiologico = {}
    if hrv_dfs:
        hrv_concat = pd.concat(hrv_dfs, ignore_index=True)
        for col in hrv_concat.columns:
            val = round(hrv_concat[col].mean(), 2)
            # Normalizar nombres clave
            col_norm = col.strip().lower().replace("/", "_").replace(" ", "_")
            if col_norm in ["rmssd", "hrv_rmssd"]:
                resumen_fisiologico["HRV_rmssd"] = val
            elif col_norm in ["sdnn", "hrv_sdnn"]:
                resumen_fisiologico["HRV_sdnn"] = val
            elif col_norm in ["lf_hf", "lf/hf", "hrv_lf_hf"]:
                resumen_fisiologico["HRV_lf_hf"] = val
            else:
                resumen_fisiologico[col] = val
    if ppg_dfs:
        ppg_concat = pd.concat(ppg_dfs, ignore_index=True)
        if 'node0.heartrate' in ppg_concat.columns:
            resumen_fisiologico['frecuencia_cardiaca_prom'] = round(ppg_concat['node0.heartrate'].mean(), 2)
            resumen_fisiologico['frecuencia_cardiaca_max'] = round(ppg_concat['node0.heartrate'].max(), 2)
        if 'node0.spo2' in ppg_concat.columns:
            resumen_fisiologico['spo2_prom'] = round(ppg_concat['node0.spo2'].mean(), 2)
    # Procesar biomecánica y filtrar por ICC
    resumen_biomecanico = {}
    if mocap_dfs:
        mocap_concat = pd.concat(mocap_dfs, ignore_index=True)
        # Leer ICC y filtrar variables óptimas
        icc_df = pd.read_csv(ruta_icc)
        # Limpiar nombres de variables (strip y lower)
        icc_vars = set(icc_df['variable'].astype(str).str.strip().str.lower())
        columnas_filtradas = [col for col in mocap_concat.columns if col.strip().lower() in icc_vars]
        for col in columnas_filtradas:
            try:
                resumen_biomecanico[col] = round(mocap_concat[col].mean(), 2)
            except:
                continue
    return {
        'resumen_fisiologico': resumen_fisiologico,
        'resumen_biomecanico': resumen_biomecanico
    } 