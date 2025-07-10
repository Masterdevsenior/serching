"""
Análisis de Fiabilidad mediante Coeficiente de Correlación Intraclase (ICC)

Este módulo realiza análisis de fiabilidad para datos de captura de movimiento (mocap),
calculando el ICC entre repeticiones de mediciones para evaluar la consistencia
de las variables de movimiento.

Autor: Sistema de Análisis de Fiabilidad
Fecha: 2024
Versión: 1.0
"""

import pandas as pd
import numpy as np
from scipy.stats import zscore
import sys
import os

class ICCAnalyzer:
    """
    Clase para realizar análisis de fiabilidad usando el coeficiente de correlación intraclase (ICC).
    """
    
    def __init__(self, archivo_csv):
        """
        Inicializa el analizador ICC.
        
        Args:
            archivo_csv (str): Ruta al archivo CSV con los datos
        """
        self.archivo_csv = archivo_csv
        self.df = None
        
    def cargar_datos(self):
        """
        Carga los datos desde el archivo CSV.
        """
        print(f"1. Cargando archivo desde: {self.archivo_csv}")
        
        # Verificar si el archivo existe
        if not os.path.exists(self.archivo_csv):
            print(f"❌ Error: No se encontró el archivo en {self.archivo_csv}")
            print("Verificando rutas alternativas...")
            
            # Intentar rutas alternativas
            rutas_alternativas = [
                "data/processed_data/merged/ProcessedMocap.csv",
                "../../data/processed_data/merged/ProcessedMocap.csv",
                "ProcessedMocap.csv"
            ]
            
            for ruta_alt in rutas_alternativas:
                if os.path.exists(ruta_alt):
                    self.archivo_csv = ruta_alt
                    print(f"✓ Archivo encontrado en: {self.archivo_csv}")
                    break
            else:
                print("❌ No se pudo encontrar el archivo en ninguna ruta")
                return False
        else:
            print(f"✓ Archivo encontrado en: {self.archivo_csv}")
        
        self.df = pd.read_csv(self.archivo_csv)
        print(f"✓ Archivo cargado: {len(self.df)} registros, {len(self.df.columns)} columnas")
        return True
    
    def verificar_columnas(self):
        """
        Verifica que el DataFrame contenga las columnas requeridas.
        """
        print("\n2. Verificando columnas...")
        columnas_requeridas = ["Sujeto", "Sesion", "Tiempo"]
        columnas_encontradas = []
        
        for col in columnas_requeridas:
            if col in self.df.columns:
                print(f"   ✓ {col} encontrada")
                columnas_encontradas.append(col)
                print(f"     Valores únicos: {self.df[col].unique()}")
            else:
                print(f"   ✗ {col} NO encontrada")
        
        if len(columnas_encontradas) < 3:
            print("\n❌ No se encontraron todas las columnas requeridas")
            print("Columnas disponibles:")
            for i, col in enumerate(self.df.columns):
                print(f"   {i+1}. {col}")
            return False
        
        return True
    
    def preparar_datos(self):
        """
        Prepara los datos para el análisis ICC.
        """
        print("\n3. Preparando datos para análisis ICC...")
        
        # Renombrar columnas
        self.df_icc = self.df.rename(columns={
            "Sujeto": "subject",
            "Sesion": "session", 
            "Tiempo": "repetition"
        })
    
    def identificar_columnas_numericas(self):
        """
        Identifica las columnas numéricas válidas para el análisis.
        """
        print("\n4. Identificando columnas numéricas válidas...")
        cols_ex = ["subject", "repetition", "session"]
        
        def es_numerica(col_name, df):
            if col_name in cols_ex:
                return False
            try:
                valores = pd.to_numeric(df[col_name], errors='coerce')
                if valores.notna().sum() / len(valores) > 0.5:
                    return True
                return False
            except:
                return False
        
        # Filtrar solo columnas numéricas válidas
        self.numeric_cols = []
        for col in self.df_icc.columns:
            if es_numerica(col, self.df_icc):
                self.numeric_cols.append(col)
        
        print(f"   Columnas numéricas válidas encontradas: {len(self.numeric_cols)}")
        print(f"   Primeras 10 columnas numéricas: {self.numeric_cols[:10]}")
        
        if len(self.numeric_cols) == 0:
            print("❌ No se encontraron columnas numéricas válidas")
            return False
        
        return True
    
    def crear_estructura_datos(self):
        """
        Crea la estructura de datos necesaria para el análisis ICC.
        """
        print("\n6. Creando estructura de datos para ICC...")
        self.df_vars = pd.DataFrame()
        
        # Procesar todas las columnas numéricas
        for i, col in enumerate(self.numeric_cols):
            if i % 50 == 0:  # Mostrar progreso cada 50 columnas
                print(f"   Procesando columna {i+1}/{len(self.numeric_cols)}: {col}")
            
            tmp = self.df_icc[["subject", "repetition", "session", col]].copy()
            # Convertir a numérico y eliminar valores no válidos
            tmp[col] = pd.to_numeric(tmp[col], errors='coerce')
            tmp = tmp.dropna(subset=[col])
            
            if len(tmp) > 0:
                tmp = tmp.rename(columns={col: "score"})
                tmp["variable"] = col
                self.df_vars = pd.concat([self.df_vars, tmp], ignore_index=True)
        
        print(f"   Registros preparados: {len(self.df_vars)}")
    
    def verificar_datos_validos(self):
        """
        Verifica que los datos sean válidos para el análisis.
        """
        print("\n7. Verificando datos válidos...")
        self.df_clean = self.df_vars.dropna(subset=["subject", "repetition", "score"])
        print(f"   Registros válidos: {len(self.df_clean)}")
        
        # Verificar que hay suficientes datos
        subjects = self.df_clean["subject"].nunique()
        repetitions = self.df_clean["repetition"].nunique()
        print(f"   Sujetos únicos: {subjects}")
        print(f"   Repeticiones únicas: {repetitions}")
        
        if subjects < 2:
            print("❌ Se necesitan al menos 2 sujetos")
            return False
        
        if repetitions < 2:
            print("❌ Se necesitan al menos 2 repeticiones")
            return False
        
        return True
    
    def calcular_promedios(self):
        """
        Calcula los promedios por sujeto y repetición.
        """
        print("\n8. Calculando promedios...")
        self.df_avg = self.df_clean.groupby(["subject", "repetition", "variable"])["score"].mean().reset_index()
        print(f"   Promedios calculados: {len(self.df_avg)}")
    
    def verificar_completitud(self):
        """
        Verifica que cada sujeto tenga ambas repeticiones.
        """
        print("\n9. Verificando completitud de datos...")
        completeness = self.df_avg.groupby(["subject", "variable"])["repetition"].nunique().reset_index()
        self.complete_subjects = completeness[completeness["repetition"] == 2]["subject"].unique()
        print(f"   Sujetos con ambas repeticiones: {len(self.complete_subjects)}")
        
        if len(self.complete_subjects) < 2:
            print("❌ Se necesitan al menos 2 sujetos con ambas repeticiones")
            return False
        
        return True
    
    def calcular_icc(self):
        """
        Calcula el ICC para todas las variables.
        """
        print("\n10. Calculando ICC para todas las variables...")
        
        # Filtrar solo sujetos completos
        df_final = self.df_avg[self.df_avg["subject"].isin(self.complete_subjects)]
        
        # Para cada variable, calcular ICC
        variables = df_final["variable"].unique()
        print(f"   Variables a analizar: {len(variables)}")
        
        # Crear lista para almacenar resultados
        self.resultados_icc = []
        
        for i, var in enumerate(variables):
            if i % 20 == 0:  # Mostrar progreso cada 20 variables
                print(f"   Procesando variable {i+1}/{len(variables)}: {var}")
            
            var_data = df_final[df_final["variable"] == var]
            
            # Crear matriz de datos para ICC
            pivot_data = var_data.pivot(index="subject", columns="repetition", values="score")
            
            if len(pivot_data) >= 2 and pivot_data.shape[1] >= 2:
                # Calcular correlación entre repeticiones
                corr = pivot_data.corr().iloc[0, 1]
                self.resultados_icc.append({
                    'variable': var,
                    'correlacion': corr,
                    'sujetos': len(pivot_data)
                })
            else:
                self.resultados_icc.append({
                    'variable': var,
                    'correlacion': np.nan,
                    'sujetos': 0
                })
    
    def mostrar_resultados(self):
        """
        Muestra y guarda los resultados del análisis.
        """
        print("\n11. RESULTADOS - VARIABLES CON ICC > 0.90:")
        print("="*80)
        
        # Convertir a DataFrame para mejor visualización
        self.df_resultados = pd.DataFrame(self.resultados_icc)
        self.df_resultados = self.df_resultados.sort_values('correlacion', ascending=False)
        
        # Filtrar solo correlaciones > 0.90
        self.df_alto_icc = self.df_resultados[self.df_resultados['correlacion'] > 0.90].copy()
        
        if len(self.df_alto_icc) > 0:
            print(f"Se encontraron {len(self.df_alto_icc)} variables con ICC > 0.90:")
            print("-" * 80)
            print(f"{'VARIABLE':<50} {'ICC':<10} {'SUJETOS':<10}")
            print("-" * 80)
            
            for i, row in self.df_alto_icc.iterrows():
                print(f"{row['variable']:<50} {row['correlacion']:.3f}     {row['sujetos']:<10}")
            
            # Estadísticas de las variables con alto ICC
            print(f"\nESTADÍSTICAS DE VARIABLES CON ICC > 0.90:")
            print("-" * 40)
            print(f"Total de variables con ICC > 0.90: {len(self.df_alto_icc)}")
            print(f"ICC promedio de variables altas: {self.df_alto_icc['correlacion'].mean():.3f}")
            print(f"ICC máximo: {self.df_alto_icc['correlacion'].max():.3f}")
            print(f"ICC mínimo: {self.df_alto_icc['correlacion'].min():.3f}")
            print(f"Sujetos promedio: {self.df_alto_icc['sujetos'].mean():.1f}")
            
        else:
            print("❌ No se encontraron variables con ICC > 0.90")
            print("Mostrando las 10 mejores correlaciones encontradas:")
            print("-" * 60)
            for i, row in self.df_resultados.head(10).iterrows():
                if not pd.isna(row['correlacion']):
                    print(f"{row['variable']:<40} {row['correlacion']:.3f} ({row['sujetos']} sujetos)")
    
    def mostrar_estadisticas_generales(self):
        """
        Muestra estadísticas generales del análisis.
        """
        print(f"\nESTADÍSTICAS GENERALES:")
        print("-" * 30)
        correlaciones_validas = self.df_resultados['correlacion'].dropna()
        variables_alto_icc = len(self.df_alto_icc)
        porcentaje_alto_icc = (variables_alto_icc / len(correlaciones_validas)) * 100 if len(correlaciones_validas) > 0 else 0
        
        print(f"Total de variables analizadas: {len(self.df_resultados)}")
        print(f"Variables con datos válidos: {len(correlaciones_validas)}")
        print(f"Variables con ICC > 0.90: {variables_alto_icc}")
        print(f"Porcentaje de variables con ICC > 0.90: {porcentaje_alto_icc:.1f}%")
        print(f"Correlación promedio general: {correlaciones_validas.mean():.3f}")
        print(f"Correlación mediana general: {correlaciones_validas.median():.3f}")
        print(f"Correlación mínima general: {correlaciones_validas.min():.3f}")
        print(f"Correlación máxima general: {correlaciones_validas.max():.3f}")
    
    def guardar_resultados(self):
        """
        Guarda los resultados en archivos CSV.
        """
        # Crear carpeta output si no existe
        os.makedirs('output', exist_ok=True)
        
        # Guardar resultados de alto ICC
        if len(self.df_alto_icc) > 0:
            output_file_alto = "output/resultados_icc_alto_0.90.csv"
            self.df_alto_icc.to_csv(output_file_alto, index=False)
            print(f"\n✓ Variables con ICC > 0.90 guardadas en: {output_file_alto}")
        
        # Guardar todos los resultados
        output_file_completo = "output/resultados_icc_completo.csv"
        self.df_resultados.to_csv(output_file_completo, index=False)
        print(f"✓ Todos los resultados guardados en: {output_file_completo}")
    
    def analizar_icc(self):
        """
        Ejecuta el análisis ICC completo.
        
        Returns:
            bool: True si el análisis fue exitoso, False en caso contrario
        """
        print("Iniciando análisis ICC...")
        
        # Paso 1: Cargar datos
        if not self.cargar_datos():
            return False
        
        # Paso 2: Verificar columnas
        if not self.verificar_columnas():
            return False
        
        # Paso 3: Preparar datos
        self.preparar_datos()
        
        # Paso 4: Identificar columnas numéricas
        if not self.identificar_columnas_numericas():
            return False
        
        # Paso 5: Crear estructura de datos
        self.crear_estructura_datos()
        
        # Paso 6: Verificar datos válidos
        if not self.verificar_datos_validos():
            return False
        
        # Paso 7: Calcular promedios
        self.calcular_promedios()
        
        # Paso 8: Verificar completitud
        if not self.verificar_completitud():
            return False
        
        # Paso 9: Calcular ICC
        self.calcular_icc()
        
        # Paso 10: Mostrar resultados
        self.mostrar_resultados()
        
        # Paso 11: Mostrar estadísticas generales
        self.mostrar_estadisticas_generales()
        
        # Paso 12: Guardar resultados
        self.guardar_resultados()
        
        print("\n✓ Análisis completado exitosamente")
        return True

def main():
    """
    Función principal del script.
    """
    print("=" * 60)
    print("ANALISIS DE FIABILIDAD ICC")
    print("=" * 60)
    
    # Definir ruta del archivo
    ruta_archivo = "../data/processed_data/merged/ProcessedMocap.csv"
    
    try:
        # Crear analizador y ejecutar análisis
        analyzer = ICCAnalyzer(ruta_archivo)
        if analyzer.analizar_icc():
            print("\n" + "=" * 60)
            print("ANALISIS COMPLETADO EXITOSAMENTE")
            print("=" * 60)
        else:
            print("\nERROR: No se pudo completar el análisis")
            sys.exit(1)
            
    except KeyboardInterrupt:
        print("\nAnálisis interrumpido por el usuario")
        sys.exit(1)
    except Exception as e:
        print(f"\nError inesperado: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main() 