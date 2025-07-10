#!/usr/bin/env python3
"""
Script simple para ejecutar la aplicación Flask del Protocolo de Medición
"""

import os
import sys
import subprocess
import time

def main():
    print("Iniciando Aplicación del Protocolo de Medición")
    print("=" * 50)
    
    # Verificar que estamos en el directorio correcto
    if not os.path.exists("src/app/main/app/app.py"):
        print("Error: No se encontró el archivo app.py")
        print("   Asegúrate de ejecutar este script desde la raíz del proyecto")
        return
    
    # Configurar el directorio de trabajo
    os.chdir("src/app/main")
    
    print(f"Directorio de trabajo: {os.getcwd()}")
    print(f"Python path: {sys.executable}")
    
    # Verificar que el archivo app.py existe
    if not os.path.exists("app/app.py"):
        print("Error: No se encontró app/app.py")
        return
    
    print("Archivo app.py encontrado")
    
    # Configurar variables de entorno
    os.environ['FLASK_APP'] = 'app.app'
    os.environ['FLASK_ENV'] = 'development'
    os.environ['FLASK_DEBUG'] = '1'
    
    print("Variables de entorno configuradas:")
    print(f"   FLASK_APP = {os.environ.get('FLASK_APP')}")
    print(f"   FLASK_ENV = {os.environ.get('FLASK_ENV')}")
    print(f"   FLASK_DEBUG = {os.environ.get('FLASK_DEBUG')}")
    
    # Agregar el directorio actual al Python path
    sys.path.insert(0, os.getcwd())
    
    print("\nIniciando servidor Flask...")
    print("   Presiona Ctrl+C para detener el servidor")
    print("-" * 50)
    
    try:
        # Ejecutar Flask
        subprocess.run([
            sys.executable, "-m", "flask", "run",
            "--host=0.0.0.0",
            "--port=5000",
            "--debug"
        ], check=True)
    except KeyboardInterrupt:
        print("\n\nServidor detenido por el usuario")
    except subprocess.CalledProcessError as e:
        print(f"\nError al ejecutar Flask: {e}")
    except Exception as e:
        print(f"\nError inesperado: {e}")

if __name__ == "__main__":
    main() 