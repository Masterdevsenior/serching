"""
Módulo para encapsular toda la lógica de procesamiento y fusión de datos.
"""

import os
import re
import pandas as pd
import logging
from pathlib import Path
from datetime import datetime
import json

# Configuración de logging
logging.basicConfig(level=logging.INFO, format="%(levelname)s - %(message)s")

# Constantes
PATRON_FECHA_HORA = re.compile(r'^\d{4}-\d{2}-\d{2}[-_]\d{2}-\d{2}-\d{2}$')
SCENE_CAPTURE_PATTERN = re.compile(
    r'Scene Capture - (SUB\d+) - (S\d+) - (T\d+) - (CC|SC) - (OK|BAD)',
    re.IGNORECASE
)
CSV_PATTERN = re.compile(
    r'.*\.csv$',
    re.IGNORECASE
)
TIPOS_VALIDOS = ['PpgHrv', 'ProcessedMocap', 'ProcessedPpg', 'RawMocap', 'RawPpg']

def get_base_dir():
    """Obtiene el directorio base de datos"""
    return os.path.join(os.path.dirname(__file__), "data")

def get_history_file():
    """Obtiene la ruta del archivo de histórico"""
    return os.path.join(os.path.dirname(__file__), "fusion_history.json")

def cargar_historico():
    """Carga el histórico de fusiones desde el archivo JSON"""
    history_file = get_history_file()
    try:
        if os.path.exists(history_file):
            with open(history_file, 'r', encoding='utf-8') as f:
                return json.load(f)
        else:
            return []
    except Exception as e:
        logging.error(f"Error cargando histórico: {e}")
        return []

def guardar_fusion_en_historico(resultados_totales, directorio_base):
    """Guarda la información de una fusión en el histórico"""
    try:
        historico = cargar_historico()
        
        nueva_fusion = {
            "fecha": datetime.now().isoformat(),
            "directorio": directorio_base,
            "resumen": {
                "carpetas_procesadas": len(resultados_totales),
                "total_archivos": sum(r["archivos_procesados"] for r in resultados_totales),
                "total_errores": sum(len(r["errores"]) for r in resultados_totales),
                "tasa_exito": round(((sum(r["archivos_procesados"] for r in resultados_totales) - 
                                    sum(len(r["errores"]) for r in resultados_totales)) / 
                                   max(sum(r["archivos_procesados"] for r in resultados_totales), 1) * 100), 2)
            },
            "detalles_por_carpeta": []
        }
        
        for resultado in resultados_totales:
            carpeta_info = {
                "fecha_hora": resultado["fecha_hora"],
                "archivos_procesados": resultado["archivos_procesados"],
                "total_archivos": resultado["total_archivos"],
                "errores": len(resultado["errores"]),
                "tipos_procesados": {}
            }
            
            for tipo, datos in resultado["resultados_fusion"].items():
                if datos['archivos_procesados'] > 0:
                    carpeta_info["tipos_procesados"][tipo] = {
                        "archivos": datos['archivos_procesados'],
                        "filas": datos['filas_totales']
                    }
            
            nueva_fusion["detalles_por_carpeta"].append(carpeta_info)
        
        historico.append(nueva_fusion)
        
        if len(historico) > 50:
            historico = historico[-50:]
        
        history_file = get_history_file()
        with open(history_file, 'w', encoding='utf-8') as f:
            json.dump(historico, f, indent=2, ensure_ascii=False)
        
        return True
        
    except Exception as e:
        logging.error(f"Error guardando histórico: {e}")
        return False

def find_data_directory(selected_path):
    """
    Busca el directorio 'data' subiendo desde la ruta seleccionada.
    """
    path = Path(selected_path).resolve()
    while path != path.parent:
        data_dir = path / 'data'
        if data_dir.is_dir():
            return str(data_dir)
        path = path.parent
    return None

def validar_directorios(base_dir):
    """
    Valida y retorna las carpetas de fecha-hora válidas.
    """
    logging.info("Buscando subcarpetas con formato de fecha y hora...")
    if not os.path.exists(base_dir):
        logging.error(f"No existe el directorio: {base_dir}")
        return []
    
    return [
        os.path.join(base_dir, d) for d in os.listdir(base_dir)
        if os.path.isdir(os.path.join(base_dir, d)) and PATRON_FECHA_HORA.match(d)
    ]

def buscar_archivos_csv(fecha_hora_path):
    """
    Busca archivos CSV válidos en las subcarpetas de un directorio de fecha-hora.
    """
    archivos = []
    
    for root, _, files in os.walk(fecha_hora_path):
        match_scene = SCENE_CAPTURE_PATTERN.search(os.path.basename(root))
        if match_scene:
            sujeto, sesion, tiempo, tipo_captura, resultado = match_scene.groups()
            
            for file in files:
                if CSV_PATTERN.match(file):
                    tipo_dato = detectar_tipo_archivo(os.path.join(root, file), file)
                    if tipo_dato:
                        archivos.append({
                            "path": os.path.join(root, file),
                            "sujeto": sujeto,
                            "sesion": sesion,
                            "tiempo": tiempo,
                            "tipo_captura": tipo_captura,
                            "resultado": resultado,
                            "tipo_dato": tipo_dato,
                            "fecha_hora_ejercicio": os.path.basename(fecha_hora_path)
                        })
    return archivos

def detectar_tipo_archivo(file_path, file_name):
    """
    Detecta el tipo de dato del archivo basado en su nombre.
    """
    for tipo in TIPOS_VALIDOS:
        if tipo.lower() in file_name.lower():
            return tipo
    logging.warning(f"No se pudo determinar el tipo de dato para el archivo: {file_name}")
    return None

def crear_subcarpetas(directorio_fecha):
    """
    Crea las subcarpetas necesarias para el procesamiento.
    """
    processed_data_dir = os.path.join(directorio_fecha, "processed_data")
    staging_dir = os.path.join(processed_data_dir, "staging_xls")
    merged_dir = os.path.join(processed_data_dir, "merged")
    os.makedirs(staging_dir, exist_ok=True)
    os.makedirs(merged_dir, exist_ok=True)
    return staging_dir, merged_dir

def convertir_csv_a_xlsx_con_columnas(archivo_info, staging_dir):
    """
    Convierte un archivo CSV a XLSX agregando metadatos.
    """
    try:
        df = pd.read_csv(archivo_info["path"])

        # Insertar metadatos
        df.insert(0, "Resultado", archivo_info["resultado"])
        df.insert(0, "Tipo de Captura", archivo_info["tipo_captura"])
        df.insert(0, "Tiempo", archivo_info["tiempo"])
        df.insert(0, "Sesion", archivo_info["sesion"])
        df.insert(0, "Sujeto", archivo_info["sujeto"])
        df.insert(0, "Fecha y Hora del Ejercicio", archivo_info["fecha_hora_ejercicio"])

        nombre_base = Path(archivo_info["path"]).stem
        nombre_salida = f"{nombre_base}.xlsx"
        ruta_salida = os.path.join(staging_dir, nombre_salida)
        
        df.to_excel(ruta_salida, index=False, engine='openpyxl')

        logging.info(f"Convertido a .xlsx: {nombre_salida}")
        return archivo_info["tipo_dato"], ruta_salida

    except Exception as e:
        logging.error(f"Error procesando {archivo_info['path']}: {e}")
        return None, None

def fusionar_por_tipo(staging_dir, merged_dir):
    """
    Fusiona archivos XLSX por tipo de dato y los guarda como CSV.
    """
    archivos_por_tipo = {tipo: [] for tipo in TIPOS_VALIDOS}
    resultados_fusion = {
        tipo: {"archivos_procesados": 0, "filas_totales": 0} for tipo in TIPOS_VALIDOS
    }

    for archivo in os.listdir(staging_dir):
        if archivo.endswith(".xlsx") and not archivo.startswith("~$"):
            tipo_detectado = detectar_tipo_archivo(os.path.join(staging_dir, archivo), archivo)
            if tipo_detectado:
                archivos_por_tipo[tipo_detectado].append(os.path.join(staging_dir, archivo))

    for tipo, archivos in archivos_por_tipo.items():
        if archivos:
            df_list = [pd.read_excel(p, engine='openpyxl') for p in archivos]
            if df_list:
                merged_df = pd.concat(df_list, ignore_index=True)
                ruta_merged = os.path.join(merged_dir, f"{tipo}.csv")
                merged_df.to_csv(ruta_merged, index=False, encoding='utf-8-sig')
                
                resultados_fusion[tipo]["archivos_procesados"] = len(archivos)
                resultados_fusion[tipo]["filas_totales"] = len(merged_df)
                logging.info(f"Fusión para '{tipo}' completada: {len(archivos)} archivos, {len(merged_df)} filas.")
    
    return resultados_fusion

def procesar_directorio_fecha(fecha_path, progress_bar=None, status_text=None):
    """
    Orquesta el procesamiento para un único directorio de fecha-hora.
    """
    logging.info(f"\n>>>>> Iniciando procesamiento para: {os.path.basename(fecha_path)} <<<<<")
    
    if status_text:
        status_text.info(f"Iniciando procesamiento de: {os.path.basename(fecha_path)}")
    
    staging_dir, merged_dir = crear_subcarpetas(fecha_path)
    archivos_a_procesar = buscar_archivos_csv(fecha_path)
    
    if not archivos_a_procesar:
        logging.warning("No se encontraron archivos CSV válidos para procesar.")
        if status_text:
            status_text.warning(f"No se encontraron archivos CSV válidos en: {os.path.basename(fecha_path)}")
        return {
            "fecha_hora": os.path.basename(fecha_path),
            "archivos_procesados": 0,
            "total_archivos": 0,
            "errores": ["No se encontraron archivos CSV."],
            "resultados_fusion": {tipo: {"archivos_procesados": 0, "filas_totales": 0} for tipo in TIPOS_VALIDOS}
        }
    
    total_files = len(archivos_a_procesar)
    processed_count = 0
    errors = []

    if status_text:
        status_text.info(f"Encontrados {total_files} archivos CSV para procesar en {os.path.basename(fecha_path)}")

    for i, info in enumerate(archivos_a_procesar):
        if status_text:
            nombre_archivo = os.path.basename(info["path"])
            status_text.info(f"Procesando archivo {i+1}/{total_files}: {nombre_archivo}")
        
        tipo, ruta_salida = convertir_csv_a_xlsx_con_columnas(info, staging_dir)
        if tipo and ruta_salida:
            processed_count += 1
            if status_text:
                status_text.success(f"✓ Convertido: {os.path.basename(info['path'])} → {tipo}")
        else:
            errors.append(info["path"])
            if status_text:
                status_text.error(f"✗ Error: {os.path.basename(info['path'])}")
        
        # Actualizar barra de progreso si está disponible
        if progress_bar:
            progress_bar.progress((i + 1) / total_files)

    if status_text:
        status_text.info(f"Fusionando archivos por tipo en {os.path.basename(fecha_path)}...")

    resultados_fusion = fusionar_por_tipo(staging_dir, merged_dir)
    
    if status_text:
        status_text.success(f"✓ Completado: {os.path.basename(fecha_path)} - {processed_count}/{total_files} archivos procesados")
    
    logging.info(f">>>>> Procesamiento para {os.path.basename(fecha_path)} finalizado. <<<<<")
    
    return {
        "fecha_hora": os.path.basename(fecha_path),
        "archivos_procesados": processed_count,
        "total_archivos": total_files,
        "errores": errors,
        "resultados_fusion": resultados_fusion
    }

def extraer_metadatos_carpeta(nombre_carpeta):
    """
    Extrae metadatos del nombre de una carpeta de escena.
    """
    match = SCENE_CAPTURE_PATTERN.search(nombre_carpeta)
    if match:
        sujeto, sesion, tiempo, tipo_captura, resultado = match.groups()
        return {
            "sujeto": sujeto,
            "sesion": sesion,
            "tiempo": tiempo,
            "tipo_captura": tipo_captura,
            "resultado": resultado
        }
    else:
        # Retornar valores por defecto si no coincide el patrón
        return {
            "sujeto": "Desconocido",
            "sesion": "Desconocida",
            "tiempo": "Desconocido",
            "tipo_captura": "Desconocido",
            "resultado": "Desconocido"
        }

def select_directory():
    """
    Abre un diálogo para seleccionar directorio usando tkinter.
    Retorna la ruta seleccionada o None si se cancela.
    """
    try:
        import tkinter as tk
        from tkinter import filedialog
        
        # Crear ventana raíz oculta
        root = tk.Tk()
        root.withdraw()  # Ocultar la ventana principal
        root.attributes('-topmost', True)  # Mantener en primer plano
        
        # Abrir diálogo de selección de directorio
        directory = filedialog.askdirectory(
            title="Seleccionar directorio del proyecto",
            initialdir=os.path.expanduser("~")
        )
        
        # Destruir la ventana raíz
        root.destroy()
        
        return directory if directory else None
        
    except Exception:
        return None

def limpiar_historico():
    """Elimina el archivo de histórico."""
    history_file = get_history_file()
    if os.path.exists(history_file):
        os.remove(history_file)
        logging.info("Histórico de fusiones limpiado.")
        return True
    return False 