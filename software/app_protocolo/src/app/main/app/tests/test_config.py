#!/usr/bin/env python3
"""
Configuración para las pruebas que evita el uso de la base de datos real
"""

import os
import sys
from unittest.mock import patch, MagicMock

# Configurar variables de entorno para pruebas
os.environ['TESTING'] = 'True'
os.environ['DB_HOST'] = 'localhost'
os.environ['DB_PORT'] = '5432'
os.environ['DB_NAME'] = 'test_database'
os.environ['DB_USER'] = 'test_user'
os.environ['DB_PASSWORD'] = 'test_password'

def mock_db_connection():
    """Mock para la conexión de base de datos"""
    mock_conn = MagicMock()
    mock_cursor = MagicMock()
    mock_conn.cursor.return_value = mock_cursor
    return mock_conn, mock_cursor

def mock_sample_data():
    """Datos de ejemplo para las pruebas"""
    from datetime import datetime
    
    return {
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

def mock_sample_records():
    """Registros de ejemplo para las pruebas"""
    from datetime import datetime
    
    return [
        {
            'id': 1,
            'fecha_hora': '2024-01-15 10:30:00',
            'nombre_completo': 'Juan Pérez',
            'edad': 25,
            'genero': 'Masculino',
            'peso_corporal': 70.5,
            'altura': 175.0,
            'longitud_brazo': 65.0,
            'longitud_pierna': 85.0,
            'longitud_torso': 45.0,
            'antecedentes_lesiones': True,
            'limitaciones_movilidad': False,
            'experiencia_levantamiento': True,
            'sin_contraindicaciones': True,
            'ajuste_traje': True,
            'calibracion_sincronizada': True,
            'sensores_posicion': True,
            'tipo_ejercicio': 'Levantamiento',
            'nivel_riesgo': 'Medio',
            'peso_carga': 50.0,
            'duracion_minutos': 30,
            'num_repeticiones': 10,
            'forma_objeto': 'Barra',
            'velocidad_movimiento': 'Moderada',
            'tipo_superficie': 'Estable'
        },
        {
            'id': 2,
            'fecha_hora': '2024-01-16 14:20:00',
            'nombre_completo': 'María García',
            'edad': 30,
            'genero': 'Femenino',
            'peso_corporal': 60.0,
            'altura': 165.0,
            'longitud_brazo': 60.0,
            'longitud_pierna': 80.0,
            'longitud_torso': 40.0,
            'antecedentes_lesiones': False,
            'limitaciones_movilidad': False,
            'experiencia_levantamiento': True,
            'sin_contraindicaciones': True,
            'ajuste_traje': True,
            'calibracion_sincronizada': True,
            'sensores_posicion': True,
            'tipo_ejercicio': 'Cardio',
            'nivel_riesgo': 'Bajo',
            'peso_carga': 0.0,
            'duracion_minutos': 45,
            'num_repeticiones': 0,
            'forma_objeto': 'N/A',
            'velocidad_movimiento': 'Rápida',
            'tipo_superficie': 'Estable'
        }
    ] 