import os
import re
from collections import defaultdict

# Detecta sujetos y ejercicios a partir de la estructura de carpetas y nombres de archivos

def listar_sujetos_y_ejercicios(ruta_base="../data"):
    """
    Devuelve un diccionario {sujeto: [ejercicios]} detectados en la carpeta de datos.
    """
    sujetos_ejercicios = defaultdict(set)
    if not os.path.isdir(ruta_base):
        return {}
    for nombre_carpeta in os.listdir(ruta_base):
        ruta_carpeta = os.path.join(ruta_base, nombre_carpeta)
        if os.path.isdir(ruta_carpeta):
            # Buscar patrón: SUB1, SUB2, etc. y T1, T2, etc. en el nombre de la carpeta
            match_suj = re.search(r"SUB\d+", nombre_carpeta, re.IGNORECASE)
            match_ej = re.search(r"T\d+", nombre_carpeta, re.IGNORECASE)
            if match_suj and match_ej:
                sujeto = match_suj.group(0).upper()
                ejercicio = match_ej.group(0).upper()
                sujetos_ejercicios[sujeto].add(ejercicio)
    # Convertir sets a listas ordenadas
    return {s: sorted(list(ejs)) for s, ejs in sujetos_ejercicios.items()}


def cargar_archivos_sujeto_ejercicio(ruta_base="../data", sujeto=None, ejercicio=None):
    """
    Devuelve una lista de diccionarios con los paths de los 3 archivos CSV para cada simulación del sujeto y ejercicio seleccionados.
    [
      { 'carpeta': ..., 'PpgHrv': ..., 'ProcessedPpg': ..., 'ProcessedMocap': ... },
      ...
    ]
    """
    simulaciones = []
    if not os.path.isdir(ruta_base) or not sujeto or not ejercicio:
        return []
    for nombre_carpeta in os.listdir(ruta_base):
        ruta_carpeta = os.path.join(ruta_base, nombre_carpeta)
        if os.path.isdir(ruta_carpeta):
            if sujeto in nombre_carpeta and ejercicio in nombre_carpeta:
                archivos = os.listdir(ruta_carpeta)
                sim = {'carpeta': ruta_carpeta}
                # Buscar los 3 archivos requeridos (palabra clave en cualquier parte del nombre)
                for archivo in archivos:
                    nombre_archivo = archivo.lower()
                    if 'ppghrv' in nombre_archivo and nombre_archivo.endswith('.csv'):
                        sim['PpgHrv'] = os.path.join(ruta_carpeta, archivo)
                    elif 'processedppg' in nombre_archivo and nombre_archivo.endswith('.csv'):
                        sim['ProcessedPpg'] = os.path.join(ruta_carpeta, archivo)
                    elif 'processedmocap' in nombre_archivo and nombre_archivo.endswith('.csv'):
                        sim['ProcessedMocap'] = os.path.join(ruta_carpeta, archivo)
                # Solo agregar si tiene los 3 archivos
                if all(k in sim for k in ['PpgHrv', 'ProcessedPpg', 'ProcessedMocap']):
                    simulaciones.append(sim)
    return simulaciones 