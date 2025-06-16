# Manual de Usuario

Este manual de usuario describe cómo utilizar el script `process_and_merge.py` para procesar y fusionar archivos de datos biométricos y de captura de movimiento.

---

## Índice

1. [Introducción](#introducción)
2. [Requisitos](#requisitos)
3. [Estructura del repositorio](#estructura-del-repositorio)
4. [Instalación](#instalación)
5. [Configuración](#configuración)
6. [Ejecutar el script](#ejecutar-el-script)
7. [Tipos de datos soportados](#tipos-de-datos-soportados)
8. [Flujo de trabajo](#flujo-de-trabajo)
9. [Salida y resultados](#salida-y-resultados)
10. [Solución de problemas](#solución-de-problemas)

---

## Introducción

El script `process_and_merge.py` está diseñado para procesar archivos CSV de datos biométricos y de captura de movimiento, organizados por peso del sujeto. El script realiza las siguientes funciones:

- Convierte archivos CSV a formato XLSX
- Agrega metadatos importantes (peso, escena, fecha y hora)
- Fusiona archivos del mismo tipo en un único CSV consolidado
- Organiza los resultados en una estructura de carpetas clara

## Requisitos

- Python 3.7 o superior
- Paquetes requeridos:
  - pandas
  - openpyxl

## Estructura del repositorio

```plaintext
├── process_and_merge.py     # Script principal
├── requirements.txt         # Archivo de dependencias
└── data/                    # Carpeta base para los datos
    ├── 070kg/              # Carpeta para datos de 70kg
    │   ├── Scene Capture (1)/
    │   │   └── [archivos CSV]
    │   └── processed_data/
    │       ├── staging_xls/
    │       └── merged/
    ├── 080kg/              # Carpeta para datos de 80kg
    │   └── ...
    └── ...
```

## Instalación

1. Asegúrese de tener Python 3.7 o superior instalado
2. Instale las dependencias requeridas usando el archivo `requirements.txt`:

   ```bash
   pip install -r requirements.txt
   ```

   O si prefiere instalar las dependencias manualmente:

   ```bash
   pip install pandas openpyxl
   ```

> **Nota:** El archivo `requirements.txt` incluye todas las dependencias necesarias para el funcionamiento del script, incluyendo pandas y openpyxl.

## Configuración

1. Cree una carpeta `data/` en el mismo directorio que el script
2. Dentro de `data/`, cree carpetas con el formato `XXXkg` (por ejemplo, `070kg`, `080kg`, etc.)
3. En cada carpeta de peso, coloque los archivos CSV en subcarpetas llamadas "Scene Capture (X)"
4. Los archivos CSV deben seguir el patrón de nomenclatura:
   ```
   Scene Capture (X)-Avatar-[TIPO]-YYYY-MM-DD-HH-MM-SS.csv
   ```
   donde:
   - X es el número de escena
   - [TIPO] es uno de los tipos válidos (ver sección "Tipos de datos soportados")
   - YYYY-MM-DD-HH-MM-SS es la fecha y hora de la captura

## Ejecutar el script

En la raíz del proyecto, ejecute:

```bash
python process_and_merge.py
```

El script procesará automáticamente todas las carpetas de peso válidas encontradas en el directorio `data/`.

## Tipos de datos soportados

El script procesa los siguientes tipos de datos:

- PpgHrv: Datos de frecuencia cardíaca
- ProcessedMocap: Datos de captura de movimiento procesados
- ProcessedPpg: Datos de fotopletismografía procesados
- RawMocap: Datos brutos de captura de movimiento
- RawPpg: Datos brutos de fotopletismografía

## Flujo de trabajo

1. El script busca carpetas con formato `XXXkg` en el directorio `data/`
2. Para cada carpeta de peso encontrada:
   - Crea subcarpetas `processed_data/staging_xls` y `processed_data/merged`
   - Busca archivos CSV en subcarpetas "Scene Capture"
   - Convierte cada CSV a XLSX, agregando columnas de metadatos
   - Fusiona los archivos XLSX por tipo de dato
   - Guarda los resultados fusionados como CSV en la carpeta `merged`

## Salida y resultados

Para cada carpeta de peso, el script genera:

1. En `processed_data/staging_xls/`:

   - Archivos XLSX individuales con columnas adicionales:
     - Fecha y Hora
     - # de Escena
     - Peso Cargado

2. En `processed_data/merged/`:
   - Un archivo CSV por cada tipo de dato (PpgHrv, ProcessedMocap, etc.)
   - Cada archivo contiene todos los datos de ese tipo para el peso específico

## Solución de problemas

- **Error: No se encuentra el directorio data/**

  - Verifique que la carpeta `data/` existe en el mismo directorio que el script

- **Error: No se encontraron carpetas de peso válidas**

  - Asegúrese de que las carpetas sigan el formato `XXXkg` (por ejemplo, `070kg`)

- **Error al procesar archivos CSV**

  - Verifique que los nombres de archivo sigan el patrón correcto
  - Asegúrese de que los archivos CSV no estén corruptos
  - Revise los logs para mensajes de error específicos

- **Archivos temporales de Excel (~$\*)**
  - Estos archivos son generados automáticamente por Excel
  - El script los ignora automáticamente
  - Pueden ser eliminados manualmente si lo desea
