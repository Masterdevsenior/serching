#!/usr/bin/env python3
"""
Script de configuración para la aplicación de Análisis ICC
"""

import subprocess
import sys
import os

def install_requirements():
    """Instala las dependencias del proyecto"""
    print("📦 Instalando dependencias...")
    try:
        subprocess.check_call([sys.executable, "-m", "pip", "install", "-r", "requirements.txt"])
        print("✅ Dependencias instaladas exitosamente")
        return True
    except subprocess.CalledProcessError as e:
        print(f"❌ Error al instalar dependencias: {e}")
        return False

def generate_sample_data():
    """Genera datos de ejemplo"""
    print("🎯 Generando datos de ejemplo...")
    try:
        from utils.generate_sample_data import generate_sample_data, generate_high_icc_data
        
        # Crear directorio de datos si no existe
        os.makedirs("data", exist_ok=True)
        
        # Generar datos
        generate_sample_data("ProcessedMocap.csv", num_subjects=12, num_variables=25)
        generate_high_icc_data("ProcessedMocap_HighICC.csv")
        
        print("✅ Datos de ejemplo generados exitosamente")
        return True
    except Exception as e:
        print(f"❌ Error al generar datos: {e}")
        return False

def check_streamlit():
    """Verifica que Streamlit esté disponible"""
    try:
        import streamlit
        print("✅ Streamlit está disponible")
        return True
    except ImportError:
        print("❌ Streamlit no está disponible")
        return False

def main():
    """Función principal del setup"""
    print("🚀 Configuración de la Aplicación de Análisis ICC")
    print("=" * 50)
    
    # Paso 1: Instalar dependencias
    if not install_requirements():
        print("❌ Falló la instalación de dependencias")
        return False
    
    # Paso 2: Verificar Streamlit
    if not check_streamlit():
        print("❌ Streamlit no está disponible después de la instalación")
        return False
    
    # Paso 3: Generar datos de ejemplo
    if not generate_sample_data():
        print("⚠️ No se pudieron generar datos de ejemplo, pero la aplicación puede funcionar")
    
    print("\n" + "=" * 50)
    print("✅ Configuración completada exitosamente!")
    print("\n🎯 Para ejecutar la aplicación:")
    print("   streamlit run app.py")
    print("\n📁 Archivos generados:")
    print("   - ProcessedMocap.csv (datos normales)")
    print("   - ProcessedMocap_HighICC.csv (datos con alta ICC)")
    print("\n🌐 La aplicación se abrirá en: http://localhost:8501")
    
    return True

if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1) 