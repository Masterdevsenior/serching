import logging
import os

# Crear carpeta de logs si no existe
os.makedirs('logs', exist_ok=True)

# Configuración básica de logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [%(levelname)s] %(message)s',
    handlers=[
        logging.FileHandler('logs/app.log', encoding='utf-8'),
        logging.StreamHandler()  # Quita esta línea si no quieres logs en consola
    ]
)

logger = logging.getLogger('app_logger') 