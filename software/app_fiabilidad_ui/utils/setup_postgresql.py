#!/usr/bin/env python3
"""
Script para configurar y probar la conexión a PostgreSQL
"""

import os
import sys
from config.database_config import DatabaseConfig
from data_layer.postgresql_descriptions import PostgreSQLVariableDescriptions
from dotenv import load_dotenv
load_dotenv()

def setup_postgresql_connection():
    """Configura y prueba la conexión a PostgreSQL"""
    
    print("🔗 Configuración de Conexión a PostgreSQL")
    print("=" * 50)
    
    # Crear archivo .env si no existe
    DatabaseConfig.create_env_file()
    
    # Validar configuración
    if not DatabaseConfig.validate_config():
        print("\n❌ Configuración incompleta")
        print("💡 Actualiza el archivo .env con tus credenciales")
        return False
    
    # Obtener configuración
    config = DatabaseConfig.get_postgresql_config()
    print(f"📊 Configuración actual:")
    print(f"   Host: {config['host']}")
    print(f"   Puerto: {config['port']}")
    print(f"   Base de datos: {config['database']}")
    print(f"   Usuario: {config['user']}")
    print(f"   Contraseña: {'*' * len(config['password']) if config['password'] else 'No configurada'}")
    
    # Probar conexión
    print("\n🔍 Probando conexión...")
    try:
        pg_descriptions = PostgreSQLVariableDescriptions(
            host=config['host'],
            port=config['port'],
            database=config['database'],
            user=config['user'],
            password=config['password']
        )
        
        if pg_descriptions.test_connection():
            print("✅ Conexión exitosa a PostgreSQL")
            
            # Probar carga de descripciones
            print("\n📝 Probando carga de descripciones...")
            if pg_descriptions.load_descriptions():
                print(f"✅ Descripciones cargadas: {len(pg_descriptions.descriptions_cache)} variables")
                
                # Mostrar algunas descripciones de ejemplo
                print("\n📋 Ejemplos de descripciones:")
                count = 0
                for var, desc in pg_descriptions.descriptions_cache.items():
                    if count < 5:  # Mostrar solo las primeras 5
                        print(f"   {var}: {desc[:80]}...")
                        count += 1
                    else:
                        break
                
                # Obtener información de tablas
                table_info = pg_descriptions.get_table_info()
                print(f"\n📊 Tablas disponibles: {len(table_info)}")
                for table, description in table_info.items():
                    print(f"   {table}: {description}")
                
                return True
            else:
                print("❌ No se pudieron cargar las descripciones")
                return False
        else:
            print("❌ No se pudo conectar a PostgreSQL")
            print("💡 Verifica:")
            print("   - Que PostgreSQL esté ejecutándose")
            print("   - Que las credenciales sean correctas")
            print("   - Que la base de datos exista")
            return False
            
    except Exception as e:
        print(f"❌ Error de conexión: {e}")
        return False

def create_env_template():
    """Crea un template de archivo .env con la configuración proporcionada"""
    
    template_content = """# Configuración de la Base de Datos PostgreSQL
DB_HOST=localhost
DB_PORT=5432
DB_NAME=bd_tesla_suit
DB_USER=postgres
DB_PASSWORD=1126254560

# Configuración de la aplicación
LOG_LEVEL=INFO
"""
    
    with open('.env', 'w') as f:
        f.write(template_content)
    
    print("✅ Archivo .env creado con la configuración proporcionada")
    print("💡 Asegúrate de que la contraseña sea correcta")

def main():
    """Función principal"""
    
    print("🚀 Configurador de Conexión PostgreSQL para Análisis ICC")
    print("=" * 60)
    
    # Verificar argumentos
    if len(sys.argv) > 1 and sys.argv[1] == "--create-env":
        create_env_template()
        return
    
    # Configurar y probar conexión
    success = setup_postgresql_connection()
    
    if success:
        print("\n" + "=" * 60)
        print("✅ Configuración completada exitosamente!")
        print("🎯 Ahora puedes ejecutar: streamlit run app.py")
        print("💡 Selecciona 'Base de datos PostgreSQL' en la interfaz")
    else:
        print("\n" + "=" * 60)
        print("❌ Configuración fallida")
        print("💡 Revisa la configuración y vuelve a intentar")

if __name__ == "__main__":
    main() 