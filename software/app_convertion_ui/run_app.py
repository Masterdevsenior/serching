#!/usr/bin/env python3
"""
Script de inicio para la aplicación de procesamiento de datos biométricos.
Este script instala dependencias, ejecuta las pruebas y lanza la aplicación Streamlit.
"""

import subprocess
import sys
import os
import webbrowser

def install_requirements():
    """Instala las dependencias del archivo requirements.txt"""
    print("=" * 50)
    print("1. Verificando e instalando dependencias...")
    print("=" * 50)
    try:
        subprocess.check_call([sys.executable, "-m", "pip", "install", "-r", "requirements.txt"])
        print("Dependencias instaladas correctamente.\n")
        return True
    except subprocess.CalledProcessError as e:
        print(f"Error instalando dependencias: {e}")
        return False

def run_tests():
    """Ejecuta las pruebas con pytest y genera un informe HTML."""
    print("=" * 50)
    print("2. Ejecutando pruebas unitarias y funcionales...")
    print("=" * 50)
    report_path = os.path.join("test_reports", "test_report.html")
    try:
        command = [
            sys.executable, "-m", "pytest",
            "--html=" + report_path,
            "--self-contained-html"
        ]
        subprocess.check_call(command)
        print(f"Pruebas superadas con éxito.")
        print(f"Informe de pruebas generado en: {report_path}")
        
        # Preguntar al usuario si desea abrir el informe
        try:
            open_report = input("   ¿Desea abrir el informe de pruebas en el navegador? (s/n): ").lower()
            if open_report == 's':
                webbrowser.open('file://' + os.path.realpath(report_path))
        except (KeyboardInterrupt, EOFError):
            print("\nOmitiendo apertura de informe.")

        print("")
        return True
    except subprocess.CalledProcessError:
        print(f"Las pruebas han fallado. Revisa el informe en: {report_path}")
        print("   La aplicación no se iniciará hasta que se solucionen los errores.")
        
        # Abrir informe automáticamente si las pruebas fallan
        try:
            webbrowser.open('file://' + os.path.realpath(report_path))
        except Exception as e:
            print(f"   No se pudo abrir el informe automáticamente: {e}")
            
        return False
    except FileNotFoundError:
        print("Error: 'pytest' no encontrado. Asegúrate de que esté instalado (está en requirements.txt).")
        return False

def run_streamlit():
    """Lanza la aplicación Streamlit."""
    print("=" * 50)
    print("3. Iniciando la aplicación...")
    print("=" * 50)
    print("La aplicación se abrirá en tu navegador.")
    print("   URL: http://localhost:8501")
    print("   Presiona Ctrl+C en esta terminal para cerrar la aplicación.")
    print("=" * 50)
    
    try:
        subprocess.run([sys.executable, "-m", "streamlit", "run", "src/app.py", "--server.port=8501"])
    except KeyboardInterrupt:
        print("\nAplicación cerrada por el usuario.")
    except Exception as e:
        print(f"Error fatal al intentar iniciar la aplicación: {e}")

def main():
    """Función principal del script de inicio."""
    print("=" * 60)
    print("Iniciando el Procesador de Datos Biométricos")
    print("=" * 60)
    
    if not os.path.exists("src/app.py"):
        print("Error: No se encontró 'src/app.py'.")
        print("   Asegúrate de ejecutar este script desde el directorio raíz del proyecto.")
        return
    
    if not install_requirements():
        return
        
    if not run_tests():
        return
        
    run_streamlit()

if __name__ == "__main__":
    main() 