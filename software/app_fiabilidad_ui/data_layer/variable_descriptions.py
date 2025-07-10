import pandas as pd
import sqlite3
from typing import Dict, Optional, List
import logging

class VariableDescriptions:
    """Maneja las descripciones de variables desde una base de datos"""
    
    def __init__(self, db_path: str = None):
        self.db_path = db_path
        self.logger = logging.getLogger(__name__)
        self.descriptions_cache = {}
    
    def load_descriptions_from_csv(self, csv_path: str) -> Dict[str, str]:
        """
        Carga descripciones desde un archivo CSV
        
        Args:
            csv_path: Ruta al archivo CSV con descripciones
            
        Returns:
            Diccionario con variable -> descripción
        """
        try:
            df = pd.read_csv(csv_path)
            
            # Asumir columnas 'variable' y 'descripcion' o 'description'
            if 'variable' in df.columns and 'descripcion' in df.columns:
                return dict(zip(df['variable'], df['descripcion']))
            elif 'variable' in df.columns and 'description' in df.columns:
                return dict(zip(df['variable'], df['description']))
            elif 'Variable' in df.columns and 'Descripcion' in df.columns:
                return dict(zip(df['Variable'], df['Descripcion']))
            elif 'Variable' in df.columns and 'Description' in df.columns:
                return dict(zip(df['Variable'], df['Description']))
            else:
                # Intentar con las primeras dos columnas
                if len(df.columns) >= 2:
                    return dict(zip(df.iloc[:, 0], df.iloc[:, 1]))
                else:
                    self.logger.warning("No se encontraron columnas de variable y descripción")
                    return {}
                    
        except Exception as e:
            self.logger.error(f"Error al cargar descripciones desde CSV: {e}")
            return {}
    
    def load_descriptions_from_sqlite(self, db_path: str, table_name: str = "variable_descriptions") -> Dict[str, str]:
        """
        Carga descripciones desde una base de datos SQLite
        
        Args:
            db_path: Ruta a la base de datos SQLite
            table_name: Nombre de la tabla con descripciones
            
        Returns:
            Diccionario con variable -> descripción
        """
        try:
            conn = sqlite3.connect(db_path)
            
            # Verificar qué columnas tiene la tabla
            cursor = conn.cursor()
            cursor.execute(f"PRAGMA table_info({table_name})")
            columns = [column[1] for column in cursor.fetchall()]
            
            # Determinar nombres de columnas
            var_col = None
            desc_col = None
            
            for col in columns:
                if 'variable' in col.lower() or 'var' in col.lower():
                    var_col = col
                elif 'desc' in col.lower():
                    desc_col = col
            
            if var_col and desc_col:
                query = f"SELECT {var_col}, {desc_col} FROM {table_name}"
                df = pd.read_sql_query(query, conn)
                conn.close()
                return dict(zip(df[var_col], df[desc_col]))
            else:
                self.logger.warning(f"No se encontraron columnas apropiadas en {table_name}")
                conn.close()
                return {}
                
        except Exception as e:
            self.logger.error(f"Error al cargar descripciones desde SQLite: {e}")
            return {}
    
    def load_descriptions_from_excel(self, excel_path: str, sheet_name: str = "Sheet1") -> Dict[str, str]:
        """
        Carga descripciones desde un archivo Excel
        
        Args:
            excel_path: Ruta al archivo Excel
            sheet_name: Nombre de la hoja
            
        Returns:
            Diccionario con variable -> descripción
        """
        try:
            df = pd.read_excel(excel_path, sheet_name=sheet_name)
            
            # Buscar columnas apropiadas
            var_col = None
            desc_col = None
            
            for col in df.columns:
                if 'variable' in col.lower() or 'var' in col.lower():
                    var_col = col
                elif 'desc' in col.lower():
                    desc_col = col
            
            if var_col and desc_col:
                return dict(zip(df[var_col], df[desc_col]))
            elif len(df.columns) >= 2:
                return dict(zip(df.iloc[:, 0], df.iloc[:, 1]))
            else:
                self.logger.warning("No se encontraron columnas apropiadas en Excel")
                return {}
                
        except Exception as e:
            self.logger.error(f"Error al cargar descripciones desde Excel: {e}")
            return {}
    
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
    
    def add_description(self, variable_name: str, description: str) -> None:
        """
        Agrega o actualiza una descripción
        
        Args:
            variable_name: Nombre de la variable
            description: Descripción de la variable
        """
        self.descriptions_cache[variable_name] = description
    
    def load_descriptions(self, source_path: str, source_type: str = "auto") -> bool:
        """
        Carga descripciones desde diferentes fuentes
        
        Args:
            source_path: Ruta al archivo o base de datos
            source_type: Tipo de fuente ('csv', 'sqlite', 'excel', 'auto')
            
        Returns:
            True si se cargaron exitosamente, False en caso contrario
        """
        try:
            if source_type == "auto":
                if source_path.endswith('.csv'):
                    source_type = "csv"
                elif source_path.endswith('.db') or source_path.endswith('.sqlite'):
                    source_type = "sqlite"
                elif source_path.endswith('.xlsx') or source_path.endswith('.xls'):
                    source_type = "excel"
            
            if source_type == "csv":
                self.descriptions_cache = self.load_descriptions_from_csv(source_path)
            elif source_type == "sqlite":
                self.descriptions_cache = self.load_descriptions_from_sqlite(source_path)
            elif source_type == "excel":
                self.descriptions_cache = self.load_descriptions_from_excel(source_path)
            else:
                self.logger.error(f"Tipo de fuente no soportado: {source_type}")
                return False
            
            self.logger.info(f"Cargadas {len(self.descriptions_cache)} descripciones de variables")
            return len(self.descriptions_cache) > 0
            
        except Exception as e:
            self.logger.error(f"Error al cargar descripciones: {e}")
            return False 