import logging
import sys
from typing import Optional

def setup_logging(level: str = "INFO", log_file: Optional[str] = None) -> None:
    """
    Configura el sistema de logging para la aplicación
    
    Args:
        level: Nivel de logging ('DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL')
        log_file: Archivo opcional para guardar logs
    """
    
    # Configurar formato del log
    log_format = '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
    date_format = '%Y-%m-%d %H:%M:%S'
    
    # Configurar el logger raíz
    logging.basicConfig(
        level=getattr(logging, level.upper()),
        format=log_format,
        datefmt=date_format,
        handlers=[
            logging.StreamHandler(sys.stdout)
        ]
    )
    
    # Agregar archivo de log si se especifica
    if log_file:
        file_handler = logging.FileHandler(log_file, encoding='utf-8')
        file_handler.setFormatter(logging.Formatter(log_format, date_format))
        logging.getLogger().addHandler(file_handler)
    
    # Configurar logger específico para la aplicación
    app_logger = logging.getLogger('icc_app')
    app_logger.setLevel(getattr(logging, level.upper()))
    
    # Evitar duplicación de logs
    app_logger.propagate = False
    
    # Agregar handlers al logger de la aplicación
    console_handler = logging.StreamHandler(sys.stdout)
    console_handler.setFormatter(logging.Formatter(log_format, date_format))
    app_logger.addHandler(console_handler)
    
    if log_file:
        file_handler = logging.FileHandler(log_file, encoding='utf-8')
        file_handler.setFormatter(logging.Formatter(log_format, date_format))
        app_logger.addHandler(file_handler)

def get_logger(name: str) -> logging.Logger:
    """
    Obtiene un logger configurado para un módulo específico
    
    Args:
        name: Nombre del módulo (ej: 'data_layer.data_loader')
        
    Returns:
        Logger configurado
    """
    return logging.getLogger(name) 