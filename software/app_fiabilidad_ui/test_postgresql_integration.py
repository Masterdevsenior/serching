#!/usr/bin/env python3
"""
Script para probar la integración completa con PostgreSQL
"""

import os
import sys
import pandas as pd
from application_layer.icc_service import ICCService
from data_layer.postgresql_descriptions import PostgreSQLVariableDescriptions
from config.database_config import DatabaseConfig
from dotenv import load_dotenv
load_dotenv()

def test_postgresql_integration():
    """Prueba la integración completa con PostgreSQL"""
    
    print("🧪 Prueba de Integración PostgreSQL")
    print("=" * 50)
    
    # 1. Verificar configuración
    print("1. Verificando configuración...")
    if not DatabaseConfig.validate_config():
        print("❌ Configuración inválida")
        return False
    
    config = DatabaseConfig.get_postgresql_config()
    print(f"✅ Configuración válida: {config['database']} en {config['host']}:{config['port']}")
    
    # 2. Probar conexión directa
    print("\n2. Probando conexión directa...")
    pg_descriptions = PostgreSQLVariableDescriptions()
    
    if not pg_descriptions.test_connection():
        print("❌ No se pudo conectar a PostgreSQL")
        return False
    
    print("✅ Conexión exitosa")
    
    # 3. Probar carga de descripciones
    print("\n3. Probando carga de descripciones...")
    if not pg_descriptions.load_descriptions():
        print("❌ No se pudieron cargar descripciones")
        return False
    
    print(f"✅ Descripciones cargadas: {len(pg_descriptions.descriptions_cache)} variables")
    
    # 4. Mostrar ejemplos de descripciones
    print("\n4. Ejemplos de descripciones:")
    count = 0
    for var, desc in pg_descriptions.descriptions_cache.items():
        if count < 3:
            print(f"   {var}: {desc[:100]}...")
            count += 1
        else:
            break
    
    # 5. Probar servicio completo
    print("\n5. Probando servicio ICC con PostgreSQL...")
    service = ICCService()
    
    # Crear datos de prueba
    test_data = pd.DataFrame({
        'Sujeto': [1, 1, 2, 2, 3, 3],
        'Sesion': [1, 1, 1, 1, 1, 1],
        'Tiempo': [1, 2, 1, 2, 1, 2],
        'root.position.x': [0.1, 0.12, 0.15, 0.14, 0.13, 0.11],
        'root.position.y': [1.2, 1.25, 1.3, 1.28, 1.27, 1.24],
        'root.position.z': [0.5, 0.52, 0.55, 0.54, 0.53, 0.51]
    })
    
    # Guardar datos de prueba
    test_file = "test_data.csv"
    test_data.to_csv(test_file, index=False)
    
    try:
        # Ejecutar análisis con PostgreSQL
        result = service.run_icc_analysis(
            file_path=test_file,
            threshold=0.8,
            descriptions_path="postgresql"
        )
        
        if result['success']:
            print("✅ Análisis ICC exitoso con PostgreSQL")
            print(f"   Variables analizadas: {result['data_info']['columnas_numericas']}")
            print(f"   Variables de alto ICC: {len(result['results']['variables_alto_icc'])}")
            print(f"   Descripciones cargadas: {result['descriptions_loaded']}")
            
            # Mostrar descripciones de variables de alto ICC
            if result['results']['variables_alto_icc']:
                print("\n   Variables de alto ICC con descripciones:")
                for var in result['results']['variables_alto_icc']:
                    var_name = var['Variable']
                    desc = service.get_variable_descriptions([var_name]).get(var_name, var_name)
                    print(f"     {var_name}: {desc[:80]}...")
        else:
            print("❌ Análisis ICC falló")
            return False
            
    except Exception as e:
        print(f"❌ Error en análisis ICC: {e}")
        return False
    finally:
        # Limpiar archivo de prueba
        if os.path.exists(test_file):
            os.remove(test_file)
    
    return True

def main():
    """Función principal"""
    
    print("🚀 Prueba de Integración PostgreSQL para Análisis ICC")
    print("=" * 60)
    
    success = test_postgresql_integration()
    
    if success:
        print("\n" + "=" * 60)
        print("✅ Integración PostgreSQL exitosa!")
        print("🎯 La aplicación está lista para usar con PostgreSQL")
        print("💡 Ejecuta: streamlit run app.py")
    else:
        print("\n" + "=" * 60)
        print("❌ Integración fallida")
        print("💡 Revisa la configuración y vuelve a intentar")

if __name__ == "__main__":
    main() 