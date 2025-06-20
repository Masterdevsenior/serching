#!/usr/bin/env python3
"""
Pruebas unitarias para los modelos de base de datos
"""

import unittest
import sys
import os
from datetime import datetime, date
from unittest.mock import patch, MagicMock

# Agregar el directorio padre al path para importar los módulos
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from models.db import (
    get_db_connection,
    crear_tabla,
    guardar_datos,
    obtener_registros,
    eliminar_registro,
    obtener_fechas_disponibles,
    obtener_registros_por_fecha
)

class TestDatabaseConnection(unittest.TestCase):
    """Pruebas para la conexión a la base de datos"""
    
    @patch('models.db.psycopg2.connect')
    def test_get_db_connection_success(self, mock_connect):
        """Prueba conexión exitosa a la base de datos"""
        mock_conn = MagicMock()
        mock_connect.return_value = mock_conn
        
        result = get_db_connection()
        
        self.assertEqual(result, mock_conn)
        mock_connect.assert_called_once()
    
    @patch('models.db.psycopg2.connect')
    def test_get_db_connection_failure(self, mock_connect):
        """Prueba fallo en la conexión a la base de datos"""
        mock_connect.side_effect = Exception("Error de conexión")
        
        result = get_db_connection()
        
        self.assertIsNone(result)

class TestTableCreation(unittest.TestCase):
    """Pruebas para la creación de tablas"""
    
    @patch('models.db.psycopg2.connect')
    def test_crear_tabla_success(self, mock_connect):
        """Prueba creación exitosa de tabla"""
        mock_conn = MagicMock()
        mock_cursor = MagicMock()
        mock_conn.cursor.return_value = mock_cursor
        mock_cursor.fetchone.side_effect = [False, True]  # DB no existe, tabla creada
        mock_connect.return_value = mock_conn
        
        result = crear_tabla()
        
        self.assertTrue(result)
        mock_conn.commit.assert_called()
    
    @patch('models.db.psycopg2.connect')
    def test_crear_tabla_failure(self, mock_connect):
        """Prueba fallo en la creación de tabla"""
        mock_connect.side_effect = Exception("Error de base de datos")
        
        result = crear_tabla()
        
        self.assertFalse(result)

class TestDataOperations(unittest.TestCase):
    """Pruebas para operaciones de datos"""
    
    def setUp(self):
        """Configuración inicial para las pruebas"""
        self.sample_data = {
            'fecha_hora': '2024-01-15T10:30:00',
            'nombre_completo': 'Juan Pérez',
            'edad': '25',
            'genero': 'Masculino',
            'peso_corporal': '70.5',
            'altura': '175.0',
            'longitud_brazo': '65.0',
            'longitud_pierna': '85.0',
            'longitud_torso': '45.0',
            'antecedentes_lesiones': '1',
            'limitaciones_movilidad': '0',
            'experiencia_levantamiento': '1',
            'sin_contraindicaciones': '1',
            'ajuste_traje': '1',
            'calibracion_sincronizada': '1',
            'sensores_posicion': '1',
            'tipo_ejercicio': 'Levantamiento de pesas',
            'nivel_riesgo': 'Medio',
            'peso_carga': '50.0',
            'duracion_minutos': '30',
            'num_repeticiones': '10',
            'forma_objeto': 'Barra',
            'velocidad_movimiento': 'Moderada',
            'tipo_superficie': 'Estable'
        }
    
    @patch('models.db.get_db_connection')
    def test_guardar_datos_success(self, mock_get_conn):
        """Prueba guardado exitoso de datos"""
        mock_conn = MagicMock()
        mock_cursor = MagicMock()
        mock_conn.cursor.return_value = mock_cursor
        mock_get_conn.return_value = mock_conn
        
        result = guardar_datos(self.sample_data)
        
        self.assertTrue(result)
        mock_conn.commit.assert_called()
        mock_cursor.execute.assert_called()
    
    @patch('models.db.get_db_connection')
    def test_guardar_datos_missing_fields(self, mock_get_conn):
        """Prueba guardado con campos faltantes"""
        incomplete_data = {'nombre_completo': 'Juan Pérez'}  # Datos incompletos
        
        result = guardar_datos(incomplete_data)
        
        self.assertFalse(result)
    
    @patch('models.db.get_db_connection')
    def test_guardar_datos_connection_failure(self, mock_get_conn):
        """Prueba guardado con fallo de conexión"""
        mock_get_conn.return_value = None
        
        result = guardar_datos(self.sample_data)
        
        self.assertFalse(result)
    
    @patch('models.db.get_db_connection')
    def test_obtener_registros_success(self, mock_get_conn):
        """Prueba obtención exitosa de registros"""
        mock_conn = MagicMock()
        mock_cursor = MagicMock()
        mock_conn.cursor.return_value = mock_cursor
        
        # Simular datos de retorno
        mock_cursor.fetchall.return_value = [
            (1, datetime.now(), 'Juan Pérez', 25, 'Masculino', 70.5, 175.0, 65.0, 85.0, 45.0,
             True, False, True, True, True, True, True, 'Levantamiento', 'Medio', 50.0, 30, 10,
             'Barra', 'Moderada', 'Estable')
        ]
        mock_get_conn.return_value = mock_conn
        
        result = obtener_registros()
        
        self.assertIsInstance(result, list)
        self.assertGreater(len(result), 0)
    
    @patch('models.db.get_db_connection')
    def test_obtener_registros_empty(self, mock_get_conn):
        """Prueba obtención de registros cuando no hay datos"""
        mock_conn = MagicMock()
        mock_cursor = MagicMock()
        mock_conn.cursor.return_value = mock_cursor
        mock_cursor.fetchall.return_value = []
        mock_get_conn.return_value = mock_conn
        
        result = obtener_registros()
        
        self.assertEqual(result, [])
    
    @patch('models.db.get_db_connection')
    def test_eliminar_registro_success(self, mock_get_conn):
        """Prueba eliminación exitosa de registro"""
        mock_conn = MagicMock()
        mock_cursor = MagicMock()
        mock_conn.cursor.return_value = mock_cursor
        mock_cursor.rowcount = 1  # Una fila afectada
        mock_get_conn.return_value = mock_conn
        
        result = eliminar_registro(1)
        
        self.assertTrue(result)
        mock_conn.commit.assert_called()
    
    @patch('models.db.get_db_connection')
    def test_eliminar_registro_not_found(self, mock_get_conn):
        """Prueba eliminación de registro inexistente"""
        mock_conn = MagicMock()
        mock_cursor = MagicMock()
        mock_conn.cursor.return_value = mock_cursor
        mock_cursor.rowcount = 0  # Ninguna fila afectada
        mock_get_conn.return_value = mock_conn
        
        result = eliminar_registro(999)
        
        self.assertFalse(result)
    
    @patch('models.db.get_db_connection')
    def test_obtener_fechas_disponibles(self, mock_get_conn):
        """Prueba obtención de fechas disponibles"""
        mock_conn = MagicMock()
        mock_cursor = MagicMock()
        mock_conn.cursor.return_value = mock_cursor
        mock_cursor.fetchall.return_value = [
            (date(2024, 1, 15),),
            (date(2024, 1, 16),)
        ]
        mock_get_conn.return_value = mock_conn
        
        result = obtener_fechas_disponibles()
        
        self.assertIsInstance(result, list)
        self.assertEqual(len(result), 2)
    
    @patch('models.db.get_db_connection')
    def test_obtener_registros_por_fecha(self, mock_get_conn):
        """Prueba obtención de registros por fecha específica"""
        mock_conn = MagicMock()
        mock_cursor = MagicMock()
        mock_conn.cursor.return_value = mock_cursor
        mock_cursor.fetchall.return_value = [
            (1, datetime.now(), 'Juan Pérez', 25, 'Masculino', 70.5, 175.0, 65.0, 85.0, 45.0,
             True, False, True, True, True, True, True, 'Levantamiento', 'Medio', 50.0, 30, 10,
             'Barra', 'Moderada', 'Estable')
        ]
        mock_get_conn.return_value = mock_conn
        
        fecha = date(2024, 1, 15)
        result = obtener_registros_por_fecha(fecha)
        
        self.assertIsInstance(result, list)
        self.assertGreater(len(result), 0)

class TestDataValidation(unittest.TestCase):
    """Pruebas para validación de datos"""
    
    def test_edad_validation(self):
        """Prueba validación de edad"""
        # Edad válida
        valid_data = {'edad': '25'}
        self.assertTrue(1 <= int(valid_data['edad']) <= 120)
        
        # Edad inválida
        invalid_data = {'edad': '150'}
        self.assertFalse(1 <= int(invalid_data['edad']) <= 120)
    
    def test_peso_validation(self):
        """Prueba validación de peso"""
        # Peso válido
        valid_data = {'peso_corporal': '70.5'}
        self.assertTrue(float(valid_data['peso_corporal']) > 0)
        
        # Peso inválido
        invalid_data = {'peso_corporal': '-5.0'}
        self.assertFalse(float(invalid_data['peso_corporal']) > 0)

if __name__ == '__main__':
    unittest.main() 