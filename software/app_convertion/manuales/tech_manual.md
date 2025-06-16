# Manual Técnico: Script de Procesamiento y Fusión de Datos Biométricos y de Captura de Movimiento

## Descripción General

Este script (`process_and_merge.py`) está diseñado para automatizar el procesamiento de archivos CSV que contienen datos biométricos y de captura de movimiento, organizados por peso del sujeto. El flujo incluye la conversión de archivos CSV a XLSX, la adición de metadatos relevantes y la fusión de archivos por tipo de dato en archivos CSV consolidados.

---

## Estructura de Directorios Esperada

```
.
├── process_and_merge.py
├── requirements.txt
└── data/
    ├── 070kg/
    │   ├── Scene Capture (1)/
    │   │   └── [archivos CSV]
    │   └── processed_data/
    │       ├── staging_xls/
    │       └── merged/
    ├── 080kg/
    │   └── ...
    └── ...
```

---

## Requisitos Técnicos

- Python 3.7 o superior
- Dependencias:
  - pandas
  - openpyxl

Instalación recomendada:

```bash
pip install -r requirements.txt
```

---

## Tipos de Archivos Soportados

El script procesa archivos CSV con el siguiente patrón de nombre:

```
Scene Capture (X)-Avatar-[TIPO]-YYYY-MM-DD-HH-MM-SS.csv
```

Donde:

- `X`: número de escena
- `[TIPO]`: uno de los siguientes tipos válidos:
  - PpgHrv
  - ProcessedMocap
  - ProcessedPpg
  - RawMocap
  - RawPpg
- `YYYY-MM-DD-HH-MM-SS`: fecha y hora de la captura

---

## Flujo Técnico General

1. El script busca carpetas con formato `XXXkg` en el directorio `data/`.
2. Para cada carpeta de peso:
   - Crea subcarpetas `processed_data/staging_xls` y `processed_data/merged`.
   - Busca archivos CSV válidos en subcarpetas "Scene Capture".
   - Convierte cada CSV a XLSX, agregando columnas de metadatos.
   - Fusiona los archivos XLSX por tipo de dato.
   - Guarda los resultados fusionados como CSV en la carpeta `merged`.

---

## Documentación de Funciones

### validar_directorios(base_dir)

Valida y retorna las carpetas de peso válidas en el directorio base.

**Parámetros:**

- `base_dir` (str): Ruta del directorio base a validar.

**Retorna:**

- `list`: Lista de rutas de carpetas de peso válidas (formato XXXkg).

**Ejemplo:**

```python
directorios = validar_directorios('data')
print(directorios)  # ['data/070kg', 'data/080kg', ...]
```

---

### crear_subcarpetas(directorio_peso)

Crea las subcarpetas necesarias para el procesamiento de datos.

**Parámetros:**

- `directorio_peso` (str): Ruta del directorio de peso.

**Retorna:**

- `tuple`: Rutas de las carpetas staging_xls y merged creadas.

**Ejemplo:**

```python
staging_dir, merged_dir = crear_subcarpetas('data/070kg')
```

---

### buscar_archivos_csv(peso_path)

Busca archivos CSV válidos en el directorio de peso especificado.

**Parámetros:**

- `peso_path` (str): Ruta del directorio de peso.

**Retorna:**

- `list`: Lista de diccionarios con información de los archivos encontrados.

**Ejemplo:**

```python
archivos = buscar_archivos_csv('data/070kg')
for archivo in archivos:
    print(archivo['path'], archivo['tipo'])
```

---

### convertir_csv_a_xlsx_con_columnas(archivo_info, staging_dir)

Convierte un archivo CSV a XLSX y agrega columnas de metadatos.

**Parámetros:**

- `archivo_info` (dict): Información del archivo a convertir.
- `staging_dir` (str): Directorio donde se guardará el archivo XLSX.

**Retorna:**

- `tuple`: (tipo de archivo, ruta del archivo XLSX generado) o (None, None) si hay error.

**Ejemplo:**

```python
tipo, ruta_xlsx = convertir_csv_a_xlsx_con_columnas(archivo, 'data/070kg/processed_data/staging_xls')
```

---

### fusionar_por_tipo(staging_dir, merged_dir)

Fusiona archivos XLSX por tipo de dato y los guarda como CSV.

**Parámetros:**

- `staging_dir` (str): Directorio con archivos XLSX a fusionar.
- `merged_dir` (str): Directorio donde se guardarán los CSV fusionados.

**Ejemplo:**

```python
fusionar_por_tipo('data/070kg/processed_data/staging_xls', 'data/070kg/processed_data/merged')
```

---

### procesar_directorio_peso(peso_path)

Procesa todos los archivos CSV en un directorio de peso específico.

**Parámetros:**

- `peso_path` (str): Ruta del directorio de peso a procesar.

**Ejemplo:**

```python
procesar_directorio_peso('data/070kg')
```

---

### main()

Función principal que ejecuta el procesamiento de todos los directorios de peso.

**Ejemplo:**

```python
if __name__ == "__main__":
    main()
```

---

## Manejo de Errores y Logs

- El script utiliza el módulo `logging` para registrar información, advertencias y errores.
- Los archivos temporales de Excel (`~$*`) son ignorados automáticamente.
- Los errores de lectura/escritura y archivos corruptos son reportados en consola y log.

---

## Ejemplo de Ejecución Completa

```bash
python process_and_merge.py
```

Esto procesará automáticamente todos los datos en la estructura de carpetas, generando archivos fusionados por tipo y peso.

---

## Mantenimiento y Extensión

- Para agregar nuevos tipos de datos, modifique la lista `TIPOS_VALIDOS` en el script.
- Mantenga actualizadas las dependencias en `requirements.txt`.
- Revise los logs para identificar posibles problemas o archivos no procesados.

---

**Autor:** [Tu Nombre]

**Fecha de última actualización:** [Fecha]
