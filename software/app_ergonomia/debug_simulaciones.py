import os
import re

def debug_simulaciones_sub5_t1(ruta_base="data"):
    print(f"=== DEBUG: Explorando ruta: {ruta_base} ===\n")
    if not os.path.isdir(ruta_base):
        print(f"❌ La ruta {ruta_base} no existe o no es un directorio")
        return
    
    carpetas = [c for c in os.listdir(ruta_base) if os.path.isdir(os.path.join(ruta_base, c))]
    print(f"Total carpetas encontradas: {len(carpetas)}")
    print("\nLista de carpetas:")
    for c in carpetas:
        print(f"  - {c}")
    
    sub5 = [c for c in carpetas if "SUB5" in c.upper()]
    t1 = [c for c in carpetas if "T1" in c.upper()]
    ambos = [c for c in carpetas if ("SUB5" in c.upper() and "T1" in c.upper())]
    
    print(f"\nCarpetas que contienen 'SUB5': {len(sub5)}")
    for c in sub5:
        print(f"  - {c}")
    print(f"\nCarpetas que contienen 'T1': {len(t1)}")
    for c in t1:
        print(f"  - {c}")
    print(f"\nCarpetas que contienen AMBOS ('SUB5' y 'T1'): {len(ambos)}")
    for c in ambos:
        print(f"  - {c}")
    
    completas = 0
    print("\nAnalizando archivos requeridos en carpetas con ambos criterios:")
    for nombre_carpeta in ambos:
        ruta_carpeta = os.path.join(ruta_base, nombre_carpeta)
        archivos = os.listdir(ruta_carpeta)
        sim = {'carpeta': ruta_carpeta}
        for archivo in archivos:
            nombre_archivo = archivo.lower()
            if 'ppghrv' in nombre_archivo and nombre_archivo.endswith('.csv'):
                sim['PpgHrv'] = os.path.join(ruta_carpeta, archivo)
            elif 'processedppg' in nombre_archivo and nombre_archivo.endswith('.csv'):
                sim['ProcessedPpg'] = os.path.join(ruta_carpeta, archivo)
            elif 'processedmocap' in nombre_archivo and nombre_archivo.endswith('.csv'):
                sim['ProcessedMocap'] = os.path.join(ruta_carpeta, archivo)
        archivos_requeridos = ['PpgHrv', 'ProcessedPpg', 'ProcessedMocap']
        archivos_encontrados = [k for k in archivos_requeridos if k in sim]
        print(f"\n📁 {nombre_carpeta}")
        print(f"   Archivos requeridos encontrados: {len(archivos_encontrados)}/3 -> {archivos_encontrados}")
        if all(k in sim for k in archivos_requeridos):
            print(f"   ✅ SIMULACIÓN COMPLETA")
            completas += 1
        else:
            print(f"   ❌ SIMULACIÓN INCOMPLETA")
    print(f"\nResumen: {completas} simulaciones COMPLETAS de {len(ambos)} carpetas SUB5/T1 encontradas.\n")

if __name__ == "__main__":
    debug_simulaciones_sub5_t1("../data") 