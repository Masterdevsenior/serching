# app/csv_loader.py
import pandas as pd
import os
import re

def cargar_csv(path_csv):
    try:
        df = pd.read_csv(path_csv)
        return df
    except Exception as e:
        print(f"Error al cargar {path_csv}: {e}")
        return None

def extraer_metadatos(nombre_archivo):
    # Ejemplo nombre: SUB01_T1_CC1.csv
    pattern = r"(SUB\d+)_T(\d+)_CC(\d+)"
    match = re.search(pattern, nombre_archivo)
    if match:
        return {
            "sujeto": match.group(1),
            "tiempo": f"T{match.group(2)}",
            "condicion": f"CC{match.group(3)}"
        }
    return {
        "sujeto": "NA",
        "tiempo": "NA",
        "condicion": "NA"
    }
