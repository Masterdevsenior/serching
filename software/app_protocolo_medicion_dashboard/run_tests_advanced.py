#!/usr/bin/env python3
"""
Script avanzado para ejecutar pruebas del Protocolo de Medición
Permite ejecutar diferentes tipos de pruebas con opciones
"""

import os
import sys
import subprocess
import argparse
import time

def check_environment():
    """Verificar el entorno de pruebas"""
    print("Verificando entorno de pruebas...")
    
    # Verificar directorio
    if not os.path.exists("src/app/main/app/test_runner.py"):
        print("Error: No se encontró el archivo test_runner.py")
        print("   Asegúrate de ejecutar este script desde la raíz del proyecto")
        return False
    
    # Cambiar al directorio de trabajo
    os.chdir("src/app/main/app")
    
    # Verificar archivos de pruebas
    test_files = {
        "Modelos": "tests/test_models.py",
        "Aplicación": "tests/test_app.py", 
        "Integración": "tests/test_integration.py"
    }
    
    missing_files = []
    for test_type, file_path in test_files.items():
        if os.path.exists(file_path):
            print(f"[OK] {test_type}: {file_path}")
        else:
            print(f"[ERROR] {test_type}: {file_path} (no encontrado)")
            missing_files.append(file_path)
    
    if missing_files:
        print(f"\nAdvertencia: {len(missing_files)} archivos de pruebas no encontrados")
    
    return True

def run_full_test_suite():
    """Ejecutar suite completa de pruebas"""
    print("\nEjecutando suite completa de pruebas...")
    print("-" * 50)
    
    try:
        result = subprocess.run([
            sys.executable, "test_runner.py"
        ], check=True, capture_output=True, text=True)
        
        return result
    except subprocess.CalledProcessError as e:
        return e

def run_specific_test(test_file):
    """Ejecutar pruebas específicas"""
    print(f"\nEjecutando pruebas específicas: {test_file}")
    print("-" * 50)
    
    try:
        result = subprocess.run([
            sys.executable, "-m", "unittest", test_file, "-v"
        ], check=True, capture_output=True, text=True)
        
        return result
    except subprocess.CalledProcessError as e:
        return e

def run_coverage_tests():
    """Ejecutar pruebas con cobertura"""
    print("\nEjecutando pruebas con cobertura...")
    print("-" * 50)
    
    try:
        # Verificar si coverage está instalado
        result = subprocess.run([
            sys.executable, "-m", "coverage", "--version"
        ], capture_output=True, text=True)
        
        if result.returncode != 0:
            print("Error: coverage no está instalado")
            print("Instala con: pip install coverage")
            return None
        
        # Ejecutar pruebas con cobertura
        result = subprocess.run([
            sys.executable, "-m", "coverage", "run", "--source=.", "-m", "unittest", "discover", "tests"
        ], check=True, capture_output=True, text=True)
        
        # Generar reporte
        subprocess.run([
            sys.executable, "-m", "coverage", "report"
        ], check=True)
        
        # Generar reporte HTML
        subprocess.run([
            sys.executable, "-m", "coverage", "html"
        ], check=True)
        
        return result
    except subprocess.CalledProcessError as e:
        return e

def show_test_results():
    """Mostrar resultados de pruebas"""
    print("\nResultados de pruebas:")
    print("-" * 30)
    
    # Verificar archivo de historial
    if os.path.exists("test_history.json"):
        print("[OK] Historial de pruebas: test_history.json")
        
        # Mostrar información básica del historial
        try:
            import json
            with open("test_history.json", 'r', encoding='utf-8') as f:
                history = json.load(f)
            
            if history:
                latest = history[-1]
                print(f"  Última ejecución: {latest.get('timestamp', 'N/A')}")
                print(f"  Total de suites: {len(latest.get('results', {}))}")
                
                # Calcular tasa de éxito general
                total_success = 0
                total_tests = 0
                for suite_name, suite_data in latest.get('results', {}).items():
                    success_rate = suite_data.get('success_rate', 0)
                    total_tests += suite_data.get('total_tests', 0)
                    total_success += (success_rate * suite_data.get('total_tests', 0)) / 100
                
                if total_tests > 0:
                    overall_success = (total_success / total_tests) * 100
                    print(f"  Tasa de éxito general: {overall_success:.1f}%")
        except Exception as e:
            print(f"  Error al leer historial: {e}")
    
    # Verificar carpeta de reportes
    if os.path.exists("test_reports"):
        print("[OK] Reportes HTML: test_reports/")
        html_files = [f for f in os.listdir("test_reports") if f.endswith('.html')]
        for html_file in html_files:
            print(f"  - {html_file}")
    
    # Verificar reporte de cobertura
    if os.path.exists("htmlcov"):
        print("[OK] Reporte de cobertura: htmlcov/")
        print("  - Abre htmlcov/index.html en tu navegador")

def main():
    parser = argparse.ArgumentParser(description="Ejecutar pruebas del Protocolo de Medición")
    parser.add_argument("--type", choices=["full", "models", "app", "integration", "coverage"], 
                       default="full", help="Tipo de pruebas a ejecutar")
    parser.add_argument("--show-results", action="store_true", 
                       help="Mostrar resultados de pruebas previas")
    parser.add_argument("--verbose", "-v", action="store_true", 
                       help="Mostrar salida detallada")
    
    args = parser.parse_args()
    
    print("Script Avanzado de Pruebas - Protocolo de Medición")
    print("=" * 60)
    
    # Verificar entorno
    if not check_environment():
        return
    
    # Mostrar resultados previos si se solicita
    if args.show_results:
        show_test_results()
        return
    
    # Ejecutar pruebas según el tipo
    result = None
    
    if args.type == "full":
        result = run_full_test_suite()
    elif args.type == "coverage":
        result = run_coverage_tests()
    else:
        # Mapear tipos a archivos
        test_files = {
            "models": "tests.test_models",
            "app": "tests.test_app", 
            "integration": "tests.test_integration"
        }
        result = run_specific_test(test_files[args.type])
    
    # Mostrar resultados
    if result:
        if hasattr(result, 'returncode') and result.returncode == 0:
            print("\nPruebas completadas exitosamente")
            if args.verbose and result.stdout:
                print("\nSalida detallada:")
                print(result.stdout)
        else:
            print(f"\nError en las pruebas (código: {result.returncode})")
            if result.stdout:
                print("Salida:")
                print(result.stdout)
            if result.stderr:
                print("Errores:")
                print(result.stderr)
    
    # Mostrar resumen de resultados
    show_test_results()
    
    print("\nComandos útiles:")
    print("  python run_tests_advanced.py --type full          # Suite completa")
    print("  python run_tests_advanced.py --type models        # Solo modelos")
    print("  python run_tests_advanced.py --type app           # Solo aplicación")
    print("  python run_tests_advanced.py --type integration   # Solo integración")
    print("  python run_tests_advanced.py --type coverage      # Con cobertura")
    print("  python run_tests_advanced.py --show-results       # Ver resultados")

if __name__ == "__main__":
    main() 