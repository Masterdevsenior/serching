#!/usr/bin/env python3
"""
Pruebas específicas para el Dashboard de la Aplicación de Protocolo de Medición
Este archivo contiene pruebas unitarias y de integración para el dashboard
"""

import unittest
import json
import sys
import os
from datetime import datetime, timedelta

# Agregar el directorio de la aplicación al path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'src', 'app', 'main'))

from app.app import app
from app.models.db import crear_tabla, guardar_datos, obtener_registros, eliminar_registro

class TestDashboard(unittest.TestCase):
    """Clase de pruebas para el dashboard"""
    
    def setUp(self):
        """Configuración inicial para cada prueba"""
        self.app = app.test_client()
        self.app.testing = True
        
        # Crear tabla de prueba
        crear_tabla()
        
        # Datos de prueba
        self.test_data = {
            'nombre_completo': 'Juan Pérez',
            'edad': '25',
            'genero': 'Masculino',
            'peso_corporal': '70.5',
            'altura': '175.0',
            'longitud_brazo': '65.0',
            'longitud_pierna': '85.0',
            'longitud_torso': '45.0',
            'antecedentes_lesiones': 'False',
            'limitaciones_movilidad': 'False',
            'experiencia_levantamiento': 'True',
            'sin_contraindicaciones': 'True',
            'ajuste_traje': 'True',
            'calibracion_sincronizada': 'True',
            'sensores_posicion': 'True',
            'tipo_ejercicio': 'Levantamiento de pesas',
            'nivel_riesgo': 'Medio',
            'peso_carga': '50.0',
            'duracion_minutos': '30',
            'num_repeticiones': '10',
            'forma_objeto': 'Barra',
            'velocidad_movimiento': 'Moderada',
            'tipo_superficie': 'Piso firme'
        }
    
    def tearDown(self):
        """Limpieza después de cada prueba"""
        # Limpiar registros de prueba
        registros = obtener_registros()
        for registro in registros:
            if 'Juan Pérez' in str(registro.get('nombre_completo', '')):
                eliminar_registro(registro['id'])
    
    def test_dashboard_route(self):
        """Prueba que la ruta del dashboard funcione correctamente"""
        response = self.app.get('/dashboard')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'dashboard', response.data.lower())
        self.assertIn(b'estadisticas', response.data.lower())
    
    def test_api_dashboard_stats(self):
        """Prueba el endpoint de estadísticas del dashboard"""
        # Agregar datos de prueba
        guardar_datos(self.test_data)
        
        response = self.app.get('/api/dashboard/stats')
        self.assertEqual(response.status_code, 200)
        
        data = json.loads(response.data)
        self.assertIn('total_registros', data)
        self.assertIn('promedio_edad', data)
        self.assertIn('promedio_peso', data)
        self.assertIn('promedio_altura', data)
        self.assertIn('distribucion_genero', data)
        self.assertIn('distribucion_ejercicios', data)
        self.assertIn('distribucion_riesgo', data)
        self.assertIn('registros_ultimos_7_dias', data)
        self.assertIn('registros_ultimos_30_dias', data)
        
        # Verificar que los datos sean correctos
        self.assertGreaterEqual(data['total_registros'], 1)
        self.assertEqual(data['promedio_edad'], 25.0)
        self.assertEqual(data['promedio_peso'], 70.5)
        self.assertEqual(data['promedio_altura'], 175.0)
    
    def test_api_dashboard_stats_empty(self):
        """Prueba estadísticas con base de datos vacía"""
        response = self.app.get('/api/dashboard/stats')
        self.assertEqual(response.status_code, 200)
        
        data = json.loads(response.data)
        self.assertEqual(data['total_registros'], 0)
        self.assertEqual(data['promedio_edad'], 0)
        self.assertEqual(data['promedio_peso'], 0)
        self.assertEqual(data['promedio_altura'], 0)
    
    def test_api_chart_data(self):
        """Prueba el endpoint de datos para gráficos"""
        # Agregar datos de prueba
        guardar_datos(self.test_data)
        
        response = self.app.get('/api/dashboard/chart-data')
        self.assertEqual(response.status_code, 200)
        
        data = json.loads(response.data)
        self.assertIn('registros_por_fecha', data)
        self.assertIn('peso_por_edad', data)
        self.assertIn('altura_por_genero', data)
        self.assertIn('ejercicios_por_mes', data)
        
        # Verificar que los datos de gráficos sean correctos
        self.assertIsInstance(data['registros_por_fecha'], list)
        self.assertIsInstance(data['peso_por_edad'], list)
        self.assertIsInstance(data['altura_por_genero'], dict)
        self.assertIsInstance(data['ejercicios_por_mes'], list)
    
    def test_api_chart_data_empty(self):
        """Prueba datos de gráficos con base de datos vacía"""
        response = self.app.get('/api/dashboard/chart-data')
        self.assertEqual(response.status_code, 200)
        
        data = json.loads(response.data)
        self.assertEqual(data['registros_por_fecha'], [])
        self.assertEqual(data['peso_por_edad'], [])
        self.assertEqual(data['altura_por_genero'], {})
        self.assertEqual(data['ejercicios_por_mes'], [])
    
    def test_api_recent_registros(self):
        """Prueba el endpoint de registros recientes"""
        # Agregar datos de prueba
        guardar_datos(self.test_data)
        
        response = self.app.get('/api/dashboard/recent-registros')
        self.assertEqual(response.status_code, 200)
        
        data = json.loads(response.data)
        self.assertIsInstance(data, list)
        
        if data:  # Si hay datos
            self.assertLessEqual(len(data), 10)  # Máximo 10 registros
            registro = data[0]
            self.assertIn('id', registro)
            self.assertIn('fecha_hora', registro)
            self.assertIn('nombre_completo', registro)
            self.assertIn('edad', registro)
            self.assertIn('genero', registro)
            self.assertIn('tipo_ejercicio', registro)
            self.assertIn('nivel_riesgo', registro)
    
    def test_api_recent_registros_empty(self):
        """Prueba registros recientes con base de datos vacía"""
        response = self.app.get('/api/dashboard/recent-registros')
        self.assertEqual(response.status_code, 200)
        
        data = json.loads(response.data)
        self.assertEqual(data, [])
    
    def test_dashboard_statistics_calculation(self):
        """Prueba el cálculo correcto de estadísticas"""
        # Agregar múltiples registros de prueba
        test_data_2 = self.test_data.copy()
        test_data_2['nombre_completo'] = 'María García'
        test_data_2['edad'] = '30'
        test_data_2['genero'] = 'Femenino'
        test_data_2['peso_corporal'] = '60.0'
        test_data_2['altura'] = '165.0'
        
        guardar_datos(self.test_data)
        guardar_datos(test_data_2)
        
        response = self.app.get('/api/dashboard/stats')
        data = json.loads(response.data)
        
        # Verificar cálculos
        self.assertEqual(data['total_registros'], 2)
        self.assertEqual(data['promedio_edad'], 27.5)  # (25 + 30) / 2
        self.assertEqual(data['promedio_peso'], 65.25)  # (70.5 + 60) / 2
        self.assertEqual(data['promedio_altura'], 170.0)  # (175 + 165) / 2
        
        # Verificar distribución por género
        self.assertEqual(data['distribucion_genero']['Masculino'], 1)
        self.assertEqual(data['distribucion_genero']['Femenino'], 1)
    
    def test_dashboard_chart_data_structure(self):
        """Prueba la estructura de datos para gráficos"""
        guardar_datos(self.test_data)
        
        response = self.app.get('/api/dashboard/chart-data')
        data = json.loads(response.data)
        
        # Verificar estructura de registros por fecha
        if data['registros_por_fecha']:
            fecha_data = data['registros_por_fecha'][0]
            self.assertIn('fecha', fecha_data)
            self.assertIn('cantidad', fecha_data)
            self.assertIsInstance(fecha_data['cantidad'], int)
        
        # Verificar estructura de peso por edad
        if data['peso_por_edad']:
            peso_data = data['peso_por_edad'][0]
            self.assertIn('edad', peso_data)
            self.assertIn('peso_corporal', peso_data)
            self.assertIsInstance(peso_data['edad'], int)
            self.assertIsInstance(peso_data['peso_corporal'], (int, float))
    
    def test_dashboard_error_handling(self):
        """Prueba el manejo de errores en el dashboard"""
        # Simular error en la base de datos
        # (Esto requeriría mock de la base de datos)
        pass
    
    def test_dashboard_performance(self):
        """Prueba el rendimiento del dashboard con muchos datos"""
        # Agregar múltiples registros para probar rendimiento
        for i in range(50):
            test_data = self.test_data.copy()
            test_data['nombre_completo'] = f'Usuario {i}'
            test_data['edad'] = str(20 + (i % 40))
            guardar_datos(test_data)
        
        # Medir tiempo de respuesta
        import time
        start_time = time.time()
        
        response = self.app.get('/api/dashboard/stats')
        
        end_time = time.time()
        response_time = end_time - start_time
        
        self.assertEqual(response.status_code, 200)
        self.assertLess(response_time, 2.0)  # Debe responder en menos de 2 segundos
        
        data = json.loads(response.data)
        self.assertEqual(data['total_registros'], 50)
    
    def test_dashboard_data_consistency(self):
        """Prueba la consistencia de datos entre diferentes endpoints"""
        guardar_datos(self.test_data)
        
        # Obtener estadísticas
        stats_response = self.app.get('/api/dashboard/stats')
        stats_data = json.loads(stats_response.data)
        
        # Obtener registros recientes
        recent_response = self.app.get('/api/dashboard/recent-registros')
        recent_data = json.loads(recent_response.data)
        
        # Verificar consistencia
        self.assertEqual(stats_data['total_registros'], len(obtener_registros()))
        
        if recent_data:
            self.assertLessEqual(len(recent_data), 10)
            self.assertGreaterEqual(len(recent_data), 1)

class TestDashboardIntegration(unittest.TestCase):
    """Pruebas de integración para el dashboard"""
    
    def setUp(self):
        """Configuración inicial para pruebas de integración"""
        self.app = app.test_client()
        self.app.testing = True
        crear_tabla()
    
    def test_dashboard_complete_workflow(self):
        """Prueba el flujo completo del dashboard"""
        # 1. Verificar dashboard vacío
        response = self.app.get('/dashboard')
        self.assertEqual(response.status_code, 200)
        
        # 2. Verificar estadísticas vacías
        response = self.app.get('/api/dashboard/stats')
        data = json.loads(response.data)
        self.assertEqual(data['total_registros'], 0)
        
        # 3. Agregar datos
        test_data = {
            'nombre_completo': 'Test User',
            'edad': '25',
            'genero': 'Masculino',
            'peso_corporal': '70.0',
            'altura': '175.0',
            'tipo_ejercicio': 'Test Exercise',
            'nivel_riesgo': 'Bajo'
        }
        
        response = self.app.post('/guardar', data=test_data)
        self.assertEqual(response.status_code, 200)
        
        # 4. Verificar que las estadísticas se actualicen
        response = self.app.get('/api/dashboard/stats')
        data = json.loads(response.data)
        self.assertEqual(data['total_registros'], 1)
        
        # 5. Verificar que aparezca en registros recientes
        response = self.app.get('/api/dashboard/recent-registros')
        data = json.loads(response.data)
        self.assertEqual(len(data), 1)
        self.assertEqual(data[0]['nombre_completo'], 'Test User')
    
    def test_dashboard_navigation(self):
        """Prueba la navegación entre páginas del dashboard"""
        # Verificar que todas las rutas del dashboard funcionen
        routes = ['/dashboard', '/api/dashboard/stats', '/api/dashboard/chart-data', '/api/dashboard/recent-registros']
        
        for route in routes:
            response = self.app.get(route)
            self.assertEqual(response.status_code, 200, f"Ruta {route} falló")

if __name__ == '__main__':
    # Configurar logging para las pruebas
    import logging
    logging.basicConfig(level=logging.INFO)
    
    # Ejecutar pruebas
    unittest.main(verbosity=2) 