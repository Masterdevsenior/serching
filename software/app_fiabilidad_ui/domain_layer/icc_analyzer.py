import pandas as pd
import numpy as np
from typing import List, Dict, Tuple, Optional
import logging

class ICCAnalyzer:
    """Capa de dominio para el análisis de correlación intraclase (ICC)"""
    
    def __init__(self):
        self.logger = logging.getLogger(__name__)
    
    def prepare_data_for_icc(self, df: pd.DataFrame, numeric_cols: List[str]) -> pd.DataFrame:
        """
        Prepara los datos para el análisis ICC
        
        Args:
            df: DataFrame original
            numeric_cols: Lista de columnas numéricas a analizar
            
        Returns:
            DataFrame preparado para ICC
        """
        # Renombrar columnas
        df_icc = df.rename(columns={
            "Sujeto": "subject",
            "Sesion": "session", 
            "Tiempo": "repetition"
        })
        
        df_vars = pd.DataFrame()
        
        for i, col in enumerate(numeric_cols):
            if i % 50 == 0:
                self.logger.info(f"Procesando columna {i+1}/{len(numeric_cols)}: {col}")
            
            tmp = df_icc[["subject", "repetition", "session", col]].copy()
            # Convertir a numérico y eliminar valores no válidos
            tmp[col] = pd.to_numeric(tmp[col], errors='coerce')
            tmp = tmp.dropna(subset=[col])
            
            if len(tmp) > 0:
                tmp = tmp.rename(columns={col: "score"})
                tmp["variable"] = col
                df_vars = pd.concat([df_vars, tmp], ignore_index=True)
        
        return df_vars
    
    def validate_data_completeness(self, df_clean: pd.DataFrame) -> Tuple[bool, int, int]:
        """
        Valida que los datos tengan la completitud necesaria para ICC
        
        Args:
            df_clean: DataFrame limpio
            
        Returns:
            Tuple con (es_válido, num_sujetos, num_repeticiones)
        """
        subjects = df_clean["subject"].nunique()
        repetitions = df_clean["repetition"].nunique()
        
        es_valido = subjects >= 2 and repetitions >= 2
        
        return es_valido, subjects, repetitions
    
    def calculate_averages(self, df_clean: pd.DataFrame) -> pd.DataFrame:
        """
        Calcula promedios por sujeto y repetición
        
        Args:
            df_clean: DataFrame limpio
            
        Returns:
            DataFrame con promedios calculados
        """
        df_avg = df_clean.groupby(["subject", "repetition", "variable"])["score"].mean().reset_index()
        return df_avg
    
    def get_complete_subjects(self, df_avg: pd.DataFrame) -> List:
        """
        Obtiene sujetos que tienen ambas repeticiones
        
        Args:
            df_avg: DataFrame con promedios
            
        Returns:
            Lista de sujetos completos
        """
        completeness = df_avg.groupby(["subject", "variable"])["repetition"].nunique().reset_index()
        complete_subjects = completeness[completeness["repetition"] == 2]["subject"].unique()
        return list(complete_subjects)
    
    def calculate_icc_for_variables(self, df_final: pd.DataFrame) -> List[Dict]:
        """
        Calcula ICC para todas las variables
        
        Args:
            df_final: DataFrame final preparado
            
        Returns:
            Lista de resultados ICC por variable
        """
        variables = df_final["variable"].unique()
        resultados_icc = []
        
        for i, var in enumerate(variables):
            if i % 20 == 0:
                self.logger.info(f"Procesando variable {i+1}/{len(variables)}: {var}")
            
            var_data = df_final[df_final["variable"] == var]
            
            # Crear matriz de datos para ICC
            pivot_data = var_data.pivot(index="subject", columns="repetition", values="score")
            
            if len(pivot_data) >= 2 and pivot_data.shape[1] >= 2:
                # Calcular correlación entre repeticiones
                corr = pivot_data.corr().iloc[0, 1]
                resultados_icc.append({
                    'variable': var,
                    'correlacion': corr,
                    'sujetos': len(pivot_data)
                })
            else:
                resultados_icc.append({
                    'variable': var,
                    'correlacion': np.nan,
                    'sujetos': 0
                })
        
        return resultados_icc
    
    def filter_high_icc_variables(self, resultados_icc: List[Dict], threshold: float = 0.90) -> pd.DataFrame:
        """
        Filtra variables con ICC alto
        
        Args:
            resultados_icc: Lista de resultados ICC
            threshold: Umbral de ICC (por defecto 0.90)
            
        Returns:
            DataFrame con variables de alto ICC
        """
        df_resultados = pd.DataFrame(resultados_icc)
        df_resultados = df_resultados.sort_values('correlacion', ascending=False)
        
        # Filtrar solo correlaciones > threshold
        df_alto_icc = df_resultados[df_resultados['correlacion'] > threshold].copy()
        
        return df_alto_icc
    
    def get_statistics(self, resultados_icc: List[Dict], df_alto_icc: pd.DataFrame) -> Dict:
        """
        Calcula estadísticas generales del análisis
        
        Args:
            resultados_icc: Lista de resultados ICC
            df_alto_icc: DataFrame con variables de alto ICC
            
        Returns:
            Diccionario con estadísticas
        """
        df_resultados = pd.DataFrame(resultados_icc)
        correlaciones_validas = df_resultados['correlacion'].dropna()
        variables_alto_icc = len(df_alto_icc)
        porcentaje_alto_icc = (variables_alto_icc / len(correlaciones_validas)) * 100 if len(correlaciones_validas) > 0 else 0
        
        # Calcular estadísticas de variables de alto ICC
        correlacion_promedio_alto_icc = df_alto_icc['correlacion'].mean() if len(df_alto_icc) > 0 else 0.0
        correlacion_minima_alto_icc = df_alto_icc['correlacion'].min() if len(df_alto_icc) > 0 else 0.0
        correlacion_maxima_alto_icc = df_alto_icc['correlacion'].max() if len(df_alto_icc) > 0 else 0.0
        
        return {
            'total_variables': len(df_resultados),
            'variables_validas': len(correlaciones_validas),
            'variables_alto_icc': variables_alto_icc,
            'porcentaje_alto_icc': porcentaje_alto_icc,
            'correlacion_promedio': correlaciones_validas.mean(),
            'correlacion_promedio_alto_icc': correlacion_promedio_alto_icc,
            'correlacion_minima_alto_icc': correlacion_minima_alto_icc,
            'correlacion_maxima_alto_icc': correlacion_maxima_alto_icc,
            'correlacion_mediana': correlaciones_validas.median(),
            'correlacion_minima': correlaciones_validas.min(),
            'correlacion_maxima': correlaciones_validas.max()
        } 