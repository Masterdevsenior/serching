from app.data_loader import listar_sujetos_y_ejercicios, cargar_archivos_sujeto_ejercicio
from app.processor import procesar_simulaciones
import pprint
import pandas as pd

# Ruta base relativa al proyecto
RUTA_BASE = "../data"
RUTA_ICC = "../data/ICC/resultados_icc_alto.csv"

# Contar variables únicas en el archivo ICC
icc_df = pd.read_csv(RUTA_ICC)
if 'variable' in icc_df.columns:
    icc_vars = set(icc_df['variable'].astype(str).str.strip().str.lower())
    print(f"Variables únicas en ICC: {len(icc_vars)}")
else:
    print("No se encontró la columna 'variable' en el archivo ICC.")

# 1. Listar sujetos y ejercicios
sujetos_ejs = listar_sujetos_y_ejercicios(RUTA_BASE)
print("Sujetos y ejercicios detectados:")
pprint.pprint(sujetos_ejs)

# 2. Seleccionar sujeto y ejercicio (puedes cambiar estos valores para probar)
sujeto = next(iter(sujetos_ejs.keys())) if sujetos_ejs else None
if sujeto:
    ejercicio = sujetos_ejs[sujeto][0]
    print(f"\nProcesando sujeto: {sujeto}, ejercicio: {ejercicio}")

    # 3. Cargar archivos de simulaciones
    simulaciones = cargar_archivos_sujeto_ejercicio(RUTA_BASE, sujeto, ejercicio)
    print(f"Simulaciones encontradas: {len(simulaciones)}")
    for sim in simulaciones:
        print(f"- Carpeta: {sim['carpeta']}")

    # 4. Procesar simulaciones y mostrar promedios
    resumen = procesar_simulaciones(simulaciones, RUTA_ICC)
    print("\nPromedios fisiología:")
    pprint.pprint(resumen['resumen_fisiologico'])
    print("\nPromedios biomecánica (filtrado ICC):")
    biomecanico = resumen['resumen_biomecanico']
    pprint.pprint(biomecanico)
    print(f"\nVariables biomecánicas filtradas por ICC: {len(biomecanico)}")
else:
    print("No se encontraron sujetos ni ejercicios en la ruta especificada.") 