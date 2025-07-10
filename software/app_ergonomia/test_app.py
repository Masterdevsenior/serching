#!/usr/bin/env python3
"""
Script de prueba para verificar funcionalidades de la aplicación de ergonomía
"""

import sys
import os
sys.path.append('.')

def test_imports():
    """Probar que todos los módulos se importan correctamente"""
    print("🔍 Probando imports...")
    
    try:
        from app.main import st
        print("✅ Streamlit importado correctamente")
    except Exception as e:
        print(f"❌ Error importando Streamlit: {e}")
    
    try:
        from app.api_handler import enviar_a_api
        print("✅ API handler importado correctamente")
    except Exception as e:
        print(f"❌ Error importando API handler: {e}")
    
    try:
        from app.visualizer import show_hrv_graphs, show_joint_angles
        print("✅ Visualizer importado correctamente")
    except Exception as e:
        print(f"❌ Error importando visualizer: {e}")
    
    try:
        from app.pdf_exporter import generar_pdf
        print("✅ PDF exporter importado correctamente")
    except Exception as e:
        print(f"❌ Error importando PDF exporter: {e}")
    
    try:
        from app.db import guardar_resultado
        print("✅ Database importado correctamente")
    except Exception as e:
        print(f"❌ Error importando database: {e}")
    
    try:
        from utils.gemini_client import obtener_respuesta_ia
        print("✅ Gemini client importado correctamente")
    except Exception as e:
        print(f"❌ Error importando Gemini client: {e}")
    
    try:
        from utils.processor import procesar_archivos_tiempo
        print("✅ Processor importado correctamente")
    except Exception as e:
        print(f"❌ Error importando processor: {e}")

def test_api_handler():
    """Probar el manejador de API"""
    print("\n🔍 Probando API handler...")
    
    from app.api_handler import enviar_a_api
    
    # Datos de prueba
    datos_prueba = {
        "resumen_fisiologico": {
            "frecuencia_cardiaca_prom": 85.5,
            "HRV_rmssd": 45.2
        },
        "resumen_biomecanico": {
            "KneeFlexExtR.angle": 65.4,
            "HipFlexExtR.angle": 45.8
        }
    }
    
    try:
        respuesta = enviar_a_api(datos_prueba)
        if "resumen" in respuesta:
            print("✅ API handler funciona correctamente")
            return True
        else:
            print("❌ API handler no devolvió respuesta esperada")
            return False
    except Exception as e:
        print(f"❌ Error en API handler: {e}")
        return False

def test_gemini_client():
    """Probar el cliente de Gemini"""
    print("\n🔍 Probando Gemini client...")
    
    from utils.gemini_client import obtener_respuesta_ia
    
    try:
        respuesta = obtener_respuesta_ia("Hola, esto es una prueba")
        if respuesta and len(respuesta) > 0:
            print("✅ Gemini client funciona correctamente")
            return True
        else:
            print("❌ Gemini client no devolvió respuesta")
            return False
    except Exception as e:
        print(f"❌ Error en Gemini client: {e}")
        return False

def test_pdf_generation():
    """Probar la generación de PDF"""
    print("\n🔍 Probando generación de PDF...")
    
    from app.pdf_exporter import generar_pdf
    
    try:
        fisio = {"frecuencia_cardiaca_prom": 85.5, "HRV_rmssd": 45.2}
        bio = {"KneeFlexExtR.angle": 65.4, "HipFlexExtR.angle": 45.8}
        
        generar_pdf(fisio, bio)
        
        if os.path.exists("reporte_ergonomia.pdf"):
            print("✅ PDF generado correctamente")
            return True
        else:
            print("❌ PDF no se generó")
            return False
    except Exception as e:
        print(f"❌ Error generando PDF: {e}")
        return False

def test_database():
    """Probar la base de datos"""
    print("\n🔍 Probando base de datos...")
    
    from app.db import guardar_resultado
    
    try:
        datos_prueba = {
            "resumen_fisiologico": {"test": "data"},
            "resumen_biomecanico": {"test": "data"}
        }
        
        guardar_resultado("TEST_SUBJECT", "TEST_SIM", datos_prueba)
        print("✅ Base de datos funciona correctamente")
        return True
    except Exception as e:
        print(f"❌ Error en base de datos: {e}")
        return False

def main():
    """Función principal de pruebas"""
    print("🚀 Iniciando pruebas de la aplicación de ergonomía...\n")
    
    # Ejecutar todas las pruebas
    test_imports()
    api_ok = test_api_handler()
    gemini_ok = test_gemini_client()
    pdf_ok = test_pdf_generation()
    db_ok = test_database()
    
    # Resumen
    print("\n" + "="*50)
    print("📊 RESUMEN DE PRUEBAS")
    print("="*50)
    
    tests = [
        ("API Handler", api_ok),
        ("Gemini Client", gemini_ok),
        ("PDF Generation", pdf_ok),
        ("Database", db_ok)
    ]
    
    passed = 0
    for test_name, result in tests:
        status = "✅ PASÓ" if result else "❌ FALLÓ"
        print(f"{test_name}: {status}")
        if result:
            passed += 1
    
    print(f"\n🎯 Resultado: {passed}/{len(tests)} pruebas pasaron")
    
    if passed == len(tests):
        print("🎉 ¡Todas las funcionalidades están funcionando correctamente!")
        print("\n💡 Para ejecutar la aplicación:")
        print("   streamlit run app/main.py")
    else:
        print("⚠️  Algunas funcionalidades necesitan atención")

if __name__ == "__main__":
    main() 