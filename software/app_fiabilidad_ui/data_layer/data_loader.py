import pandas as pd
import os
from typing import Optional, Tuple, List
import logging

class DataLoader:
    """Capa de datos para manejar la carga y validación de archivos CSV"""
    
    def __init__(self):
        self.logger = logging.getLogger(__name__)
    
    def find_data_file(self, file_path: str) -> Optional[str]:
        """
        Busca el archivo de datos en diferentes rutas posibles
        
        Args:
            file_path: Ruta inicial del archivo
            
        Returns:
            Ruta válida del archivo o None si no se encuentra
        """
        # Rutas alternativas a probar
        rutas_alternativas = [
            file_path,
            "data/processed_data/merged/ProcessedMocap.csv",
            "../data/processed_data/merged/ProcessedMocap.csv",
            "../../data/processed_data/merged/ProcessedMocap.csv",
            "ProcessedMocap.csv"
        ]
        
        for ruta in rutas_alternativas:
            if os.path.exists(ruta):
                self.logger.info(f"Archivo encontrado en: {ruta}")
                return ruta
        
        self.logger.error("No se pudo encontrar el archivo en ninguna ruta")
        return None
    
    def load_data(self, file_path: str) -> Optional[pd.DataFrame]:
        """
        Carga el archivo CSV de datos
        
        Args:
            file_path: Ruta del archivo a cargar
            
        Returns:
            DataFrame con los datos o None si hay error
        """
        try:
            df = pd.read_csv(file_path)
            self.logger.info(f"Archivo cargado: {len(df)} registros, {len(df.columns)} columnas")
            return df
        except Exception as e:
            self.logger.error(f"Error al cargar el archivo: {e}")
            return None
    
    def validate_required_columns(self, df: pd.DataFrame) -> Tuple[bool, List[str], List[str]]:
        """
        Valida que existan las columnas requeridas
        
        Args:
            df: DataFrame a validar
            
        Returns:
            Tuple con (es_válido, columnas_encontradas, columnas_faltantes)
        """
        columnas_requeridas = ["Sujeto", "Sesion", "Tiempo"]
        columnas_encontradas = []
        columnas_faltantes = []
        
        for col in columnas_requeridas:
            if col in df.columns:
                columnas_encontradas.append(col)
            else:
                columnas_faltantes.append(col)
        
        es_valido = len(columnas_faltantes) == 0
        
        return es_valido, columnas_encontradas, columnas_faltantes
    
    def get_numeric_columns(self, df: pd.DataFrame) -> List[str]:
        """
        Identifica las columnas numéricas válidas
        
        Args:
            df: DataFrame a analizar
            
        Returns:
            Lista de nombres de columnas numéricas
        """
        cols_ex = ["Sujeto", "Sesion", "Tiempo"]
        
        def es_numerica(col_name: str, dataframe: pd.DataFrame) -> bool:
            if col_name in cols_ex:
                return False
            try:
                valores = pd.to_numeric(dataframe[col_name], errors='coerce')
                # Verificar que al menos el 50% de los valores son numéricos
                return valores.notna().sum() / len(valores) > 0.5
            except:
                return False
        
        numeric_cols = []
        for col in df.columns:
            if es_numerica(col, df):
                numeric_cols.append(col)
        
        return numeric_cols 