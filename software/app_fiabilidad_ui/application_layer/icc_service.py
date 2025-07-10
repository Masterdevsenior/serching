import pandas as pd
from typing import Dict, List, Tuple, Optional
import logging
from data_layer.data_loader import DataLoader
from data_layer.variable_descriptions import VariableDescriptions
from data_layer.postgresql_descriptions import PostgreSQLVariableDescriptions
from domain_layer.icc_analyzer import ICCAnalyzer

class ICCService:
    """Capa de aplicación que coordina el análisis ICC"""
    
    def __init__(self):
        self.data_loader = DataLoader()
        self.variable_descriptions = VariableDescriptions()
        self.postgresql_descriptions = PostgreSQLVariableDescriptions()
        self.icc_analyzer = ICCAnalyzer()
        self.logger = logging.getLogger(__name__)
    
    def run_icc_analysis(self, file_path: str, threshold: float = 0.90, descriptions_path: str = None) -> Dict:
        """
        Ejecuta el análisis ICC completo
        
        Args:
            file_path: Ruta del archivo de datos
            threshold: Umbral de ICC para filtrar variables
            
        Returns:
            Diccionario con todos los resultados del análisis
        """
        try:
            # 1. Cargar datos
            self.logger.info("1. Cargando datos...")
            valid_file_path = self.data_loader.find_data_file(file_path)
            if not valid_file_path:
                return {
                    'success': False,
                    'error': 'No se pudo encontrar el archivo de datos'
                }
            
            # 1.1. Cargar descripciones de variables si se proporciona
            if descriptions_path:
                self.logger.info("1.1. Cargando descripciones de variables...")
                if descriptions_path == "postgresql":
                    # Usar PostgreSQL
                    success = self.postgresql_descriptions.load_descriptions()
                    if not success:
                        self.logger.warning("No se pudieron cargar descripciones desde PostgreSQL")
                else:
                    # Usar archivo local
                    self.variable_descriptions.load_descriptions(descriptions_path)
            
            df = self.data_loader.load_data(valid_file_path)
            if df is None:
                return {
                    'success': False,
                    'error': 'Error al cargar el archivo de datos'
                }
            
            # 2. Validar columnas requeridas
            self.logger.info("2. Validando columnas...")
            es_valido, columnas_encontradas, columnas_faltantes = self.data_loader.validate_required_columns(df)
            if not es_valido:
                return {
                    'success': False,
                    'error': f'Columnas faltantes: {columnas_faltantes}'
                }
            
            # 3. Identificar columnas numéricas
            self.logger.info("3. Identificando columnas numéricas...")
            numeric_cols = self.data_loader.get_numeric_columns(df)
            if len(numeric_cols) == 0:
                return {
                    'success': False,
                    'error': 'No se encontraron columnas numéricas válidas'
                }
            
            # 4. Preparar datos para ICC
            self.logger.info("4. Preparando datos para ICC...")
            df_vars = self.icc_analyzer.prepare_data_for_icc(df, numeric_cols)
            
            # 5. Verificar datos válidos
            self.logger.info("5. Verificando datos válidos...")
            df_clean = df_vars.dropna(subset=["subject", "repetition", "score"])
            
            es_valido, subjects, repetitions = self.icc_analyzer.validate_data_completeness(df_clean)
            if not es_valido:
                return {
                    'success': False,
                    'error': f'Datos insuficientes: {subjects} sujetos, {repetitions} repeticiones'
                }
            
            # 6. Calcular promedios
            self.logger.info("6. Calculando promedios...")
            df_avg = self.icc_analyzer.calculate_averages(df_clean)
            
            # 7. Verificar completitud
            self.logger.info("7. Verificando completitud...")
            complete_subjects = self.icc_analyzer.get_complete_subjects(df_avg)
            if len(complete_subjects) < 2:
                return {
                    'success': False,
                    'error': f'Solo {len(complete_subjects)} sujetos tienen ambas repeticiones'
                }
            
            # 8. Calcular ICC
            self.logger.info("8. Calculando ICC...")
            df_final = df_avg[df_avg["subject"].isin(complete_subjects)]
            resultados_icc = self.icc_analyzer.calculate_icc_for_variables(df_final)
            
            # 9. Filtrar variables de alto ICC
            self.logger.info("9. Filtrando variables de alto ICC...")
            df_alto_icc = self.icc_analyzer.filter_high_icc_variables(resultados_icc, threshold)
            
            # 10. Calcular estadísticas
            self.logger.info("10. Calculando estadísticas...")
            estadisticas = self.icc_analyzer.get_statistics(resultados_icc, df_alto_icc)
            
            return {
                'success': True,
                'data_info': {
                    'total_registros': len(df),
                    'total_columnas': len(df.columns),
                    'columnas_numericas': len(numeric_cols),
                    'sujetos_unicos': subjects,
                    'repeticiones_unicas': repetitions,
                    'sujetos_completos': len(complete_subjects)
                },
                'results': {
                    'resultados_icc': resultados_icc,
                    'variables_alto_icc': df_alto_icc.to_dict('records'),
                    'estadisticas': estadisticas
                },
                'file_path': valid_file_path,
                'descriptions_loaded': (
                    len(self.variable_descriptions.descriptions_cache) > 0 or 
                    len(self.postgresql_descriptions.descriptions_cache) > 0
                )
            }
            
        except Exception as e:
            self.logger.error(f"Error en análisis ICC: {e}")
            return {
                'success': False,
                'error': str(e)
            }
    
    def get_variable_descriptions(self, variable_names: List[str]) -> Dict[str, str]:
        """
        Obtiene descripciones enriquecidas para una lista de variables
        
        Args:
            variable_names: Lista de nombres de variables
            
        Returns:
            Diccionario con variable -> descripción
        """
        # Intentar primero PostgreSQL, luego archivos locales
        if len(self.postgresql_descriptions.descriptions_cache) > 0:
            return self.postgresql_descriptions.get_descriptions_for_variables(variable_names)
        else:
            return self.variable_descriptions.get_descriptions_for_variables(variable_names)
    
    def save_results(self, results: Dict, output_prefix: str = "resultados_icc") -> Dict:
        """
        Guarda los resultados en archivos CSV
        
        Args:
            results: Resultados del análisis
            output_prefix: Prefijo para los archivos de salida
            
        Returns:
            Diccionario con las rutas de los archivos guardados
        """
        try:
            if not results['success']:
                return {'success': False, 'error': 'No hay resultados para guardar'}
            
            saved_files = {}
            
            # Guardar resultados completos
            df_completo = pd.DataFrame(results['results']['resultados_icc'])
            filename_completo = f"{output_prefix}_completo.csv"
            df_completo.to_csv(filename_completo, index=False)
            saved_files['completo'] = filename_completo
            
            # Guardar variables de alto ICC
            if len(results['results']['variables_alto_icc']) > 0:
                df_alto = pd.DataFrame(results['results']['variables_alto_icc'])
                filename_alto = f"{output_prefix}_alto_{results.get('threshold', 0.90)}.csv"
                df_alto.to_csv(filename_alto, index=False)
                saved_files['alto_icc'] = filename_alto
            
            return {
                'success': True,
                'files': saved_files
            }
            
        except Exception as e:
            self.logger.error(f"Error al guardar resultados: {e}")
            return {
                'success': False,
                'error': str(e)
            } 