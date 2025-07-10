#!/usr/bin/env python3
"""
Script de inicio simple para la aplicación ICC.

Este script:
1. Instala las dependencias del requirements.txt
2. Ejecuta la aplicación principal

Uso:
    python start.py [archivo_csv]
"""

import subprocess
import sys
import os
from datetime import datetime

def mostrar_banner():
    """
    Muestra el banner de inicio.
    """
    print("=" * 50)
    print("SISTEMA ICC - INICIO RAPIDO")
    print("=" * 50)
    print(f"Fecha: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print(f"Directorio: {os.getcwd()}")
    print("=" * 50)

def instalar_dependencias():
    """
    Instala las dependencias del requirements.txt.
    """
    print("\nInstalando dependencias...")
    
    try:
        if not os.path.exists('requirements.txt'):
            print("ERROR: No se encontró requirements.txt")
            return False
        
        result = subprocess.run([
            sys.executable, '-m', 'pip', 'install', '-r', 'requirements.txt'
        ], capture_output=True, text=True)
        
        if result.returncode == 0:
            print("OK - Dependencias instaladas")
            return True
        else:
            print(f"ERROR: {result.stderr}")
            return False
            
    except Exception as e:
        print(f"ERROR: {e}")
        return False

def ejecutar_aplicacion(archivo_csv=None):
    """
    Ejecuta la aplicación principal.
    """
    print("\nEjecutando aplicación...")
    print("=" * 50)
    
    try:
        # Importar y ejecutar la aplicación
        from run_analysis import main as app_main
        
        if archivo_csv:
            # Guardar argumento original
            sys.argv = [sys.argv[0], archivo_csv]
        
        app_main()
        return True
        
    except Exception as e:
        print(f"ERROR: {e}")
        return False

def main():
    """
    Función principal.
    """
    # Mostrar banner
    mostrar_banner()
    
    # Instalar dependencias
    if not instalar_dependencias():
        print("\nERROR - No se pudieron instalar las dependencias")
        sys.exit(1)
    
    # Obtener archivo CSV de argumentos
    archivo_csv = None
    if len(sys.argv) > 1:
        archivo_csv = sys.argv[1]
    
    # Ejecutar aplicación
    if not ejecutar_aplicacion(archivo_csv):
        print("\nERROR - No se pudo ejecutar la aplicación")
        sys.exit(1)
    
    print("\nEXITO - Aplicación ejecutada correctamente")

if __name__ == "__main__":
    main() 