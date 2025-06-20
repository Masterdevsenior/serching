#!/usr/bin/env python3
"""
Configuración específica para pruebas
"""

import os
import sys

# Configuración de base de datos para pruebas
TEST_DB_CONFIG = {
    'DB_HOST': 'localhost',
    'DB_PORT': '5432',
    'DB_NAME': 'formulario_protocolo_tesla_test',  # Base de datos separada para pruebas
    'DB_USER': 'postgres',
    'DB_PASSWORD': 'postgres'
}

def setup_test_environment():
    """Configurar el entorno para pruebas"""
    # Establecer variables de entorno para pruebas
    for key, value in TEST_DB_CONFIG.items():
        os.environ[key] = str(value)
    
    print("Configuración de pruebas establecida:")
    print(f"   Base de datos: {TEST_DB_CONFIG['DB_NAME']}")
    print(f"   Host: {TEST_DB_CONFIG['DB_HOST']}:{TEST_DB_CONFIG['DB_PORT']}")

def cleanup_test_environment():
    """Limpiar el entorno de pruebas"""
    # Restaurar configuración original si es necesario
    pass

class TestDatabaseManager:
    """Gestor de base de datos para pruebas"""
    
    def __init__(self):
        self.test_db_name = TEST_DB_CONFIG['DB_NAME']
    
    def create_test_database(self):
        """Crear base de datos de prueba"""
        try:
            import psycopg2
            from psycopg2 import Error
            
            # Conectar a postgres para crear la base de datos de prueba
            conn = psycopg2.connect(
                dbname="postgres",
                user=TEST_DB_CONFIG['DB_USER'],
                password=TEST_DB_CONFIG['DB_PASSWORD'],
                host=TEST_DB_CONFIG['DB_HOST'],
                port=TEST_DB_CONFIG['DB_PORT']
            )
            conn.autocommit = True
            cursor = conn.cursor()
            
            # Verificar si la base de datos de prueba existe
            cursor.execute("SELECT 1 FROM pg_database WHERE datname = %s", (self.test_db_name,))
            if not cursor.fetchone():
                print(f"Creando base de datos de prueba: {self.test_db_name}")
                cursor.execute(f"CREATE DATABASE {self.test_db_name} WITH ENCODING 'UTF8'")
                print(f"Base de datos de prueba creada: {self.test_db_name}")
            else:
                print(f"Base de datos de prueba ya existe: {self.test_db_name}")
            
            cursor.close()
            conn.close()
            return True
            
        except Error as e:
            print(f"Error al crear base de datos de prueba: {e}")
            return False
    
    def drop_test_database(self):
        """Eliminar base de datos de prueba"""
        try:
            import psycopg2
            from psycopg2 import Error
            
            # Conectar a postgres para eliminar la base de datos de prueba
            conn = psycopg2.connect(
                dbname="postgres",
                user=TEST_DB_CONFIG['DB_USER'],
                password=TEST_DB_CONFIG['DB_PASSWORD'],
                host=TEST_DB_CONFIG['DB_HOST'],
                port=TEST_DB_CONFIG['DB_PORT']
            )
            conn.autocommit = True
            cursor = conn.cursor()
            
            # Terminar conexiones activas a la base de datos de prueba
            cursor.execute(f"""
                SELECT pg_terminate_backend(pid)
                FROM pg_stat_activity
                WHERE datname = '{self.test_db_name}'
                AND pid <> pg_backend_pid()
            """)
            
            # Eliminar la base de datos de prueba
            cursor.execute(f"DROP DATABASE IF EXISTS {self.test_db_name}")
            print(f"Base de datos de prueba eliminada: {self.test_db_name}")
            
            cursor.close()
            conn.close()
            return True
            
        except Error as e:
            print(f"Error al eliminar base de datos de prueba: {e}")
            return False 