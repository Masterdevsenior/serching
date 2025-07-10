import os
from typing import Dict, Optional

class DatabaseConfig:
    """Configuración para la base de datos PostgreSQL"""
    
    @staticmethod
    def get_postgresql_config() -> Dict[str, str]:
        """
        Obtiene la configuración de PostgreSQL desde variables de entorno
        
        Returns:
            Diccionario con la configuración de la base de datos
        """
        return {
            'host': os.getenv('DB_HOST', 'localhost'),
            'port': os.getenv('DB_PORT', '5432'),
            'database': os.getenv('DB_NAME', 'bd_tesla_suit'),
            'user': os.getenv('DB_USER', 'postgres'),
            'password': os.getenv('DB_PASSWORD', '')
        }
    
    @staticmethod
    def create_env_file():
        """
        Crea un archivo .env de ejemplo si no existe
        """
        env_file = '.env'
        if not os.path.exists(env_file):
            with open(env_file, 'w') as f:
                f.write("""# Configuración de la Base de Datos PostgreSQL
DB_HOST=localhost
DB_PORT=5432
DB_NAME=bd_tesla_suit
DB_USER=postgres
DB_PASSWORD=tu_contraseña_aqui

# Configuración de la aplicación
LOG_LEVEL=INFO
""")
            print(f"✅ Archivo .env creado: {env_file}")
            print("💡 Actualiza la contraseña en el archivo .env")
        else:
            print(f"📄 Archivo .env ya existe: {env_file}")
    
    @staticmethod
    def validate_config() -> bool:
        """
        Valida que la configuración de la base de datos esté completa
        
        Returns:
            True si la configuración es válida, False en caso contrario
        """
        config = DatabaseConfig.get_postgresql_config()
        
        required_fields = ['host', 'port', 'database', 'user', 'password']
        missing_fields = []
        
        for field in required_fields:
            if not config[field]:
                missing_fields.append(field)
        
        if missing_fields:
            print(f"❌ Campos faltantes en la configuración: {missing_fields}")
            return False
        
        return True 