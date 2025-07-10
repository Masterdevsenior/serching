import psycopg2
import psycopg2.extras
from typing import Dict, List, Optional
import logging
import os
from contextlib import contextmanager

class PostgreSQLVariableDescriptions:
    """Maneja las descripciones de variables desde PostgreSQL"""
    
    def __init__(self, host: str = None, port: str = None, database: str = None, 
                 user: str = None, password: str = None):
        """
        Inicializa la conexión a PostgreSQL
        
        Args:
            host: Host de la base de datos
            port: Puerto de la base de datos
            database: Nombre de la base de datos
            user: Usuario de la base de datos
            password: Contraseña de la base de datos
        """
        self.host = host or os.getenv('DB_HOST', 'localhost')
        self.port = port or os.getenv('DB_PORT', '5432')
        self.database = database or os.getenv('DB_NAME', 'bd_tesla_suit')
        self.user = user or os.getenv('DB_USER', 'postgres')
        self.password = password or os.getenv('DB_PASSWORD', '')
        
        self.logger = logging.getLogger(__name__)
        self.descriptions_cache = {}
        self.connection = None
        
    @contextmanager
    def get_connection(self):
        """Context manager para manejar conexiones a PostgreSQL"""
        try:
            conn = psycopg2.connect(
                host=self.host,
                port=self.port,
                database=self.database,
                user=self.user,
                password=self.password
            )
            yield conn
        except Exception as e:
            self.logger.error(f"Error de conexión a PostgreSQL: {e}")
            raise
        finally:
            if conn:
                conn.close()
    
    def test_connection(self) -> bool:
        """
        Prueba la conexión a la base de datos
        
        Returns:
            True si la conexión es exitosa, False en caso contrario
        """
        try:
            with self.get_connection() as conn:
                with conn.cursor() as cursor:
                    cursor.execute("SELECT 1")
                    result = cursor.fetchone()
                    return result is not None
        except Exception as e:
            self.logger.error(f"Error al probar conexión: {e}")
            return False
    
    def load_descriptions_from_postgresql(self, table_name: str = "processedmocap") -> Dict[str, str]:
        """
        Carga descripciones desde PostgreSQL
        
        Args:
            table_name: Nombre de la tabla de metadatos
            
        Returns:
            Diccionario con variable -> descripción
        """
        try:
            with self.get_connection() as conn:
                with conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor) as cursor:
                    # Consulta para obtener metadatos
                    query = """
                    SELECT 
                        column_name,
                        meaning_en,
                        translation_es,
                        description
                    FROM teslasuit.processedmocap_metadata
                    WHERE table_name = %s
                    ORDER BY column_name
                    """
                    
                    cursor.execute(query, (table_name,))
                    results = cursor.fetchall()
                    
                    descriptions = {}
                    for row in results:
                        column_name = row['column_name']
                        meaning_en = row['meaning_en']
                        translation_es = row['translation_es']
                        description = row['description']
                        
                        # Crear descripción enriquecida
                        enriched_description = f"{translation_es} ({meaning_en}): {description}"
                        descriptions[column_name] = enriched_description
                    
                    self.logger.info(f"Cargadas {len(descriptions)} descripciones desde PostgreSQL")
                    return descriptions
                    
        except Exception as e:
            self.logger.error(f"Error al cargar descripciones desde PostgreSQL: {e}")
            return {}
    
    def get_table_info(self) -> Dict[str, str]:
        """
        Obtiene información de las tablas disponibles
        
        Returns:
            Diccionario con tabla -> descripción
        """
        try:
            with self.get_connection() as conn:
                with conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor) as cursor:
                    query = """
                    SELECT table_name, table_description
                    FROM teslasuit.table_info
                    ORDER BY table_name
                    """
                    
                    cursor.execute(query)
                    results = cursor.fetchall()
                    
                    table_info = {}
                    for row in results:
                        table_info[row['table_name']] = row['table_description']
                    
                    return table_info
                    
        except Exception as e:
            self.logger.error(f"Error al obtener información de tablas: {e}")
            return {}
    
    def get_available_columns(self, table_name: str = "processedmocap") -> List[str]:
        """
        Obtiene las columnas disponibles en una tabla
        
        Args:
            table_name: Nombre de la tabla
            
        Returns:
            Lista de nombres de columnas
        """
        try:
            with self.get_connection() as conn:
                with conn.cursor() as cursor:
                    query = """
                    SELECT column_name
                    FROM teslasuit.processedmocap_metadata
                    WHERE table_name = %s
                    ORDER BY column_name
                    """
                    
                    cursor.execute(query, (table_name,))
                    results = cursor.fetchall()
                    
                    return [row[0] for row in results]
                    
        except Exception as e:
            self.logger.error(f"Error al obtener columnas disponibles: {e}")
            return []
    
    def get_description(self, variable_name: str) -> str:
        """
        Obtiene la descripción de una variable
        
        Args:
            variable_name: Nombre de la variable
            
        Returns:
            Descripción de la variable o el nombre si no se encuentra
        """
        return self.descriptions_cache.get(variable_name, variable_name)
    
    def get_descriptions_for_variables(self, variable_names: List[str]) -> Dict[str, str]:
        """
        Obtiene descripciones para una lista de variables
        
        Args:
            variable_names: Lista de nombres de variables
            
        Returns:
            Diccionario con variable -> descripción
        """
        return {var: self.get_description(var) for var in variable_names}
    
    def load_descriptions(self, table_name: str = "processedmocap") -> bool:
        """
        Carga descripciones desde PostgreSQL
        
        Args:
            table_name: Nombre de la tabla de metadatos
            
        Returns:
            True si se cargaron exitosamente, False en caso contrario
        """
        try:
            # Probar conexión primero
            if not self.test_connection():
                self.logger.error("No se pudo conectar a PostgreSQL")
                return False
            
            # Cargar descripciones
            self.descriptions_cache = self.load_descriptions_from_postgresql(table_name)
            
            success = len(self.descriptions_cache) > 0
            if success:
                self.logger.info(f"Cargadas {len(self.descriptions_cache)} descripciones desde PostgreSQL")
            else:
                self.logger.warning("No se encontraron descripciones en PostgreSQL")
            
            return success
            
        except Exception as e:
            self.logger.error(f"Error al cargar descripciones: {e}")
            return False
    
    def get_connection_info(self) -> Dict[str, str]:
        """
        Obtiene información de la conexión (sin contraseña)
        
        Returns:
            Diccionario con información de conexión
        """
        return {
            'host': self.host,
            'port': self.port,
            'database': self.database,
            'user': self.user,
            'connected': self.test_connection()
        } 