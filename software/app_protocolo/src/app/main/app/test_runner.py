#!/usr/bin/env python3
"""
Sistema de ejecución automática de pruebas y generación de reportes
"""

import unittest
import sys
import os
import json
import time
import traceback
from datetime import datetime
from io import StringIO
from pathlib import Path
import platform

# Agregar el directorio actual al path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

# Importar configuración de pruebas
from test_config import setup_test_environment, TestDatabaseManager

from tests.test_models import *
from tests.test_app import *
from tests.test_integration import *

class TestResult:
    """Clase para almacenar resultados de pruebas"""
    
    def __init__(self, test_name, status, duration, error_message=None, error_traceback=None):
        self.test_name = test_name
        self.status = status  # 'PASS', 'FAIL', 'ERROR'
        self.duration = duration
        self.error_message = error_message
        self.error_traceback = error_traceback
        self.timestamp = datetime.now()

class TestSuiteResult:
    """Clase para almacenar resultados de suites de pruebas"""
    
    def __init__(self, suite_name):
        self.suite_name = suite_name
        self.results = []
        self.total_tests = 0
        self.passed_tests = 0
        self.failed_tests = 0
        self.error_tests = 0
        self.start_time = None
        self.end_time = None
        self.total_duration = 0
    
    def add_result(self, result):
        """Agregar un resultado de prueba"""
        self.results.append(result)
        self.total_tests += 1
        
        if result.status == 'PASS':
            self.passed_tests += 1
        elif result.status == 'FAIL':
            self.failed_tests += 1
        elif result.status == 'ERROR':
            self.error_tests += 1
    
    def calculate_duration(self):
        """Calcular duración total"""
        if self.start_time and self.end_time:
            self.total_duration = (self.end_time - self.start_time).total_seconds()
    
    def get_success_rate(self):
        """Obtener tasa de éxito"""
        if self.total_tests == 0:
            return 0.0
        return (self.passed_tests / self.total_tests) * 100

class TestRunner:
    """Ejecutor principal de pruebas"""
    
    def __init__(self):
        self.test_suites = {
            'Modelos de Base de Datos': [
                'TestDatabaseConnection',
                'TestTableCreation', 
                'TestDataOperations',
                'TestDataValidation'
            ],
            'Aplicación Flask': [
                'TestAppRoutes',
                'TestAPIRoutes',
                'TestFormSubmission',
                'TestDeleteOperations',
                'TestExportOperations',
                'TestErrorHandling'
            ],
            'Integración': [
                'TestFullWorkflow',
                'TestDashboardIntegration',
                'TestDataValidationIntegration',
                'TestErrorHandlingIntegration',
                'TestPerformanceIntegration'
            ]
        }
        self.results = {}
        self.test_history = []
    
    def run_suite(self, suite_name, test_classes):
        """Ejecutar una suite de pruebas específica"""
        print(f"\n{'='*60}")
        print(f"Ejecutando suite: {suite_name}")
        print(f"{'='*60}")
        
        suite_result = TestSuiteResult(suite_name)
        suite_result.start_time = datetime.now()
        
        # Crear suite de pruebas
        suite = unittest.TestSuite()
        
        for test_class_name in test_classes:
            try:
                # Importar la clase de prueba dinámicamente
                test_class = globals().get(test_class_name)
                if test_class:
                    suite.addTests(unittest.TestLoader().loadTestsFromTestCase(test_class))
                    print(f"[OK] Cargada clase de prueba: {test_class_name}")
                else:
                    print(f"[ERROR] No se pudo cargar la clase: {test_class_name}")
            except Exception as e:
                print(f"[ERROR] Error al cargar {test_class_name}: {e}")
        
        # Ejecutar las pruebas con manejo de errores mejorado
        try:
            runner = unittest.TextTestRunner(stream=StringIO(), verbosity=2)
            result = runner.run(suite)
            
            # Procesar resultados
            for test, error in result.failures:
                test_result = TestResult(
                    test_name=str(test),
                    status='FAIL',
                    duration=0,  # No tenemos duración individual
                    error_message=str(error) if error else None,
                    error_traceback=traceback.format_exc() if error else None
                )
                suite_result.add_result(test_result)
            
            for test, error in result.errors:
                test_result = TestResult(
                    test_name=str(test),
                    status='ERROR',
                    duration=0,
                    error_message=str(error) if error else None,
                    error_traceback=traceback.format_exc() if error else None
                )
                suite_result.add_result(test_result)
            
            # Agregar pruebas exitosas (corregido)
            successful_tests = result.testsRun - len(result.failures) - len(result.errors)
            for i in range(successful_tests):
                test_result = TestResult(
                    test_name=f"test_successful_{i}",
                    status='PASS',
                    duration=0
                )
                suite_result.add_result(test_result)
                
        except Exception as e:
            print(f"[ERROR] Error durante la ejecución de pruebas: {e}")
            # Agregar un resultado de error para la suite completa
            test_result = TestResult(
                test_name=f"suite_{suite_name}",
                status='ERROR',
                duration=0,
                error_message=str(e),
                error_traceback=traceback.format_exc()
            )
            suite_result.add_result(test_result)
        
        suite_result.end_time = datetime.now()
        suite_result.calculate_duration()
        
        # Mostrar resumen
        print(f"\nResumen de {suite_name}:")
        print(f"  Total: {suite_result.total_tests}")
        print(f"  Exitosas: {suite_result.passed_tests}")
        print(f"  Fallidas: {suite_result.failed_tests}")
        print(f"  Errores: {suite_result.error_tests}")
        print(f"  Tasa de éxito: {suite_result.get_success_rate():.1f}%")
        print(f"  Duración: {suite_result.total_duration:.2f} segundos")
        
        return suite_result
    
    def run_all_tests(self):
        """Ejecutar todas las suites de pruebas"""
        print("Iniciando ejecución automática de pruebas")
        print(f"Fecha y hora: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
        
        # Configurar entorno de prueba
        print("\nConfigurando entorno de prueba...")
        setup_test_environment()
        
        # Crear base de datos de prueba
        db_manager = TestDatabaseManager()
        if not db_manager.create_test_database():
            print("Error: No se pudo crear la base de datos de prueba")
            return
        
        start_time = datetime.now()
        
        try:
            for suite_name, test_classes in self.test_suites.items():
                try:
                    suite_result = self.run_suite(suite_name, test_classes)
                    self.results[suite_name] = suite_result
                except Exception as e:
                    print(f"Error ejecutando suite {suite_name}: {e}")
            
            end_time = datetime.now()
            total_duration = (end_time - start_time).total_seconds()
            
            # Generar reportes
            self.generate_report(start_time, end_time, total_duration)
            self.save_to_history(start_time, end_time, total_duration)
            
            print(f"\n{'='*60}")
            print("Ejecución de pruebas completada")
            print(f"Tiempo total: {total_duration:.2f} segundos")
            print(f"{'='*60}")
            
        finally:
            # Limpiar base de datos de prueba (opcional)
            # db_manager.drop_test_database()
            print("Entorno de prueba configurado. Base de datos de prueba mantenida para inspección.")
    
    def generate_report(self, start_time, end_time, total_duration):
        """Generar reporte HTML de las pruebas"""
        report_html = self.create_html_report(start_time, end_time, total_duration)
        
        # Crear directorio de reportes si no existe
        reports_dir = Path("test_reports")
        reports_dir.mkdir(exist_ok=True)
        
        # Guardar reporte
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        report_file = reports_dir / f"test_report_{timestamp}.html"
        
        with open(report_file, 'w', encoding='utf-8') as f:
            f.write(report_html)
        
        print(f"\nReporte generado: {report_file}")
        
        # Crear enlace simbólico al reporte más reciente (solo en sistemas Unix)
        latest_report = reports_dir / "latest_report.html"
        if latest_report.exists():
            latest_report.unlink()
        
        # Solo crear enlace simbólico en sistemas Unix
        if platform.system() != "Windows":
            try:
                latest_report.symlink_to(report_file.name)
            except OSError:
                # Si falla, simplemente copiar el archivo
                import shutil
                shutil.copy2(report_file, latest_report)
        else:
            # En Windows, simplemente copiar el archivo
            import shutil
            shutil.copy2(report_file, latest_report)
    
    def create_html_report(self, start_time, end_time, total_duration):
        """Crear contenido HTML del reporte"""
        html_content = f"""
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reporte de Pruebas - Protocolo de Medición</title>
    <style>
        body {{
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }}
        .container {{
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            overflow: hidden;
        }}
        .header {{
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
            padding: 30px;
            text-align: center;
        }}
        .header h1 {{
            margin: 0;
            font-size: 2.5rem;
            font-weight: 700;
        }}
        .header p {{
            margin: 10px 0 0 0;
            font-size: 1.2rem;
            opacity: 0.9;
        }}
        .summary {{
            padding: 30px;
            background: #f8f9fa;
        }}
        .summary-grid {{
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }}
        .summary-card {{
            background: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }}
        .summary-card h3 {{
            margin: 0 0 10px 0;
            color: #2c3e50;
        }}
        .summary-card .number {{
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 5px;
        }}
        .success {{ color: #27ae60; }}
        .failure {{ color: #e74c3c; }}
        .error {{ color: #f39c12; }}
        .total {{ color: #3498db; }}
        .suite-results {{
            padding: 30px;
        }}
        .suite-card {{
            background: white;
            border-radius: 10px;
            margin-bottom: 20px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }}
        .suite-header {{
            background: #ecf0f1;
            padding: 20px;
            border-bottom: 1px solid #ddd;
        }}
        .suite-header h3 {{
            margin: 0;
            color: #2c3e50;
        }}
        .suite-stats {{
            display: flex;
            gap: 20px;
            margin-top: 10px;
        }}
        .stat {{
            background: white;
            padding: 10px 15px;
            border-radius: 5px;
            font-weight: 600;
        }}
        .test-results {{
            padding: 20px;
        }}
        .test-item {{
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
            border-left: 4px solid;
        }}
        .test-pass {{ background: #d5f4e6; border-left-color: #27ae60; }}
        .test-fail {{ background: #fadbd8; border-left-color: #e74c3c; }}
        .test-error {{ background: #fdeaa7; border-left-color: #f39c12; }}
        .test-name {{
            font-weight: 600;
            margin-bottom: 5px;
        }}
        .test-details {{
            font-size: 0.9rem;
            color: #666;
        }}
        .error-message {{
            background: #f8f9fa;
            padding: 10px;
            border-radius: 5px;
            margin-top: 10px;
            font-family: monospace;
            font-size: 0.8rem;
            white-space: pre-wrap;
        }}
        .footer {{
            background: #2c3e50;
            color: white;
            padding: 20px;
            text-align: center;
        }}
        @media print {{
            body {{ background: white; }}
            .container {{ box-shadow: none; }}
        }}
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Reporte de Pruebas</h1>
            <p>Aplicación de Protocolo de Medición</p>
            <p>Generado el {start_time.strftime('%d/%m/%Y a las %H:%M:%S')}</p>
        </div>
        
        <div class="summary">
            <h2>Resumen General</h2>
            <div class="summary-grid">
"""
        
        # Calcular estadísticas generales
        total_tests = sum(suite.total_tests for suite in self.results.values())
        total_passed = sum(suite.passed_tests for suite in self.results.values())
        total_failed = sum(suite.failed_tests for suite in self.results.values())
        total_errors = sum(suite.error_tests for suite in self.results.values())
        overall_success_rate = (total_passed / total_tests * 100) if total_tests > 0 else 0
        
        html_content += f"""
                <div class="summary-card">
                    <h3>Total Pruebas</h3>
                    <div class="number total">{total_tests}</div>
                </div>
                <div class="summary-card">
                    <h3>Exitosas</h3>
                    <div class="number success">{total_passed}</div>
                </div>
                <div class="summary-card">
                    <h3>Fallidas</h3>
                    <div class="number failure">{total_failed}</div>
                </div>
                <div class="summary-card">
                    <h3>Errores</h3>
                    <div class="number error">{total_errors}</div>
                </div>
                <div class="summary-card">
                    <h3>Tasa de Éxito</h3>
                    <div class="number success">{overall_success_rate:.1f}%</div>
                </div>
                <div class="summary-card">
                    <h3>Tiempo Total</h3>
                    <div class="number total">{total_duration:.2f}s</div>
                </div>
            </div>
        </div>
        
        <div class="suite-results">
            <h2>Resultados por Suite</h2>
"""
        
        # Agregar resultados de cada suite
        for suite_name, suite_result in self.results.items():
            html_content += f"""
            <div class="suite-card">
                <div class="suite-header">
                    <h3>{suite_name}</h3>
                    <div class="suite-stats">
                        <div class="stat success">[OK] {suite_result.passed_tests} Exitosas</div>
                        <div class="stat failure">[ERROR] {suite_result.failed_tests} Fallidas</div>
                        <div class="stat error">[WARNING] {suite_result.error_tests} Errores</div>
                        <div class="stat total">[TIME] {suite_result.total_duration:.2f}s</div>
                    </div>
                </div>
                <div class="test-results">
"""
            
            for result in suite_result.results:
                status_class = f"test-{result.status.lower()}"
                status_icon = "[OK]" if result.status == "PASS" else "[ERROR]" if result.status == "FAIL" else "[WARNING]"
                
                html_content += f"""
                    <div class="test-item {status_class}">
                        <div class="test-name">{status_icon} {result.test_name}</div>
                        <div class="test-details">
                            Estado: {result.status} | Duración: {result.duration:.2f}s
                        </div>
"""
                
                if result.error_message:
                    html_content += f"""
                        <div class="error-message">{result.error_message}</div>
"""
                
                html_content += """
                    </div>
"""
            
            html_content += """
                </div>
            </div>
"""
        
        html_content += f"""
        </div>
        
        <div class="footer">
            <p>Reporte generado automáticamente por el sistema de pruebas</p>
            <p>Duración total de ejecución: {total_duration:.2f} segundos</p>
        </div>
    </div>
</body>
</html>
"""
        
        return html_content
    
    def save_to_history(self, start_time, end_time, total_duration):
        """Guardar resultados en el historial"""
        history_entry = {
            'timestamp': start_time.isoformat(),
            'start_time': start_time.isoformat(),
            'end_time': end_time.isoformat(),
            'total_duration': total_duration,
            'results': {}
        }
        
        for suite_name, suite_result in self.results.items():
            history_entry['results'][suite_name] = {
                'total_tests': suite_result.total_tests,
                'passed_tests': suite_result.passed_tests,
                'failed_tests': suite_result.failed_tests,
                'error_tests': suite_result.error_tests,
                'success_rate': suite_result.get_success_rate(),
                'duration': suite_result.total_duration
            }
        
        # Cargar historial existente
        history_file = Path("test_history.json")
        if history_file.exists():
            try:
                with open(history_file, 'r', encoding='utf-8') as f:
                    self.test_history = json.load(f)
            except:
                self.test_history = []
        else:
            self.test_history = []
        
        # Agregar nueva entrada
        self.test_history.append(history_entry)
        
        # Mantener solo las últimas 50 entradas
        if len(self.test_history) > 50:
            self.test_history = self.test_history[-50:]
        
        # Guardar historial
        with open(history_file, 'w', encoding='utf-8') as f:
            json.dump(self.test_history, f, indent=2, ensure_ascii=False)

def main():
    """Función principal"""
    runner = TestRunner()
    runner.run_all_tests()

if __name__ == "__main__":
    main() 