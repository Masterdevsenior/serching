"""
Script para procesar y fusionar archivos CSV de datos biométricos y de captura de movimiento.

Este script está diseñado para procesar archivos CSV organizados por peso del sujeto,
convertirlos a formato XLSX con metadatos adicionales y fusionarlos en archivos CSV
consolidados por tipo de dato.

Funcionalidades principales:
- Conversión de CSV a XLSX
- Adición de metadatos (peso, escena, fecha y hora)
- Fusión de archivos por tipo de dato
- Organización de resultados en estructura de carpetas

Autor: [Tu Nombre]
Fecha: [Fecha]
"""

import os
import re
import pandas as pd
import logging

# Configuración de logging
logging.basicConfig(level=logging.INFO, format="%(levelname)s - %(message)s")

BASE_DIR = os.path.join(os.path.dirname(__file__), "data")

PATRON_PESO = re.compile(r"^\d{3}kg$")
CSV_PATTERN = re.compile(
    r"Scene Capture \((\d+)\)-Avatar-(PpgHrv|ProcessedMocap|ProcessedPpg|RawMocap|RawPpg)-(\d{4}-\d{2}-\d{2}-\d{2}-\d{2}-\d{2})\.csv",
    re.IGNORECASE
)
TIPOS_VALIDOS = ['PpgHrv', 'ProcessedMocap', 'ProcessedPpg', 'RawMocap', 'RawPpg']


def validar_directorios(base_dir):
    """
    Valida y retorna las carpetas de peso válidas en el directorio base.

    Args:
        base_dir (str): Ruta del directorio base a validar.

    Returns:
        list: Lista de rutas de carpetas de peso válidas (formato XXXkg).
    """
    logging.info("🔍 Buscando subcarpetas con estructura válida (XXXkg)...")
    if not os.path.exists(base_dir):
        logging.error(f"❌ No existe el directorio: {base_dir}")
        return []

    return [
        os.path.join(base_dir, d) for d in os.listdir(base_dir)
        if os.path.isdir(os.path.join(base_dir, d)) and PATRON_PESO.match(d)
    ]


def crear_subcarpetas(directorio_peso):
    """
    Crea las subcarpetas necesarias para el procesamiento de datos.

    Args:
        directorio_peso (str): Ruta del directorio de peso.

    Returns:
        tuple: Rutas de las carpetas staging_xls y merged creadas.
    """
    processed_data_dir = os.path.join(directorio_peso, "processed_data")
    staging_dir = os.path.join(processed_data_dir, "staging_xls")
    merged_dir = os.path.join(processed_data_dir, "merged")
    os.makedirs(staging_dir, exist_ok=True)
    os.makedirs(merged_dir, exist_ok=True)
    return staging_dir, merged_dir


def buscar_archivos_csv(peso_path):
    """
    Busca archivos CSV válidos en el directorio de peso especificado.

    Args:
        peso_path (str): Ruta del directorio de peso.

    Returns:
        list: Lista de diccionarios con información de los archivos encontrados.
    """
    archivos = []
    peso = os.path.basename(peso_path)

    for root, _, files in os.walk(peso_path):
        if "Scene Capture" not in root:
            continue

        for file in files:
            match = CSV_PATTERN.match(file)
            if match:
                escena = match.group(1)
                tipo = match.group(2)
                fecha_hora = match.group(3)
                path = os.path.join(root, file)
                archivos.append({
                    "path": path,
                    "escena": escena if escena else "1",
                    "tipo": tipo,
                    "fecha_hora": fecha_hora,
                    "peso": peso
                })
    return archivos


def convertir_csv_a_xlsx_con_columnas(archivo_info, staging_dir):
    """
    Convierte un archivo CSV a XLSX y agrega columnas de metadatos.

    Args:
        archivo_info (dict): Información del archivo a convertir.
        staging_dir (str): Directorio donde se guardará el archivo XLSX.

    Returns:
        tuple: (tipo de archivo, ruta del archivo XLSX generado) o (None, None) si hay error.
    """
    try:
        df = pd.read_csv(archivo_info["path"])

        # Insertar columnas
        df.insert(0, "Peso Cargado", archivo_info["peso"])
        df.insert(0, "# de Escena", archivo_info["escena"])
        df.insert(0, "Fecha y Hora", archivo_info["fecha_hora"])

        # Crear ruta para guardar .xlsx
        nombre_archivo = os.path.basename(archivo_info["path"]).replace(".csv", ".xlsx")
        ruta_salida = os.path.join(staging_dir, nombre_archivo)
        df.to_excel(ruta_salida, index=False, engine='openpyxl')

        logging.info(f"✅ Guardado .xlsx: {ruta_salida}")
        return archivo_info["tipo"], ruta_salida

    except Exception as e:
        logging.error(f"❌ Error procesando {archivo_info['path']}: {e}")
        return None, None


def fusionar_por_tipo(staging_dir, merged_dir):
    """
    Fusiona archivos XLSX por tipo de dato y los guarda como CSV.

    Args:
        staging_dir (str): Directorio con archivos XLSX a fusionar.
        merged_dir (str): Directorio donde se guardarán los CSV fusionados.
    """
    archivos_por_tipo = {tipo: [] for tipo in TIPOS_VALIDOS}

    for archivo in os.listdir(staging_dir):
        if archivo.endswith(".xlsx") and not archivo.startswith("~$"):
            for tipo in TIPOS_VALIDOS:
                if tipo in archivo:
                    archivos_por_tipo[tipo].append(os.path.join(staging_dir, archivo))
                    break
        elif archivo.startswith("~$"):
            logging.warning(f"🧹 Ignorando archivo temporal: {archivo}")

    for tipo, archivos in archivos_por_tipo.items():
        if archivos:
            df_list = []
            for path in archivos:
                try:
                    df = pd.read_excel(path, engine='openpyxl')
                    df_list.append(df)
                except Exception as e:
                    logging.warning(f"⚠️ Error leyendo {path}: {e}")

            if df_list:
                merged_df = pd.concat(df_list, ignore_index=True)
                ruta_merged = os.path.join(merged_dir, f"{tipo}.csv")
                merged_df.to_csv(ruta_merged, index=False, encoding='utf-8-sig')
                logging.info(f"📦 Archivo combinado generado: {ruta_merged}")
        else:
            logging.warning(f"⚠️ No hay archivos para fusionar en tipo: {tipo}")


def procesar_directorio_peso(peso_path):
    """
    Procesa todos los archivos CSV en un directorio de peso específico.

    Args:
        peso_path (str): Ruta del directorio de peso a procesar.
    """
    logging.info(f"\n📦 Procesando carpeta: {peso_path}")
    staging_dir, merged_dir = crear_subcarpetas(peso_path)
    archivos = buscar_archivos_csv(peso_path)

    logging.info(f"📄 Total de archivos CSV válidos en {peso_path}: {len(archivos)}")

    for info in archivos:
        convertir_csv_a_xlsx_con_columnas(info, staging_dir)

    fusionar_por_tipo(staging_dir, merged_dir)


def main():
    """
    Función principal que ejecuta el procesamiento de todos los directorios de peso.
    """
    logging.info(f"📁 Directorio base: {BASE_DIR}")
    directorios = validar_directorios(BASE_DIR)

    for carpeta in directorios:
        procesar_directorio_peso(carpeta)

    logging.info("🎉 Proceso finalizado.")


if __name__ == "__main__":
    main()
