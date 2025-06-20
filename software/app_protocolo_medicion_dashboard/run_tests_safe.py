#!/usr/bin/env python3
"""
Script seguro para ejecutar pruebas sin afectar la base de datos principal
"""

import os
import sys
import subprocess

def main():
    print("Ejecutando Pruebas de Forma Segura")
    print("=" * 50)
    print("Este script ejecuta las pruebas usando una base de datos separada")
    print("para no afectar los datos de producción.")
    print()
    
    # Verificar que estamos en el directorio correcto
    if not os.path.exists("src/app/main/app/test_runner.py"):
        print("Error: No se encontró el archivo test_runner.py")
        print("   Asegúrate de ejecutar este script desde la raíz del proyecto")
        return
    
    # Configurar el directorio de trabajo
    os.chdir("src/app/main/app")
    
    print(f"Directorio de trabajo: {os.getcwd()}")
    print(f"Python path: {sys.executable}")
    
    # Verificar que los archivos necesarios existen
    required_files = [
        "test_runner.py",
        "test_config.py",
        "tests/test_models.py",
        "tests/test_app.py",
        "tests/test_integration.py"
    ]
    
    for file_path in required_files:
        if not os.path.exists(file_path):
            print(f"Error: No se encontró {file_path}")
            return
        else:
            print(f"✓ {file_path}")
    
    print("\nArchivos de prueba verificados")
    print("-" * 50)
    
    try:
        # Ejecutar el test runner
        print("Iniciando ejecución de pruebas...")
        print("   Las pruebas usarán una base de datos separada")
        print("   Presiona Ctrl+C para detener la ejecución")
        print("-" * 50)
        
        # Importar y ejecutar el test runner
        sys.path.insert(0, os.getcwd())
        from test_runner import TestRunner
        
        runner = TestRunner()
        runner.run_all_tests()
        
        print("\nPruebas completadas exitosamente")
        print("Base de datos de prueba: formulario_protocolo_tesla_test")
        print("Base de datos principal: formulario_protocolo_tesla (sin cambios)")
        
    except KeyboardInterrupt:
        print("\n\nEjecución de pruebas detenida por el usuario")
    except Exception as e:
        print(f"\nError al ejecutar pruebas: {e}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    main() 