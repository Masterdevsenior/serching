#!/usr/bin/env python3
"""
Script de prueba para verificar la configuración de datos.
"""

import os
import sys
import re

def test_config():
    """Prueba la configuración actual"""
    print("🧪 PROBANDO CONFIGURACIÓN DE DATOS")
    print("=" * 50)
    
    try:
        # Importar config
        import config
        data_dir = config.get_data_directory()
        
        print(f"📁 Directorio configurado: {data_dir}")
        
        # Verificar que existe
        if not os.path.exists(data_dir):
            print("❌ El directorio no existe")
            return False
        
        if not os.path.isdir(data_dir):
            print("❌ La ruta no es un directorio")
            return False
        
        print("✅ El directorio existe y es válido")
        
        # Contar subdirectorios
        subdirs = [d for d in os.listdir(data_dir) 
                  if os.path.isdir(os.path.join(data_dir, d))]
        
        print(f"📂 Contiene {len(subdirs)} subdirectorios")
        
        # Buscar directorios con formato de fecha
        patron_fecha = re.compile(r'^\d{4}-\d{2}-\d{2}[-_]\d{2}-\d{2}-\d{2}$')
        patron_scene = re.compile(r'Scene Capture - (SUB\d+) - (S\d+) - (T\d+) - (CC|SC) - (OK|BAD)', re.IGNORECASE)
        
        dirs_fecha = [d for d in subdirs if patron_fecha.match(d)]
        dirs_scene = [d for d in subdirs if patron_scene.search(d)]
        
        if dirs_fecha:
            print(f"✅ Encontrados {len(dirs_fecha)} directorios con formato de fecha válido")
            print("Primeros 3 directorios con fecha:")
            for i, subdir in enumerate(dirs_fecha[:3]):
                print(f"   {i+1}. {subdir}")
        
        if dirs_scene:
            print(f"✅ Encontrados {len(dirs_scene)} directorios Scene Capture directamente")
            print("Primeros 3 directorios Scene Capture:")
            for i, subdir in enumerate(dirs_scene[:3]):
                print(f"   {i+1}. {subdir}")
        
        if not dirs_fecha and not dirs_scene:
            print("⚠️  No se encontraron directorios con formato válido")
            print("   Formatos esperados:")
            print("   - YYYY-MM-DD-HH-MM-SS (carpetas con fecha)")
            print("   - Scene Capture - SUB1 - S1 - T1 - CC - OK (carpetas Scene Capture)")
        
        return True
        
    except Exception as e:
        print(f"❌ Error al probar configuración: {e}")
        return False

if __name__ == "__main__":
    test_config() 