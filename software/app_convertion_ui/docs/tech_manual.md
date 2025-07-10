# Manual Técnico - Procesador de Datos Biométricos

## Índice

1. [Arquitectura del Sistema](#arquitectura-del-sistema)
2. [Estructura del Proyecto](#estructura-del-proyecto)
3. [Componentes Principales](#componentes-principales)
4. [Flujo de Datos](#flujo-de-datos)
5. [Sistema de Pruebas](#sistema-de-pruebas)
6. [Configuración y Despliegue](#configuración-y-despliegue)
7. [Mantenimiento y Debugging](#mantenimiento-y-debugging)

## Arquitectura del Sistema

### Arquitectura General

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Interfaz      │    │   Procesamiento │    │   Almacenamiento │
│   Streamlit     │◄──►│   Global        │◄──►│   Histórico     │
│   (Frontend)    │    │   (Backend)     │    │   (JSON)        │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         ▼                       ▼                       ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Configuración │    │   Conversión    │    │   Visualización │
│   de Rutas      │    │   CSV → XLSX    │    │   Plotly        │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

### Tecnologías Utilizadas

- **Frontend**: Streamlit 1.28.0+
- **Backend**: Python 3.8+
- **Procesamiento**: Pandas 2.0.0+
- **Visualización**: Plotly 5.15.0+
- **Pruebas**: Pytest 7.4.0+
- **Gestión de Estado**: Streamlit Session State
- **Configuración**: Archivo config.py

## Estructura del Proyecto

### Organización de Carpetas

```
app_convertion_ui/
├── run_app.py                    # Punto de entrada principal
├── config.py                     # Configuración centralizada
├── setup_data_path.py            # Configurador interactivo
├── test_config.py                # Pruebas de configuración
├── requirements.txt              # Dependencias del proyecto
├── pytest.ini                   # Configuración de pruebas
├── __init__.py                  # Inicialización del paquete
│
├── .streamlit/                   # Configuración de Streamlit
│   └── config.toml              # Configuración de tema y servidor
│
├── src/                          # Código fuente principal
│   ├── app.py                   # Interfaz Streamlit (863 líneas)
│   └── data_processing.py       # Lógica de procesamiento (507 líneas)
│
├── docs/                         # Documentación
│   ├── README.md                # Documentación principal
│   ├── user_manual.md           # Manual de usuario
│   └── tech_manual.md           # Este manual técnico
│
├── tests/                        # Sistema de pruebas
│   ├── unit/                    # Pruebas unitarias
│   │   └── test_data_processing.py
│   └── functional/              # Pruebas funcionales
│       └── test_app_flow.py
│
└── test_reports/                # Reportes de pruebas
    ├── test_report.html         # Reporte HTML principal
    └── assets/
        └── style.css            # Estilos del reporte
```

> **Nota:** Ya no existe ni se soporta una carpeta `/data` interna dentro de `app_convertion_ui`. Los datos deben estar en una carpeta externa o en la ruta configurada en `config.py`.

### Archivos Clave

#### `run_app.py` (Punto de Entrada)

```python
# Ubicación: Raíz del proyecto
# Propósito: Script de inicio unificado
# Funciones:
# - Instalación automática de dependencias
# - Ejecución de pruebas
# - Inicio de la aplicación
```

#### `config.py` (Configuración)

```python
# Ubicación: Raíz del proyecto
# Propósito: Configuración centralizada
# Variables:
# - DATA_DIRECTORY: Ruta a los datos (externa o personalizada)
# - VALID_FILE_TYPES: Tipos de archivos válidos
# - DEFAULT_OUTPUT_FORMAT: Formato de salida por defecto
# - INCLUDE_METADATA: Incluir metadatos en archivos de salida
```

#### `setup_data_path.py` (Configurador Interactivo)

```python
# Ubicación: Raíz del proyecto
# Propósito: Configurador interactivo de rutas
# Funciones:
# - Solicita ruta al usuario
# - Valida la estructura
# - Actualiza config.py
```

#### `src/app.py` (Interfaz Principal)

```python
# Ubicación: src/app.py
# Propósito: Interfaz Streamlit
# Componentes:
# - Panel lateral de configuración
# - Dashboard principal
# - Sistema de progreso
# - Gestión de estado
```

#### `src/data_processing.py` (Lógica de Negocio)

```python
# Ubicación: src/data_processing.py
# Propósito: Procesamiento global de datos
# Funciones:
# - Validación de estructura
# - Conversión CSV → XLSX
# - Fusión global de archivos
# - Gestión de metadatos
```

## Componentes Principales

### 1. Interfaz de Usuario (Streamlit)

#### Panel Lateral

```python
# Componentes principales:
- st.sidebar: Contenedor principal
- select_directory(): Selección de directorio
- st.button(): Botones de acción
- st.info(): Mensajes informativos
```

#### Dashboard Principal

```python
# Estructura:
- st.tabs(): Pestañas organizativas
- st.metrics(): Métricas en tiempo real
- plotly_chart(): Gráficos interactivos
- st.progress(): Barra de progreso
```

#### Gestión de Estado

```python
# Variables de sesión:
- st.session_state.directorio_input
- st.session_state.directorios_validos
- st.session_state.procesando
- st.session_state.historico
```

### 2. Procesamiento Global de Datos

#### Validación de Estructura

```python
def validar_estructura_directorios(directorio_raiz):
    """
    Valida la estructura de directorios según el formato requerido:
    - Carpetas "Scene Capture" directamente
    - Archivos CSV dentro de las carpetas
    - Metadatos en nombres de archivo
    """
```

#### Conversión de Archivos

```python
def convertir_csv_a_xlsx(archivo_csv, archivo_xlsx, metadatos):
    """
    Convierte archivo CSV a XLSX con metadatos:
    - Lee datos CSV con pandas
    - Añade hoja de metadatos
    - Guarda en formato XLSX
    """
```

#### Fusión Global de Datos

```python
def procesar_datos_globalmente(directorio_raiz):
    """
    Procesamiento global de todos los datos:
    - Encuentra todas las carpetas Scene Capture
    - Convierte todos los CSV a XLSX
    - Fusiona todos los archivos por tipo
    - Crea estructura única de salida
    """
```

### 3. Sistema de Configuración

#### Configuración de Rutas

```python
# Archivo: config.py
DATA_DIRECTORY = "../data"  # Ruta externa por defecto

def get_data_directory():
    """
    Obtiene la ruta configurada para los datos:
    - Lee config.py
    - Valida la ruta
    - Retorna ruta por defecto si es necesario
    """

def validate_data_directory():
    """
    Valida que el directorio de datos existe y tiene la estructura correcta.
    """
```

#### Configurador Interactivo

```python
# Archivo: setup_data_path.py
def configurar_ruta_datos():
    """
    Configurador interactivo de rutas:
    - Solicita ruta al usuario
    - Valida la estructura
    - Actualiza config.py
    """
```

### 4. Sistema de Histórico

#### Almacenamiento

```python
# Archivo: src/fusion_history.json
{
    "fecha": "2025-01-20T10:30:00",
    "directorio_procesado": "/path/to/data",
    "metricas": {
        "carpetas_procesadas": 15,
        "archivos_convertidos": 75,
        "archivos_fusionados": 5,
        "tiempo_total": 120.5
    },
    "resultados": {
        "fecha_hora": "2025-01-20T10:30:00",
        "directorios_validos": ["Scene Capture - SUB1 - S1 - T1 - CC - OK", ...],
        "archivos_procesados": ["archivo1.csv", "archivo2.csv", ...],
        "tipos_datos": ["PpgHrv", "ProcessedMocap", "ProcessedPpg", "RawMocap", "RawPpg"]
    }
}
```

#### Gestión de Histórico

```python
def guardar_historico(resultados):
    """
    Guarda resultados en el histórico:
    - Lee histórico existente
    - Añade nuevos resultados
    - Mantiene formato consistente
    """

def cargar_historico():
    """
    Carga histórico para visualización:
    - Lee archivo JSON
    - Procesa datos para gráficos
    - Maneja errores de archivo
    """
```

## Flujo de Datos

### 1. Inicialización

```
Usuario ejecuta run_app.py
         ↓
Sistema instala dependencias
         ↓
Ejecuta pruebas de integridad
         ↓
Inicia aplicación Streamlit
```

### 2. Configuración

```
Usuario selecciona directorio
         ↓
Sistema valida estructura
         ↓
Configura ruta de datos
         ↓
Prepara procesamiento
```

### 3. Procesamiento Global

```
Sistema encuentra carpetas Scene Capture
         ↓
Identifica archivos CSV válidos
         ↓
Convierte CSV a XLSX con metadatos
         ↓
Fusiona archivos por tipo de dato
         ↓
Crea estructura única de salida
         ↓
Guarda en /processed_data
```

### 4. Visualización

```
Sistema carga resultados
         ↓
Genera métricas en tiempo real
         ↓
Crea gráficos interactivos
         ↓
Muestra información detallada
```

## Sistema de Pruebas

### Estructura de Pruebas

```
tests/
├── unit/                       # Pruebas unitarias
│   └── test_data_processing.py # Pruebas de procesamiento
├── functional/                 # Pruebas funcionales
│   └── test_app_flow.py       # Pruebas de flujo completo
└── conftest.py                # Configuración de pruebas
```

### Tipos de Pruebas

#### Pruebas Unitarias

```python
def test_validar_estructura_directorios():
    """Prueba validación de estructura de directorios"""
    
def test_convertir_csv_a_xlsx():
    """Prueba conversión CSV a XLSX"""
    
def test_procesar_datos_globalmente():
    """Prueba procesamiento global"""
```

#### Pruebas Funcionales

```python
def test_flujo_completo_app():
    """Prueba flujo completo de la aplicación"""
    
def test_manejo_errores():
    """Prueba manejo de errores"""
    
def test_visualizacion_datos():
    """Prueba visualización de resultados"""
```

### Configuración de Pruebas

```ini
# pytest.ini
[tool:pytest]
testpaths = tests
python_files = test_*.py
python_classes = Test*
python_functions = test_*
addopts = -v --tb=short
```

## Configuración y Despliegue

### Requisitos del Sistema

- **Python**: 3.8 o superior
- **Memoria**: Mínimo 4GB RAM
- **Almacenamiento**: Suficiente para datos de entrada y salida
- **Navegador**: Moderno (Chrome, Firefox, Safari, Edge)

### Instalación

#### Automática (Recomendado)

```bash
# Clona o descarga el proyecto
cd app_convertion_ui

# Ejecuta el script de inicio
python run_app.py
```

#### Manual

```bash
# Instala dependencias
pip install -r requirements.txt

# Ejecuta pruebas
python -m pytest tests/

# Inicia aplicación
streamlit run src/app.py
```

### Configuración de Datos

#### Opción 1: Carpeta Externa

```python
# config.py
DATA_DIRECTORY = "../data"  # Ruta relativa
# o
DATA_DIRECTORY = "C:/Users/Usuario/Documents/data"  # Ruta absoluta
```

#### Opción 2: Ruta personalizada

```python
# config.py
DATA_DIRECTORY = "/ruta/a/tus/datos"  # Usa la ruta que prefieras
```

### Variables de Entorno

```bash
# Opcional: Configurar variables de entorno
export STREAMLIT_SERVER_PORT=8501
export STREAMLIT_SERVER_ADDRESS=localhost
```

## Mantenimiento y Debugging

### Logs del Sistema

#### Niveles de Log

- **INFO**: Información normal del procesamiento
- **WARNING**: Advertencias que no impiden funcionamiento
- **ERROR**: Errores que requieren atención
- **DEBUG**: Información detallada para debugging

#### Ubicación de Logs

- **Streamlit**: Consola del navegador (F12)
- **Backend**: Terminal donde se ejecuta la aplicación
- **Pruebas**: Salida de pytest

### Debugging Común

#### Problema: "No se encuentran directorios válidos"

```python
# Verificar estructura
def debug_estructura_directorios(directorio):
    print(f"Contenido de {directorio}:")
    for item in os.listdir(directorio):
        print(f"  - {item}")
```

#### Problema: "Error en conversión CSV"

```python
# Verificar archivo CSV
def debug_archivo_csv(ruta_archivo):
    try:
        df = pd.read_csv(ruta_archivo)
        print(f"Archivo válido: {len(df)} filas")
    except Exception as e:
        print(f"Error: {e}")
```

#### Problema: "Error en fusión de datos"

```python
# Verificar datos de fusión
def debug_fusion_datos(lista_archivos):
    for archivo in lista_archivos:
        print(f"Verificando: {archivo}")
        # Verificar estructura de datos
```

### Optimización

#### Rendimiento

- **Archivos grandes**: Procesar en lotes
- **Múltiples carpetas**: Usar procesamiento paralelo
- **Memoria**: Limpiar variables temporales

#### Mantenimiento

- **Limpieza periódica**: Eliminar archivos temporales
- **Actualización**: Mantener dependencias actualizadas
- **Backup**: Hacer copias de datos importantes

### Monitoreo

#### Métricas de Rendimiento

- **Tiempo de procesamiento**: Por archivo y total
- **Uso de memoria**: Durante conversión y fusión
- **Tasa de éxito**: Archivos procesados vs errores

#### Alertas

- **Errores críticos**: Notificar inmediatamente
- **Advertencias**: Registrar para revisión
- **Rendimiento lento**: Alertar sobre optimización

---

**Documentación Técnica Completa - Sistema de Procesamiento Global de Datos Biométricos**
