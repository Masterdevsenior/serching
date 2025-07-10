#!/usr/bin/env python3
"""
Pruebas de integración para la aplicación completa
"""

import unittest
import sys
import os
import json
import tempfile
import shutil
from datetime import datetime, timedelta
from unittest.mock import patch, MagicMock

# Agregar el directorio padre al path para importar los módulos
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

# Importar la aplicación Flask
import app
from models.db import crear_tabla, guardar_datos, obtener_registros

class TestFullWorkflow(unittest.TestCase):
    """Pruebas del flujo completo de la aplicación"""
    
    def setUp(self):
        """Configuración inicial para las pruebas"""
        self.app = app.app.test_client()
        self.app.testing = True
        
        # Crear directorio temporal para pruebas
        self.test_dir = tempfile.mkdtemp()
        
        # Datos de prueba
        self.test_data = {
            'fecha_hora': datetime.now().strftime('%Y-%m-%dT%H:%M'),
            'nombre_completo': 'Usuario Prueba Integración',
            'edad': '28',
            'genero': 'Femenino',
            'peso_corporal': '65.0',
            'altura': '168.0',
            'longitud_brazo': '62.0',
            'longitud_pierna': '82.0',
            'longitud_torso': '42.0',
            'antecedentes_lesiones': '0',
            'limitaciones_movilidad': '0',
            'experiencia_levantamiento': '1',
            'sin_contraindicaciones': '1',
            'ajuste_traje': '1',
            'calibracion_sincronizada': '1',
            'sensores_posicion': '1',
            'tipo_ejercicio': 'Cardio',
            'nivel_riesgo': 'Bajo',
            'peso_carga': '0.0',
            'duracion_minutos': '45',
            'num_repeticiones': '0',
            'forma_objeto': 'N/A',
            'velocidad_movimiento': 'Rápida',
            'tipo_superficie': 'Estable'
        }
    
    def tearDown(self):
        """Limpieza después de las pruebas"""
        # Eliminar directorio temporal
        if os.path.exists(self.test_dir):
            shutil.rmtree(self.test_dir)
    
    @patch('models.db.crear_tabla')
    @patch('models.db.guardar_datos')
    @patch('models.db.obtener_registros')
    def test_complete_workflow(self, mock_obtener_registros, mock_guardar_datos, mock_crear_tabla):
        """Prueba el flujo completo: crear tabla, guardar datos, obtener registros"""
        # Configurar mocks
        mock_crear_tabla.return_value = True
        mock_guardar_datos.return_value = True
        
        # Simular datos de retorno
        mock_obtener_registros.return_value = [
            (1, datetime.now(), 'Usuario Prueba Integración', 28, 'Femenino', 65.0, 168.0, 62.0, 82.0, 42.0,
             False, False, True, True, True, True, True, 'Cardio', 'Bajo', 0.0, 45, 0,
             'N/A', 'Rápida', 'Estable')
        ]
        
        # 1. Verificar que la aplicación inicia correctamente
        response = self.app.get('/')
        self.assertEqual(response.status_code, 200)
        
        # 2. Verificar que el dashboard es accesible
        response = self.app.get('/dashboard')
        self.assertEqual(response.status_code, 200)
        
        # 3. Verificar que se pueden guardar datos
        response = self.app.post('/guardar', data=self.test_data)
        self.assertEqual(response.status_code, 200)
        
        data = json.loads(response.data)
        self.assertTrue(data['success'])
        
        # 4. Verificar que se pueden obtener estadísticas
        response = self.app.get('/api/dashboard/stats')
        self.assertEqual(response.status_code, 200)
        
        stats_data = json.loads(response.data)
        self.assertIn('total_registros', stats_data)
        
        # 5. Verificar que se pueden obtener datos para gráficos
        response = self.app.get('/api/dashboard/chart-data')
        self.assertEqual(response.status_code, 200)
        
        chart_data = json.loads(response.data)
        self.assertIn('registros_por_fecha', chart_data)
        
        # 6. Verificar que se pueden obtener registros recientes
        response = self.app.get('/api/dashboard/recent-registros')
        self.assertEqual(response.status_code, 200)
        
        recent_data = json.loads(response.data)
        self.assertIsInstance(recent_data, list)

class TestDashboardIntegration(unittest.TestCase):
    """Pruebas de integración específicas del dashboard"""
    
    def setUp(self):
        """Configuración inicial para las pruebas"""
        self.app = app.app.test_client()
        self.app.testing = True
    
    @patch('app.obtener_registros')
    def test_dashboard_with_multiple_records(self, mock_obtener_registros):
        """Prueba el dashboard con múltiples registros"""
        # Simular múltiples registros
        mock_data = [
            (1, datetime.now() - timedelta(days=1), 'Juan Pérez', 25, 'Masculino', 70.5, 175.0, 65.0, 85.0, 45.0,
             True, False, True, True, True, True, True, 'Levantamiento', 'Medio', 50.0, 30, 10,
             'Barra', 'Moderada', 'Estable'),
            (2, datetime.now(), 'María García', 30, 'Femenino', 60.0, 165.0, 60.0, 80.0, 40.0,
             False, False, True, True, True, True, True, 'Cardio', 'Bajo', 0.0, 45, 0,
             'N/A', 'Rápida', 'Estable'),
            (3, datetime.now(), 'Carlos López', 35, 'Masculino', 80.0, 180.0, 70.0, 90.0, 50.0,
             True, True, False, True, True, True, True, 'Levantamiento', 'Alto', 80.0, 60, 15,
             'Barra', 'Lenta', 'Estable')
        ]
        mock_obtener_registros.return_value = mock_data
        
        # Probar estadísticas
        response = self.app.get('/api/dashboard/stats')
        self.assertEqual(response.status_code, 200)
        
        stats = json.loads(response.data)
        self.assertEqual(stats['total_registros'], 3)
        self.assertAlmostEqual(stats['promedio_edad'], 30.0, places=1)
        self.assertAlmostEqual(stats['promedio_peso'], 70.2, places=1)
        
        # Verificar distribución por género
        self.assertIn('Masculino', stats['distribucion_genero'])
        self.assertIn('Femenino', stats['distribucion_genero'])
        self.assertEqual(stats['distribucion_genero']['Masculino'], 2)
        self.assertEqual(stats['distribucion_genero']['Femenino'], 1)
        
        # Verificar distribución de ejercicios
        self.assertIn('Levantamiento', stats['distribucion_ejercicios'])
        self.assertIn('Cardio', stats['distribucion_ejercicios'])
        
        # Verificar distribución de riesgo
        self.assertIn('Medio', stats['distribucion_riesgo'])
        self.assertIn('Bajo', stats['distribucion_riesgo'])
        self.assertIn('Alto', stats['distribucion_riesgo'])
    
    @patch('app.obtener_registros')
    def test_dashboard_chart_data_integration(self, mock_obtener_registros):
        """Prueba la integración de datos para gráficos"""
        # Simular datos con diferentes fechas
        base_date = datetime.now().date()
        mock_data = [
            (1, datetime.combine(base_date - timedelta(days=2), datetime.min.time()), 'Usuario 1', 25, 'Masculino', 70.0, 175.0, 65.0, 85.0, 45.0,
             True, False, True, True, True, True, True, 'Levantamiento', 'Medio', 50.0, 30, 10, 'Barra', 'Moderada', 'Estable'),
            (2, datetime.combine(base_date - timedelta(days=1), datetime.min.time()), 'Usuario 2', 30, 'Femenino', 60.0, 165.0, 60.0, 80.0, 40.0,
             False, False, True, True, True, True, True, 'Cardio', 'Bajo', 0.0, 45, 0, 'N/A', 'Rápida', 'Estable'),
            (3, datetime.combine(base_date, datetime.min.time()), 'Usuario 3', 35, 'Masculino', 80.0, 180.0, 70.0, 90.0, 50.0,
             True, True, False, True, True, True, True, 'Levantamiento', 'Alto', 80.0, 60, 15, 'Barra', 'Lenta', 'Estable')
        ]
        mock_obtener_registros.return_value = mock_data
        
        response = self.app.get('/api/dashboard/chart-data')
        self.assertEqual(response.status_code, 200)
        
        chart_data = json.loads(response.data)
        
        # Verificar registros por fecha
        self.assertIn('registros_por_fecha', chart_data)
        registros_por_fecha = chart_data['registros_por_fecha']
        self.assertGreater(len(registros_por_fecha), 0)
        
        # Verificar peso por edad
        self.assertIn('peso_por_edad', chart_data)
        peso_por_edad = chart_data['peso_por_edad']
        self.assertEqual(len(peso_por_edad), 3)
        
        # Verificar altura por género
        self.assertIn('altura_por_genero', chart_data)
        altura_por_genero = chart_data['altura_por_genero']
        self.assertIn('Masculino', altura_por_genero)
        self.assertIn('Femenino', altura_por_genero)

class TestDataValidationIntegration(unittest.TestCase):
    """Pruebas de integración para validación de datos"""
    
    def setUp(self):
        """Configuración inicial para las pruebas"""
        self.app = app.app.test_client()
        self.app.testing = True
    
    @patch('app.guardar_datos')
    def test_form_validation_integration(self, mock_guardar_datos):
        """Prueba la validación de formularios en el contexto completo"""
        # Datos válidos
        valid_data = {
            'fecha_hora': datetime.now().strftime('%Y-%m-%dT%H:%M'),
            'nombre_completo': 'Usuario Válido',
            'edad': '25',
            'genero': 'Masculino',
            'peso_corporal': '70.5',
            'altura': '175.0',
            'tipo_ejercicio': 'Levantamiento de pesas',
            'nivel_riesgo': 'Medio',
            'peso_carga': '50.0',
            'duracion_minutos': '30',
            'num_repeticiones': '10'
        }
        
        mock_guardar_datos.return_value = True
        
        response = self.app.post('/guardar', data=valid_data)
        self.assertEqual(response.status_code, 200)
        
        data = json.loads(response.data)
        self.assertTrue(data['success'])
        
        # Datos inválidos - edad fuera de rango
        invalid_data = valid_data.copy()
        invalid_data['edad'] = '150'  # Edad inválida
        
        response = self.app.post('/guardar', data=invalid_data)
        self.assertEqual(response.status_code, 200)
        
        # Datos inválidos - peso negativo
        invalid_data = valid_data.copy()
        invalid_data['peso_corporal'] = '-5.0'  # Peso inválido
        
        response = self.app.post('/guardar', data=invalid_data)
        self.assertEqual(response.status_code, 200)

class TestErrorHandlingIntegration(unittest.TestCase):
    """Pruebas de integración para manejo de errores"""
    
    def setUp(self):
        """Configuración inicial para las pruebas"""
        self.app = app.app.test_client()
        self.app.testing = True
    
    @patch('app.obtener_registros')
    def test_dashboard_error_handling(self, mock_obtener_registros):
        """Prueba el manejo de errores en el dashboard"""
        # Simular error en la base de datos
        mock_obtener_registros.side_effect = Exception("Error de base de datos")
        
        response = self.app.get('/api/dashboard/stats')
        self.assertEqual(response.status_code, 500)
        
        data = json.loads(response.data)
        self.assertIn('error', data)
    
    @patch('app.obtener_registros')
    def test_chart_data_error_handling(self, mock_obtener_registros):
        """Prueba el manejo de errores en datos de gráficos"""
        # Simular error en la base de datos
        mock_obtener_registros.side_effect = Exception("Error de base de datos")
        
        response = self.app.get('/api/dashboard/chart-data')
        self.assertEqual(response.status_code, 500)
        
        data = json.loads(response.data)
        self.assertIn('error', data)

class TestPerformanceIntegration(unittest.TestCase):
    """Pruebas de integración para rendimiento"""
    
    def setUp(self):
        """Configuración inicial para las pruebas"""
        self.app = app.app.test_client()
        self.app.testing = True
    
    @patch('app.obtener_registros')
    def test_dashboard_performance_with_large_dataset(self, mock_obtener_registros):
        """Prueba el rendimiento del dashboard con un gran conjunto de datos"""
        # Simular un gran conjunto de datos
        large_dataset = []
        base_date = datetime.now()
        
        for i in range(1000):  # 1000 registros
            large_dataset.append((
                i + 1,
                base_date - timedelta(days=i % 30),
                f'Usuario {i + 1}',
                20 + (i % 50),  # Edad entre 20-70
                'Masculino' if i % 2 == 0 else 'Femenino',
                60.0 + (i % 30),  # Peso entre 60-90
                160.0 + (i % 30),  # Altura entre 160-190
                60.0 + (i % 10), 65.0 + (i % 10), 40.0 + (i % 10),
                i % 2 == 0, i % 3 == 0, i % 2 == 1, True, True, True, True,
                'Levantamiento' if i % 2 == 0 else 'Cardio',
                'Medio' if i % 3 == 0 else ('Bajo' if i % 3 == 1 else 'Alto'),
                50.0 + (i % 30), 30 + (i % 30), 10 + (i % 10),
                'Barra', 'Moderada', 'Estable'
            ))
        
        mock_obtener_registros.return_value = large_dataset
        
        # Medir tiempo de respuesta para estadísticas
        import time
        start_time = time.time()
        
        response = self.app.get('/api/dashboard/stats')
        
        end_time = time.time()
        response_time = end_time - start_time
        
        self.assertEqual(response.status_code, 200)
        self.assertLess(response_time, 5.0)  # Debe responder en menos de 5 segundos
        
        # Verificar que los datos son correctos
        data = json.loads(response.data)
        self.assertEqual(data['total_registros'], 1000)
        self.assertGreater(data['promedio_edad'], 0)
        self.assertGreater(data['promedio_peso'], 0)

if __name__ == '__main__':
    unittest.main() 