#!/usr/bin/env python3
"""
Pruebas unitarias para la aplicación Flask
"""

import unittest
import sys
import os
import json
from datetime import datetime
from unittest.mock import patch, MagicMock

# Agregar el directorio padre al path para importar los módulos
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

# Importar la aplicación Flask
import app

class TestAppRoutes(unittest.TestCase):
    """Pruebas para las rutas de la aplicación"""
    
    def setUp(self):
        """Configuración inicial para las pruebas"""
        self.app = app.app.test_client()
        self.app.testing = True
    
    def test_index_route(self):
        """Prueba la ruta principal"""
        response = self.app.get('/')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'Registro Protocolo Medicion', response.data)
    
    def test_dashboard_route(self):
        """Prueba la ruta del dashboard"""
        response = self.app.get('/dashboard')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'Dashboard de Protocolo de Medicion', response.data)
    
    def test_registros_route(self):
        """Prueba la ruta de registros"""
        response = self.app.get('/registros')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'Registros', response.data)
    
    def test_consulta_fecha_route(self):
        """Prueba la ruta de consulta por fecha"""
        response = self.app.get('/consulta-fecha')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'Consulta por Fecha', response.data)
    
    def test_registros_fecha_route(self):
        """Prueba la ruta de registros por fecha específica"""
        fecha = '2024-01-15'
        response = self.app.get(f'/registros-fecha/{fecha}')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'Registros del', response.data)

class TestAPIRoutes(unittest.TestCase):
    """Pruebas para las rutas de API"""
    
    def setUp(self):
        """Configuración inicial para las pruebas"""
        self.app = app.app.test_client()
        self.app.testing = True
    
    @patch('app.obtener_registros')
    def test_api_dashboard_stats_success(self, mock_obtener_registros):
        """Prueba API de estadísticas del dashboard con datos"""
        # Simular datos de registros
        mock_data = [
            (1, datetime.now(), 'Juan Pérez', 25, 'Masculino', 70.5, 175.0, 65.0, 85.0, 45.0,
             True, False, True, True, True, True, True, 'Levantamiento', 'Medio', 50.0, 30, 10,
             'Barra', 'Moderada', 'Estable'),
            (2, datetime.now(), 'María García', 30, 'Femenino', 60.0, 165.0, 60.0, 80.0, 40.0,
             False, False, True, True, True, True, True, 'Cardio', 'Bajo', 0.0, 45, 0,
             'N/A', 'Rápida', 'Estable')
        ]
        mock_obtener_registros.return_value = mock_data
        
        response = self.app.get('/api/dashboard/stats')
        self.assertEqual(response.status_code, 200)
        
        data = json.loads(response.data)
        self.assertIn('total_registros', data)
        self.assertEqual(data['total_registros'], 2)
        self.assertIn('promedio_edad', data)
        self.assertIn('promedio_peso', data)
    
    @patch('app.obtener_registros')
    def test_api_dashboard_stats_empty(self, mock_obtener_registros):
        """Prueba API de estadísticas del dashboard sin datos"""
        mock_obtener_registros.return_value = []
        
        response = self.app.get('/api/dashboard/stats')
        self.assertEqual(response.status_code, 200)
        
        data = json.loads(response.data)
        self.assertEqual(data['total_registros'], 0)
        self.assertEqual(data['promedio_edad'], 0)
    
    @patch('app.obtener_registros')
    def test_api_dashboard_chart_data(self, mock_obtener_registros):
        """Prueba API de datos para gráficos"""
        mock_data = [
            (1, datetime.now(), 'Juan Pérez', 25, 'Masculino', 70.5, 175.0, 65.0, 85.0, 45.0,
             True, False, True, True, True, True, True, 'Levantamiento', 'Medio', 50.0, 30, 10,
             'Barra', 'Moderada', 'Estable')
        ]
        mock_obtener_registros.return_value = mock_data
        
        response = self.app.get('/api/dashboard/chart-data')
        self.assertEqual(response.status_code, 200)
        
        data = json.loads(response.data)
        self.assertIn('registros_por_fecha', data)
        self.assertIn('peso_por_edad', data)
        self.assertIn('altura_por_genero', data)
        self.assertIn('ejercicios_por_mes', data)
    
    @patch('app.obtener_registros')
    def test_api_recent_registros(self, mock_obtener_registros):
        """Prueba API de registros recientes"""
        mock_data = [
            (1, datetime.now(), 'Juan Pérez', 25, 'Masculino', 70.5, 175.0, 65.0, 85.0, 45.0,
             True, False, True, True, True, True, True, 'Levantamiento', 'Medio', 50.0, 30, 10,
             'Barra', 'Moderada', 'Estable')
        ]
        mock_obtener_registros.return_value = mock_data
        
        response = self.app.get('/api/dashboard/recent-registros')
        self.assertEqual(response.status_code, 200)
        
        data = json.loads(response.data)
        self.assertIsInstance(data, list)
        if len(data) > 0:
            self.assertIn('id', data[0])
            self.assertIn('nombre_completo', data[0])
            self.assertIn('tipo_ejercicio', data[0])

class TestFormSubmission(unittest.TestCase):
    """Pruebas para el envío de formularios"""
    
    def setUp(self):
        """Configuración inicial para las pruebas"""
        self.app = app.app.test_client()
        self.app.testing = True
    
    @patch('app.guardar_datos')
    def test_guardar_success(self, mock_guardar_datos):
        """Prueba envío exitoso del formulario"""
        mock_guardar_datos.return_value = True
        
        form_data = {
            'fecha_hora': '2024-01-15T10:30:00',
            'nombre_completo': 'Juan Pérez',
            'edad': '25',
            'genero': 'Masculino',
            'peso_corporal': '70.5',
            'altura': '175.0',
            'longitud_brazo': '65.0',
            'longitud_pierna': '85.0',
            'longitud_torso': '45.0',
            'tipo_ejercicio': 'Levantamiento de pesas',
            'nivel_riesgo': 'Medio',
            'peso_carga': '50.0',
            'duracion_minutos': '30',
            'num_repeticiones': '10',
            'forma_objeto': 'Barra',
            'velocidad_movimiento': 'Moderada',
            'tipo_superficie': 'Estable'
        }
        
        response = self.app.post('/guardar', data=form_data)
        self.assertEqual(response.status_code, 200)
        
        data = json.loads(response.data)
        self.assertTrue(data['success'])
        self.assertIn('Datos guardados correctamente', data['message'])
    
    @patch('app.guardar_datos')
    def test_guardar_failure(self, mock_guardar_datos):
        """Prueba fallo en el envío del formulario"""
        mock_guardar_datos.return_value = False
        
        form_data = {
            'nombre_completo': 'Juan Pérez'  # Datos incompletos
        }
        
        response = self.app.post('/guardar', data=form_data)
        self.assertEqual(response.status_code, 200)
        
        data = json.loads(response.data)
        self.assertFalse(data['success'])
        self.assertIn('Error al guardar', data['message'])

class TestDeleteOperations(unittest.TestCase):
    """Pruebas para operaciones de eliminación"""
    
    def setUp(self):
        """Configuración inicial para las pruebas"""
        self.app = app.app.test_client()
        self.app.testing = True
    
    @patch('app.eliminar_registro')
    def test_eliminar_success(self, mock_eliminar_registro):
        """Prueba eliminación exitosa"""
        mock_eliminar_registro.return_value = True
        
        response = self.app.delete('/eliminar/1')
        self.assertEqual(response.status_code, 200)
        
        data = json.loads(response.data)
        self.assertTrue(data['success'])
        self.assertIn('Registro eliminado correctamente', data['message'])
    
    @patch('app.eliminar_registro')
    def test_eliminar_failure(self, mock_eliminar_registro):
        """Prueba fallo en eliminación"""
        mock_eliminar_registro.return_value = False
        
        response = self.app.delete('/eliminar/999')
        self.assertEqual(response.status_code, 200)
        
        data = json.loads(response.data)
        self.assertFalse(data['success'])
        self.assertIn('Error al eliminar', data['message'])

class TestExportOperations(unittest.TestCase):
    """Pruebas para operaciones de exportación"""
    
    def setUp(self):
        """Configuración inicial para las pruebas"""
        self.app = app.app.test_client()
        self.app.testing = True
    
    @patch('app.obtener_registros')
    def test_exportar_excel_success(self, mock_obtener_registros):
        """Prueba exportación exitosa a Excel"""
        mock_data = [
            (1, datetime.now(), 'Juan Pérez', 25, 'Masculino', 70.5, 175.0, 65.0, 85.0, 45.0,
             True, False, True, True, True, True, True, 'Levantamiento', 'Medio', 50.0, 30, 10,
             'Barra', 'Moderada', 'Estable')
        ]
        mock_obtener_registros.return_value = mock_data
        
        response = self.app.get('/exportar-excel')
        self.assertEqual(response.status_code, 200)
        self.assertIn('application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', response.headers['Content-Type'])
    
    @patch('app.obtener_registros')
    def test_exportar_excel_empty(self, mock_obtener_registros):
        """Prueba exportación sin datos"""
        mock_obtener_registros.return_value = []
        
        response = self.app.get('/exportar-excel')
        self.assertEqual(response.status_code, 200)
        
        data = json.loads(response.data)
        self.assertFalse(data['success'])
        self.assertIn('No hay registros para exportar', data['message'])

class TestErrorHandling(unittest.TestCase):
    """Pruebas para manejo de errores"""
    
    def setUp(self):
        """Configuración inicial para las pruebas"""
        self.app = app.app.test_client()
        self.app.testing = True
    
    def test_404_error(self):
        """Prueba manejo de error 404"""
        response = self.app.get('/ruta-inexistente')
        self.assertEqual(response.status_code, 404)
    
    @patch('app.guardar_datos')
    def test_guardar_exception(self, mock_guardar_datos):
        """Prueba manejo de excepción en guardado"""
        mock_guardar_datos.side_effect = Exception("Error de base de datos")
        
        form_data = {'nombre_completo': 'Juan Pérez'}
        response = self.app.post('/guardar', data=form_data)
        self.assertEqual(response.status_code, 200)
        
        data = json.loads(response.data)
        self.assertFalse(data['success'])
        self.assertIn('Error:', data['message'])

if __name__ == '__main__':
    unittest.main() 