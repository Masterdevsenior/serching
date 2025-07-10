#!/usr/bin/env python3
"""
Script interactivo para configurar la ruta de datos del Procesador de Datos Biométricos.
"""

import os
import sys
from pathlib import Path

def mostrar_menu():
    """Muestra el menú principal de configuración"""
    print("=" * 60)
    print("CONFIGURADOR DE RUTA DE DATOS")
    print("=" * 60)
    print("1. Configurar ruta absoluta")
    print("2. Configurar ruta relativa")
    print("3. Restaurar configuración por defecto")
    print("4. Ver configuración actual")
    print("5. Probar configuración")
    print("6. Salir")
    print("=" * 60)

def leer_ruta_absoluta():
    """Lee una ruta absoluta del usuario"""
    while True:
        ruta = input("Ingresa la ruta absoluta de tu carpeta /data: ").strip()
        
        if not ruta:
            print("❌ La ruta no puede estar vacía.")
            continue
            
        # Normalizar la ruta
        ruta = os.path.normpath(ruta)
        
        if not os.path.isabs(ruta):
            print("❌ Debes ingresar una ruta absoluta (ej: C:/Users/TuUsuario/Datos/data)")
            continue
            
        if not os.path.exists(ruta):
            print(f"❌ La ruta no existe: {ruta}")
            continuar = input("¿Deseas continuar de todas formas? (s/n): ").lower()
            if continuar != 's':
                continue
        
        return ruta

def leer_ruta_relativa():
    """Lee una ruta relativa del usuario"""
    while True:
        ruta = input("Ingresa la ruta relativa desde el proyecto (ej: ../datos_externos/data): ").strip()
        
        if not ruta:
            print("❌ La ruta no puede estar vacía.")
            continue
            
        # Normalizar la ruta
        ruta = os.path.normpath(ruta)
        
        # Verificar que no sea absoluta
        if os.path.isabs(ruta):
            print("❌ Debes ingresar una ruta relativa, no absoluta.")
            continue
        
        return ruta

def actualizar_config(ruta=None):
    """Actualiza el archivo config.py"""
    config_path = "config.py"
    
    if not os.path.exists(config_path):
        print("❌ No se encontró el archivo config.py")
        return False
    
    # Leer el archivo actual
    with open(config_path, 'r', encoding='utf-8') as f:
        contenido = f.read()
    
    # Actualizar la línea DATA_DIRECTORY
    if ruta:
        # Escapar comillas si es necesario
        ruta_escaped = ruta.replace('\\', '\\\\').replace('"', '\\"')
        nueva_linea = f'DATA_DIRECTORY = "{ruta_escaped}"  # Ruta configurada por el usuario'
    else:
        nueva_linea = "DATA_DIRECTORY = None  # Ubicación por defecto (carpeta data del proyecto)"
    
    # Reemplazar la línea DATA_DIRECTORY
    import re
    contenido = re.sub(
        r'DATA_DIRECTORY = .*  # .*',
        nueva_linea,
        contenido
    )
    
    # Guardar el archivo
    with open(config_path, 'w', encoding='utf-8') as f:
        f.write(contenido)
    
    return True

def mostrar_configuracion_actual():
    """Muestra la configuración actual"""
    print("\n📋 CONFIGURACIÓN ACTUAL:")
    print("-" * 40)
    
    # Leer config.py
    config_path = "config.py"
    if os.path.exists(config_path):
        with open(config_path, 'r', encoding='utf-8') as f:
            contenido = f.read()
        
        # Buscar la línea DATA_DIRECTORY
        import re
        match = re.search(r'DATA_DIRECTORY = (.+)  # (.+)', contenido)
        if match:
            valor = match.group(1).strip('"')
            comentario = match.group(2)
            print(f"Ruta configurada: {valor}")
            print(f"Descripción: {comentario}")
        else:
            print("No se pudo leer la configuración actual.")
    
    # Probar la configuración
    try:
        import config
        data_dir = config.get_data_directory()
        print(f"Directorio de datos actual: {data_dir}")
        
        if os.path.exists(data_dir):
            print("✅ El directorio existe")
            archivos = len([f for f in os.listdir(data_dir) if os.path.isdir(os.path.join(data_dir, f))])
            print(f"📁 Contiene {archivos} subdirectorios")
        else:
            print("❌ El directorio no existe")
    except Exception as e:
        print(f"❌ Error al probar configuración: {e}")

def probar_configuracion():
    """Prueba la configuración actual"""
    print("\n🧪 PROBANDO CONFIGURACIÓN:")
    print("-" * 40)
    
    try:
        import config
        data_dir = config.get_data_directory()
        print(f"Directorio configurado: {data_dir}")
        
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
        import re
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

def main():
    """Función principal del script de configuración"""
    while True:
        mostrar_menu()
        
        try:
            opcion = input("\nSelecciona una opción (1-6): ").strip()
            
            if opcion == "1":
                print("\n🔧 CONFIGURAR RUTA ABSOLUTA")
                print("-" * 40)
                ruta = leer_ruta_absoluta()
                if actualizar_config(ruta):
                    print(f"✅ Configuración actualizada: {ruta}")
                else:
                    print("❌ Error al actualizar configuración")
            
            elif opcion == "2":
                print("\n🔧 CONFIGURAR RUTA RELATIVA")
                print("-" * 40)
                ruta = leer_ruta_relativa()
                if actualizar_config(ruta):
                    print(f"✅ Configuración actualizada: {ruta}")
                else:
                    print("❌ Error al actualizar configuración")
            
            elif opcion == "3":
                print("\n🔄 RESTAURAR CONFIGURACIÓN POR DEFECTO")
                print("-" * 40)
                if actualizar_config():
                    print("✅ Configuración restaurada a valores por defecto")
                else:
                    print("❌ Error al restaurar configuración")
            
            elif opcion == "4":
                mostrar_configuracion_actual()
            
            elif opcion == "5":
                if probar_configuracion():
                    print("\n✅ La configuración está funcionando correctamente")
                else:
                    print("\n❌ La configuración tiene problemas")
            
            elif opcion == "6":
                print("\n👋 ¡Hasta luego!")
                break
            
            else:
                print("❌ Opción no válida. Por favor selecciona 1-6.")
            
            input("\nPresiona Enter para continuar...")
            
        except KeyboardInterrupt:
            print("\n\n👋 ¡Hasta luego!")
            break
        except Exception as e:
            print(f"\n❌ Error inesperado: {e}")
            input("Presiona Enter para continuar...")

if __name__ == "__main__":
    main() 