"""
Archivo de configuración para el Procesador de Datos Biométricos.
Aquí puedes personalizar las rutas y configuraciones del sistema.
"""

import os

# =============================================================================
# CONFIGURACIÓN DE RUTAS DE DATOS
# =============================================================================

# Ruta de la carpeta de datos
# Cambia esto a tu ruta deseada usando el script setup_data_path.py
DATA_DIRECTORY = "../data"  # Carpeta data al mismo nivel que app_convertion_ui

# =============================================================================
# CONFIGURACIÓN DE PROCESAMIENTO
# =============================================================================

# Tipos de archivos válidos para procesamiento
VALID_FILE_TYPES = ['PpgHrv', 'ProcessedMocap', 'ProcessedPpg', 'RawMocap', 'RawPpg']

# =============================================================================
# CONFIGURACIÓN DE SALIDA
# =============================================================================

# Formato de salida por defecto (xlsx o csv)
DEFAULT_OUTPUT_FORMAT = 'xlsx'

# Incluir metadatos en archivos de salida
INCLUDE_METADATA = True

# =============================================================================
# FUNCIONES DE CONFIGURACIÓN
# =============================================================================

def get_data_directory():
    """
    Obtiene la ruta del directorio de datos según la configuración.
    Prioridad:
    1. Configuración en DATA_DIRECTORY
    2. Ubicación por defecto (carpeta data del proyecto)
    """
    # Verifica la configuración del archivo
    if DATA_DIRECTORY:
        # Si es una ruta relativa, convertirla a absoluta
        if not os.path.isabs(DATA_DIRECTORY):
            # Obtener la ruta del directorio actual del proyecto
            project_dir = os.path.dirname(os.path.abspath(__file__))
            absolute_path = os.path.join(project_dir, DATA_DIRECTORY)
            if os.path.exists(absolute_path):
                return absolute_path
        else:
            # Es una ruta absoluta
            if os.path.exists(DATA_DIRECTORY):
                return DATA_DIRECTORY
    
    # Si no se encuentra ninguna configuración, usar la ubicación por defecto
    return os.path.join(os.path.dirname(__file__), "data")

def validate_data_directory():
    """
    Valida que el directorio de datos existe y tiene la estructura correcta.
    """
    data_dir = get_data_directory()
    
    if not os.path.exists(data_dir):
        raise FileNotFoundError(f"El directorio de datos no existe: {data_dir}")
    
    if not os.path.isdir(data_dir):
        raise NotADirectoryError(f"La ruta especificada no es un directorio: {data_dir}")
    
    return data_dir 