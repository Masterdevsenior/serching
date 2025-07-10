#!/usr/bin/env python3
"""
Script principal para análisis de fiabilidad ICC.

Uso:
    python run_analysis.py [archivo_csv]
"""

import sys
import os

def main():
    """
    Función principal que ejecuta el análisis ICC.
    """
    print("ANALISIS DE FIABILIDAD ICC")
    print("=" * 40)
    
    # Verificar argumentos
    if len(sys.argv) > 1:
        archivo_csv = sys.argv[1]
    else:
        # Usar ruta relativa hacia la carpeta data que está al mismo nivel
        ruta_datos = "../data/processed_data/merged/ProcessedMocap.csv"
        
        if os.path.exists(ruta_datos):
            archivo_csv = ruta_datos
            print(f"Usando archivo de datos: {archivo_csv}")
        else:
            print(f"ERROR: No se encontró el archivo de datos en: {ruta_datos}")
            print("\nUso: python run_analysis.py [archivo_csv]")
            print("Ejemplo: python run_analysis.py ../data/processed_data/merged/ProcessedMocap.csv")
            return False
    
    # Verificar que el archivo existe
    if not os.path.exists(archivo_csv):
        print(f"ERROR: El archivo '{archivo_csv}' no existe")
        print("Uso: python run_analysis.py [archivo_csv]")
        return False
    
    try:
        # Importar y ejecutar análisis
        sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'src'))
        from icc import ICCAnalyzer
        
        print(f"Cargando datos desde: {archivo_csv}")
        analyzer = ICCAnalyzer(archivo_csv)
        
        print("Ejecutando análisis ICC...")
        resultados = analyzer.analizar_icc()
        
        if resultados:
            print("ANALISIS COMPLETADO EXITOSAMENTE")
            print("Resultados guardados en: output/")
            return True
        else:
            print("ERROR en el análisis")
            return False
            
    except Exception as e:
        print(f"ERROR: {e}")
        return False

if __name__ == "__main__":
    success = main()
    if not success:
        sys.exit(1) 