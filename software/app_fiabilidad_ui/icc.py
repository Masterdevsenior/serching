import pandas as pd
import numpy as np
from scipy.stats import zscore
import sys
import os

print("=== ANÁLISIS ICC - CON RUTA ESPECÍFICA ===")

# Configurar la ruta del archivo
ruta_archivo = "../data/processed_data/merged/ProcessedMocap.csv"

try:
    # 1. Cargar el archivo desde la ruta específica
    print(f"1. Cargando archivo desde: {ruta_archivo}")
    
    # Verificar si el archivo existe
    if not os.path.exists(ruta_archivo):
        print(f"❌ Error: No se encontró el archivo en {ruta_archivo}")
        print("Verificando rutas alternativas...")
        
        # Intentar rutas alternativas
        rutas_alternativas = [
            "data/processed_data/merged/ProcessedMocap.csv",
            "../../data/processed_data/merged/ProcessedMocap.csv",
            "ProcessedMocap.csv"  # En caso de que esté en el directorio actual
        ]
        
        for ruta_alt in rutas_alternativas:
            if os.path.exists(ruta_alt):
                ruta_archivo = ruta_alt
                print(f"✓ Archivo encontrado en: {ruta_archivo}")
                break
        else:
            print("❌ No se pudo encontrar el archivo en ninguna ruta")
            sys.exit(1)
    else:
        print(f"✓ Archivo encontrado en: {ruta_archivo}")
    
    df = pd.read_csv(ruta_archivo)
    print(f"✓ Archivo cargado: {len(df)} registros, {len(df.columns)} columnas")
    
    # 2. Verificar columnas requeridas
    print("\n2. Verificando columnas...")
    columnas_requeridas = ["Sujeto", "Sesion", "Tiempo"]
    columnas_encontradas = []
    
    for col in columnas_requeridas:
        if col in df.columns:
            print(f"   ✓ {col} encontrada")
            columnas_encontradas.append(col)
            print(f"     Valores únicos: {df[col].unique()}")
        else:
            print(f"   ✗ {col} NO encontrada")
    
    if len(columnas_encontradas) < 3:
        print("\n❌ No se encontraron todas las columnas requeridas")
        print("Columnas disponibles:")
        for i, col in enumerate(df.columns):
            print(f"   {i+1}. {col}")
        sys.exit(1)
    
    # 3. Preparar datos para ICC
    print("\n3. Preparando datos para análisis ICC...")
    
    # Renombrar columnas
    df_icc = df.rename(columns={
        "Sujeto": "subject",
        "Sesion": "session", 
        "Tiempo": "repetition"
    })
    
    # 4. Identificar columnas numéricas válidas
    print("\n4. Identificando columnas numéricas válidas...")
    cols_ex = ["subject", "repetition", "session"]
    
    # Función para verificar si una columna es numérica
    def es_numerica(col_name, df):
        if col_name in cols_ex:
            return False
        try:
            # Intentar convertir a numérico
            valores = pd.to_numeric(df[col_name], errors='coerce')
            # Verificar que al menos el 50% de los valores son numéricos
            if valores.notna().sum() / len(valores) > 0.5:
                return True
            return False
        except:
            return False
    
    # Filtrar solo columnas numéricas válidas
    numeric_cols = []
    for col in df_icc.columns:
        if es_numerica(col, df_icc):
            numeric_cols.append(col)
    
    print(f"   Columnas numéricas válidas encontradas: {len(numeric_cols)}")
    print(f"   Primeras 10 columnas numéricas: {numeric_cols[:10]}")
    
    if len(numeric_cols) == 0:
        print("❌ No se encontraron columnas numéricas válidas")
        sys.exit(1)
    
    # 5. Configurar número de columnas a procesar
    print("\n5. Configurando procesamiento...")
    max_columnas = len(numeric_cols)  # Procesar todas las columnas numéricas
    print(f"   Procesando {max_columnas} columnas numéricas")
    
    # 6. Crear DataFrame para análisis
    print("\n6. Creando estructura de datos para ICC...")
    df_vars = pd.DataFrame()
    
    # Procesar todas las columnas numéricas
    for i, col in enumerate(numeric_cols):
        if i % 50 == 0:  # Mostrar progreso cada 50 columnas
            print(f"   Procesando columna {i+1}/{len(numeric_cols)}: {col}")
        
        tmp = df_icc[["subject", "repetition", "session", col]].copy()
        # Convertir a numérico y eliminar valores no válidos
        tmp[col] = pd.to_numeric(tmp[col], errors='coerce')
        tmp = tmp.dropna(subset=[col])
        
        if len(tmp) > 0:
            tmp = tmp.rename(columns={col: "score"})
            tmp["variable"] = col
            df_vars = pd.concat([df_vars, tmp], ignore_index=True)
    
    print(f"   Registros preparados: {len(df_vars)}")
    
    # 7. Verificar datos válidos
    print("\n7. Verificando datos válidos...")
    df_clean = df_vars.dropna(subset=["subject", "repetition", "score"])
    print(f"   Registros válidos: {len(df_clean)}")
    
    # Verificar que hay suficientes datos
    subjects = df_clean["subject"].nunique()
    repetitions = df_clean["repetition"].nunique()
    print(f"   Sujetos únicos: {subjects}")
    print(f"   Repeticiones únicas: {repetitions}")
    
    if subjects < 2:
        print("❌ Se necesitan al menos 2 sujetos")
        sys.exit(1)
    
    if repetitions < 2:
        print("❌ Se necesitan al menos 2 repeticiones")
        sys.exit(1)
    
    # 8. Calcular promedios por sujeto y repetición
    print("\n8. Calculando promedios...")
    df_avg = df_clean.groupby(["subject", "repetition", "variable"])["score"].mean().reset_index()
    print(f"   Promedios calculados: {len(df_avg)}")
    
    # 9. Verificar que cada sujeto tenga ambas repeticiones
    print("\n9. Verificando completitud de datos...")
    completeness = df_avg.groupby(["subject", "variable"])["repetition"].nunique().reset_index()
    complete_subjects = completeness[completeness["repetition"] == 2]["subject"].unique()
    print(f"   Sujetos con ambas repeticiones: {len(complete_subjects)}")
    
    if len(complete_subjects) < 2:
        print("❌ Se necesitan al menos 2 sujetos con ambas repeticiones")
        sys.exit(1)
    
    # 10. Calcular ICC para todas las variables
    print("\n10. Calculando ICC para todas las variables...")
    
    # Filtrar solo sujetos completos
    df_final = df_avg[df_avg["subject"].isin(complete_subjects)]
    
    # Para cada variable, calcular ICC
    variables = df_final["variable"].unique()
    print(f"   Variables a analizar: {len(variables)}")
    
    # Crear lista para almacenar resultados
    resultados_icc = []
    
    for i, var in enumerate(variables):
        if i % 20 == 0:  # Mostrar progreso cada 20 variables
            print(f"   Procesando variable {i+1}/{len(variables)}: {var}")
        
        var_data = df_final[df_final["variable"] == var]
        
        # Crear matriz de datos para ICC
        pivot_data = var_data.pivot(index="subject", columns="repetition", values="score")
        
        if len(pivot_data) >= 2 and pivot_data.shape[1] >= 2:
            # Calcular correlación entre repeticiones
            corr = pivot_data.corr().iloc[0, 1]
            resultados_icc.append({
                'variable': var,
                'correlacion': corr,
                'sujetos': len(pivot_data)
            })
        else:
            resultados_icc.append({
                'variable': var,
                'correlacion': np.nan,
                'sujetos': 0
            })
    
    # 11. Filtrar y mostrar resultados con ICC > 0.90
    print("\n11. RESULTADOS - VARIABLES CON ICC > 0.90:")
    print("="*80)
    
    # Convertir a DataFrame para mejor visualización
    df_resultados = pd.DataFrame(resultados_icc)
    df_resultados = df_resultados.sort_values('correlacion', ascending=False)
    
    # Filtrar solo correlaciones > 0.90
    df_alto_icc = df_resultados[df_resultados['correlacion'] > 0.90].copy()
    
    if len(df_alto_icc) > 0:
        print(f"Se encontraron {len(df_alto_icc)} variables con ICC > 0.90:")
        print("-" * 80)
        print(f"{'VARIABLE':<50} {'ICC':<10} {'SUJETOS':<10}")
        print("-" * 80)
        
        for i, row in df_alto_icc.iterrows():
            print(f"{row['variable']:<50} {row['correlacion']:.3f}     {row['sujetos']:<10}")
        
        # Estadísticas de las variables con alto ICC
        print(f"\nESTADÍSTICAS DE VARIABLES CON ICC > 0.90:")
        print("-" * 40)
        print(f"Total de variables con ICC > 0.90: {len(df_alto_icc)}")
        print(f"ICC promedio de variables altas: {df_alto_icc['correlacion'].mean():.3f}")
        print(f"ICC máximo: {df_alto_icc['correlacion'].max():.3f}")
        print(f"ICC mínimo: {df_alto_icc['correlacion'].min():.3f}")
        print(f"Sujetos promedio: {df_alto_icc['sujetos'].mean():.1f}")
        
        # Guardar resultados de alto ICC
        output_file_alto = "resultados_icc_alto_0.90.csv"
        df_alto_icc.to_csv(output_file_alto, index=False)
        print(f"\n✓ Variables con ICC > 0.90 guardadas en: {output_file_alto}")
        
    else:
        print("❌ No se encontraron variables con ICC > 0.90")
        print("Mostrando las 10 mejores correlaciones encontradas:")
        print("-" * 60)
        for i, row in df_resultados.head(10).iterrows():
            if not pd.isna(row['correlacion']):
                print(f"{row['variable']:<40} {row['correlacion']:.3f} ({row['sujetos']} sujetos)")
    
    # 12. Mostrar estadísticas generales
    print(f"\nESTADÍSTICAS GENERALES:")
    print("-" * 30)
    correlaciones_validas = df_resultados['correlacion'].dropna()
    variables_alto_icc = len(df_alto_icc)
    porcentaje_alto_icc = (variables_alto_icc / len(correlaciones_validas)) * 100 if len(correlaciones_validas) > 0 else 0
    
    print(f"Total de variables analizadas: {len(df_resultados)}")
    print(f"Variables con datos válidos: {len(correlaciones_validas)}")
    print(f"Variables con ICC > 0.90: {variables_alto_icc}")
    print(f"Porcentaje de variables con ICC > 0.90: {porcentaje_alto_icc:.1f}%")
    print(f"Correlación promedio general: {correlaciones_validas.mean():.3f}")
    print(f"Correlación mediana general: {correlaciones_validas.median():.3f}")
    print(f"Correlación mínima general: {correlaciones_validas.min():.3f}")
    print(f"Correlación máxima general: {correlaciones_validas.max():.3f}")
    
    # Guardar todos los resultados
    output_file_completo = "resultados_icc_completo_ruta.csv"
    df_resultados.to_csv(output_file_completo, index=False)
    print(f"\n✓ Todos los resultados guardados en: {output_file_completo}")
    
    print("\n✓ Análisis completado exitosamente")
    
except Exception as e:
    print(f"\n❌ Error durante el análisis: {e}")
    import traceback
    traceback.print_exc() 