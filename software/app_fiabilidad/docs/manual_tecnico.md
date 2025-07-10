# Manual Técnico - Sistema de Análisis ICC

## 📋 Descripción Técnica

El Sistema de Análisis ICC es una aplicación Python diseñada para realizar análisis de fiabilidad mediante el coeficiente de correlación intraclase (ICC) en datos de captura de movimiento. El sistema utiliza pandas y scipy para el procesamiento de datos y cálculos estadísticos.

## 🏗️ Arquitectura del Sistema

### Estructura de Archivos

```
app_fiabilidad/
├── src/
│   └── icc.py              # Módulo principal de análisis ICC
├── output/                  # Carpeta de resultados
├── docs/                    # Documentación
├── start.py                 # Script de inicio automático
├── run_analysis.py          # Script principal de ejecución
├── requirements.txt         # Dependencias del proyecto
└── README.md               # Documentación general
```

### Componentes Principales

#### 1. ICCAnalyzer (src/icc.py)

Clase principal que encapsula toda la funcionalidad de análisis ICC:

**Métodos principales:**

- `cargar_datos()`: Carga y valida el archivo CSV
- `verificar_columnas()`: Valida columnas requeridas
- `identificar_columnas_numericas()`: Identifica variables numéricas
- `calcular_icc()`: Calcula correlaciones ICC
- `mostrar_resultados()`: Visualiza resultados
- `guardar_resultados()`: Guarda archivos CSV

#### 2. Scripts de Ejecución

- `start.py`: Script de inicio con instalación automática de dependencias
- `run_analysis.py`: Script principal de análisis

## 🔧 Especificaciones Técnicas

### Dependencias

```txt
pandas>=1.3.0
scipy>=1.7.0
pingouin>=0.5.0
mermaid-cli>=10.0.0
```

### Requisitos del Sistema

- **Python**: 3.7 o superior
- **Memoria**: Mínimo 4GB RAM (recomendado 8GB)
- **Almacenamiento**: 100MB libres
- **Sistema Operativo**: Windows, Linux, macOS

### Formatos de Datos Soportados

- **Entrada**: CSV (UTF-8, delimitador: coma)
- **Salida**: CSV (UTF-8, delimitador: coma)

## 📊 Algoritmo de Análisis ICC

### Paso 1: Carga y Validación de Datos

```python
def cargar_datos(self):
    # Verifica existencia del archivo
    # Carga CSV con pandas
    # Valida estructura básica
```

### Paso 2: Verificación de Columnas

```python
def verificar_columnas(self):
    # Valida columnas obligatorias: "Sujeto", "Sesion", "Tiempo"
    # Verifica tipos de datos
    # Reporta columnas faltantes
```

### Paso 3: Identificación de Variables Numéricas

```python
def identificar_columnas_numericas(self):
    # Filtra columnas excluidas: ["subject", "repetition", "session"]
    # Convierte a numérico con pd.to_numeric()
    # Valida que >50% de valores sean numéricos
```

### Paso 4: Preparación de Datos

```python
def crear_estructura_datos(self):
    # Renombra columnas para análisis
    # Concatena datos de todas las variables
    # Elimina valores faltantes
```

### Paso 5: Cálculo de ICC

```python
def calcular_icc(self):
    # Agrupa por sujeto y variable
    # Calcula promedios por repetición
    # Crea matriz pivot para correlación
    # Calcula correlación entre repeticiones
```

## 🔍 Detalles de Implementación

### Cálculo del ICC

El ICC se calcula como la correlación de Pearson entre las repeticiones para cada variable:

```python
# Para cada variable
pivot_data = var_data.pivot(index="subject", columns="repetition", values="score")
corr = pivot_data.corr().iloc[0, 1]  # Correlación entre repeticiones
```

### Criterios de Validación

- **Mínimo sujetos**: 2 sujetos únicos
- **Mínimo repeticiones**: 2 repeticiones por sujeto
- **Completitud**: Cada sujeto debe tener ambas repeticiones
- **Variables numéricas**: >50% de valores numéricos válidos

### Manejo de Errores

```python
try:
    # Operación principal
except FileNotFoundError:
    # Manejo de archivo no encontrado
except ValueError:
    # Manejo de datos inválidos
except Exception as e:
    # Manejo de errores generales
```

## 📈 Rendimiento y Optimización

### Complejidad Temporal

- **Carga de datos**: O(n) donde n = número de registros
- **Identificación de variables**: O(m) donde m = número de columnas
- **Cálculo ICC**: O(v × s) donde v = variables, s = sujetos

### Optimizaciones Implementadas

1. **Procesamiento por lotes**: Variables se procesan en grupos
2. **Filtrado temprano**: Eliminación de datos inválidos antes del cálculo
3. **Uso eficiente de memoria**: Procesamiento incremental de datos grandes

### Límites del Sistema

- **Máximo archivo**: 1GB CSV
- **Máximo variables**: 10,000 variables
- **Máximo sujetos**: 1,000 sujetos
- **Máximo repeticiones**: 10 repeticiones por sujeto

## 🛠️ Configuración Avanzada

### Variables de Entorno

```bash
# Configurar ruta de datos por defecto
export ICC_DATA_PATH="../data/processed_data/merged/"

# Configurar nivel de logging
export ICC_LOG_LEVEL="INFO"

# Configurar directorio de salida
export ICC_OUTPUT_DIR="output/"
```

### Personalización del Análisis

```python
# Modificar umbral de ICC
THRESHOLD_ICC = 0.90  # Cambiar a 0.85 para ser menos estricto

# Modificar criterio de variables numéricas
MIN_NUMERIC_RATIO = 0.5  # Cambiar a 0.7 para ser más estricto

# Modificar número mínimo de sujetos
MIN_SUBJECTS = 2  # Cambiar según necesidades
```

## 🔧 Mantenimiento y Debugging

### Logs del Sistema

El sistema genera logs detallados durante la ejecución:

- Progreso de carga de datos
- Validación de columnas
- Identificación de variables
- Cálculo de ICC
- Guardado de resultados

### Debugging Común

#### Problema: Error de memoria

**Síntomas**: `MemoryError` durante el procesamiento
**Solución**:

```python
# Procesar en lotes más pequeños
BATCH_SIZE = 1000  # Reducir según memoria disponible
```

#### Problema: Tiempo de ejecución lento

**Síntomas**: Análisis tarda más de 10 minutos
**Solución**:

```python
# Optimizar procesamiento
USE_PARALLEL = True  # Habilitar procesamiento paralelo
```

#### Problema: Resultados inconsistentes

**Síntomas**: ICC varía entre ejecuciones
**Solución**:

```python
# Fijar semilla para reproducibilidad
np.random.seed(42)
```

## 📊 Monitoreo y Métricas

### Métricas de Rendimiento

- **Tiempo de carga**: Tiempo para cargar archivo CSV
- **Tiempo de procesamiento**: Tiempo para calcular ICC
- **Memoria utilizada**: Uso de RAM durante ejecución
- **Variables procesadas**: Número de variables analizadas

### Métricas de Calidad

- **Variables válidas**: Porcentaje de variables con datos válidos
- **ICC promedio**: Correlación promedio de todas las variables
- **Variables con ICC alto**: Porcentaje de variables con ICC > 0.90

## 🔒 Seguridad y Validación

### Validación de Entrada

- Verificación de formato CSV
- Validación de tipos de datos
- Comprobación de integridad de datos
- Sanitización de nombres de archivos

### Manejo de Errores

- Errores de archivo no encontrado
- Errores de formato de datos
- Errores de memoria insuficiente
- Errores de permisos de archivo

## 📚 Referencias Técnicas

### Algoritmos Utilizados

- **Correlación de Pearson**: Para cálculo de ICC
- **Pivot tables**: Para reorganización de datos
- **GroupBy operations**: Para agregación de datos

### Bibliotecas Principales

- **pandas**: Manipulación y análisis de datos
- **numpy**: Operaciones numéricas
- **scipy**: Funciones estadísticas

### Estándares de Código

- **PEP 8**: Estilo de código Python
- **Docstrings**: Documentación de funciones
- **Type hints**: Anotaciones de tipos (opcional)

---

**Versión**: 1.0  
**Fecha**: 2024  
**Mantenido por**: Equipo de Desarrollo ICC
