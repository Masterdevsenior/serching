import os
import pandas as pd
import pingouin as pg

# Ruta base de los datos
base_dir = "./data"

# Variables biomecánicas clave a analizar
columnas_interes = {
    "flexion_lumbar": "LumbarFlexExt.angle",
    "inclinacion_hombros": "ShoulderFlexExtR.angle",
    "rotacion_tronco": "UpperThoraxRot.angle"
}

# Función para extraer subject y repetition desde la carpeta contenedora del archivo
def extraer_info_desde_ruta(file_path):
    partes = file_path.replace("\\", "/").split("/")
    carpeta = partes[-2] if len(partes) >= 2 else "UNKNOWN"

    # Buscar el código SUBx
    subject = "UNKNOWN"
    for segmento in carpeta.split(" "):
        if segmento.startswith("SUB"):
            subject = segmento.strip()
            break

    # Buscar T1 o T2 en el nombre de la carpeta
    if "T1" in carpeta:
        repetition = "T1"
    elif "T2" in carpeta:
        repetition = "T2"
    else:
        repetition = "UNKNOWN"

    return subject, repetition


# Recorrer todos los archivos ProcessedMocap y combinarlos
dataframes = []
for root, dirs, files in os.walk(base_dir):
    for file in files:
        if "ProcessedMocap" in file and file.endswith(".csv"):
            file_path = os.path.join(root, file)
            print(f"📁 Leyendo: {file_path}")
            try:
                df = pd.read_csv(file_path)
                subject, repetition = extraer_info_desde_ruta(file_path)
                df["subject"] = subject
                df["repetition"] = repetition
                dataframes.append(df)
            except Exception as e:
                print(f"❌ Error leyendo {file_path}: {e}")

# Verifica si se cargaron archivos
if not dataframes:
    print("❌ No se encontraron archivos ProcessedMocap.")
    exit()

# Combina todos los DataFrames
df_comb = pd.concat(dataframes, ignore_index=True)
print(f"\n✅ Archivos combinados: {len(dataframes)}")
df_comb.to_csv("ProcessedMocap_combined.csv", index=False)

# Mostrar las columnas disponibles
print("\n📌 Columnas del archivo combinado:")
print(df_comb.columns.tolist())

# Crear un nuevo DataFrame con solo las columnas de interés
df_vars = pd.DataFrame()
for var_name, col in columnas_interes.items():
    if col in df_comb.columns:
        df_temp = df_comb[["subject", "repetition", col]].copy()
        df_temp = df_temp.rename(columns={col: "score"})
        df_temp["variable"] = var_name
        df_vars = pd.concat([df_vars, df_temp], ignore_index=True)
    else:
        print(f"⚠️ Columna no encontrada: {col}")

# Mostrar resumen de registros por repetición
print("\n📊 Recuento por repetición:")
print(df_vars.groupby(["variable", "repetition"]).count()["score"])

print("\n👥 Recuento de sujetos por variable y repetición:")
print(df_vars.groupby(["variable", "subject", "repetition"]).count()["score"])


# Función para calcular el ICC
def calcular_icc(df, nombre_variable):
    data = df[df["variable"] == nombre_variable]

    # Agrupar por sujeto y repetición
    data_grouped = data.groupby(["subject", "repetition"])["score"].mean().reset_index()

    # 👇 Esta línea la agregas aquí
    print(f"\n📊 Estadísticas para {nombre_variable} por sujeto y repetición:")
    print(data.groupby(["subject", "repetition"])["score"].agg(["mean", "std"]))


    print(f"\n📋 Datos agrupados para {nombre_variable}:")
    print(data_grouped.head(10))
    print(f"🔢 Total combinaciones únicas: {data_grouped.shape[0]}")

    if data_grouped.shape[0] >= 5:
        icc = pg.intraclass_corr(data=data_grouped, targets='subject', raters='repetition', ratings='score')
        print(f"\n📈 ICC para {nombre_variable}:")
        print(icc[["Type", "ICC", "CI95%"]])
    else:
        print(f"⚠️ No hay suficientes datos para calcular ICC de {nombre_variable}")


# Calcular el ICC para cada variable
for variable in columnas_interes.keys():
    calcular_icc(df_vars, variable)
