# Manual de Usuario - Procesador de Datos Biométricos

## Índice

1. [Instalación y Configuración](#instalación-y-configuración)
2. [Configuración de Ruta de Datos](#configuración-de-ruta-de-datos)
3. [Primer Uso](#primer-uso)
4. [Interfaz de Usuario](#interfaz-de-usuario)
5. [Procesamiento de Datos](#procesamiento-de-datos)
6. [Visualización de Resultados](#visualización-de-resultados)
7. [Gestión del Histórico](#gestión-del-histórico)
8. [Solución de Problemas](#solución-de-problemas)

## Instalación y Configuración

### Requisitos Previos

- Python 3.8 o superior
- Navegador web moderno
- Acceso a internet (para descarga de dependencias)

### Instalación Automática

1. **Navega al directorio del proyecto**:

   ```bash
   cd app_convertion_ui
   ```

2. **Ejecuta el script de inicio**:

   ```bash
   python run_app.py
   ```

3. **El sistema automáticamente**:

   - ✅ Instala todas las dependencias necesarias
   - 🧪 Ejecuta pruebas de integridad
   - 🌐 Inicia la aplicación web
   - 📊 Genera reporte de pruebas

4. **Accede a la aplicación**:
   - Abre tu navegador
   - Ve a: `http://localhost:8501`

### Estructura de Archivos

```
app_convertion_ui/
├── run_app.py                    # Script de inicio principal
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
│   └── tech_manual.md           # Manual técnico
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

## Configuración de Ruta de Datos

### Ubicación de Datos

El sistema puede trabajar con datos en diferentes ubicaciones:

#### Opción 1: Carpeta externa (Recomendado)
```
/data/
├── Scene Capture - SUB1 - S1 - T1 - CC - OK/
├── Scene Capture - SUB1 - S1 - T2 - CC - OK/
└── ...
```

#### Opción 2: Ruta personalizada
```
/mi_carpeta_de_datos/
├── Scene Capture - SUB1 - S1 - T1 - CC - OK/
└── ...
```

> **Nota:** La carpeta de datos debe estar fuera de `app_convertion_ui` o en la ubicación que configures en `config.py`. Ya no se recomienda ni se soporta una carpeta `/data` interna dentro del proyecto.

### Configuración Automática

1. **Edita el archivo `config.py`**:
   ```python
   DATA_DIRECTORY = "../data"  # Para carpeta externa
   # o
   DATA_DIRECTORY = "/ruta/a/tus/datos"  # Para ruta personalizada
   ```

2. **O usa el configurador interactivo**:
   ```bash
   python setup_data_path.py
   ```

## Primer Uso

### 1. Preparación de Datos

Asegúrate de que tus datos estén organizados correctamente:

```
/data/
├── Scene Capture - SUB1 - S1 - T1 - CC - OK/
│   ├── ...-PpgHrv-....csv
│   ├── ...-ProcessedMocap-....csv
│   └── ...-ProcessedPpg-....csv
├── Scene Capture - SUB1 - S1 - T2 - CC - OK/
│   └── ...
└── Scene Capture - SUB2 - S2 - T1 - SC - OK/
    └── ...
```

**Nota**: El sistema ahora detecta carpetas "Scene Capture" directamente, sin necesidad de carpetas con formato de fecha ni de una carpeta `/data` interna.

### 2. Selección de Directorio

1. **Abre la aplicación** en tu navegador
2. **En el panel lateral**, haz clic en "📁 Explorar"
3. **Selecciona** el directorio raíz de tus datos
4. **El sistema validará automáticamente** la estructura

### 3. Procesamiento Inicial

1. **Verifica** que aparezcan directorios válidos
2. **Haz clic** en "🚀 Procesar Datos"
3. **Observa** el progreso en tiempo real
4. **Espera** a que termine el procesamiento global

## Interfaz de Usuario

### Panel Lateral (Configuración)

- **📁 Explorar**: Selecciona directorio de datos
- **📊 Ver Histórico**: Accede a resultados anteriores
- **🗑️ Limpiar Histórico**: Elimina datos históricos
- **ℹ️ Información**: Detalles del sistema

### Área Principal (Dashboard)

- **📈 Métricas en Tiempo Real**: Estadísticas del procesamiento
- **📊 Gráficos Interactivos**: Visualización de datos
- **📋 Histórico de Procesamiento**: Resultados anteriores
- **⚡ Progreso**: Estado actual del procesamiento

### Pestañas del Dashboard

1. **📊 Resumen**: Vista general de métricas
2. **📈 Tendencias**: Análisis temporal
3. **📋 Detalles**: Información específica por archivo

## Procesamiento de Datos

### Flujo Automático (Procesamiento Global)

1. **Validación**: El sistema verifica la estructura de directorios
2. **Detección**: Identifica archivos CSV válidos en todas las carpetas
3. **Conversión**: Transforma todos los CSV a XLSX con metadatos
4. **Fusión Global**: Combina todos los archivos por tipo de dato
5. **Almacenamiento**: Guarda resultados en una sola carpeta `/processed_data` dentro de la carpeta de datos configurada

### Estructura de Salida

```
/processed_data/           # ← ÚNICA CARPETA DE PROCESAMIENTO
├── staging_xls/         # ← TODOS los archivos XLSX aquí
└── merged/              # ← TODOS los archivos fusionados aquí
    ├── PpgHrv.csv       # ← TODOS los datos PpgHrv combinados
    ├── ProcessedMocap.csv
    ├── ProcessedPpg.csv
    ├── RawMocap.csv
    └── RawPpg.csv
```

### Metadatos Extraídos

- **Sujeto**: SUB1, SUB2, SUB3, etc.
- **Sesión**: S1, S2, S3, etc.
- **Tiempo**: T1, T2, etc.
- **Tipo**: CC (Ciclo Cardíaco), SC (Sin Ciclo)
- **Resultado**: OK, BAD
- **Fecha/Hora**: Automática (fecha actual)

### Tipos de Datos Procesados

- **PpgHrv**: Datos de frecuencia cardíaca
- **ProcessedMocap**: Datos de movimiento procesados
- **ProcessedPpg**: Datos PPG procesados
- **RawMocap**: Datos de movimiento crudos
- **RawPpg**: Datos PPG crudos

## Visualización de Resultados

### Métricas Principales

- **📁 Carpetas Procesadas**: Total de carpetas Scene Capture válidas
- **📄 Archivos Convertidos**: CSV → XLSX exitosos
- **📊 Archivos Fusionados**: Combinaciones por tipo
- **⏱️ Tiempo Total**: Duración del procesamiento global

### Gráficos Interactivos

- **Distribución por Tipo**: Proporción de cada tipo de dato
- **Análisis por Sujeto**: Comparativa entre sujetos
- **Tendencias Temporales**: Evolución en el tiempo
- **Eficiencia del Sistema**: Rendimiento del procesamiento

### Información Detallada

- **Lista de Archivos**: Todos los archivos procesados
- **Errores y Advertencias**: Problemas encontrados
- **Estadísticas por Sesión**: Análisis detallado
- **Comparativas**: Diferencias entre sesiones

## Gestión del Histórico

### Acceso al Histórico

1. **En el panel lateral**, haz clic en "📊 Ver Histórico"
2. **Explora** las diferentes pestañas:
   - **Resumen**: Vista general
   - **Tendencias**: Análisis temporal
   - **Detalles**: Información específica

### Funcionalidades del Histórico

- **📈 Gráficos de Tendencia**: Evolución temporal
- **📊 Comparativas**: Entre diferentes ejecuciones
- **📋 Lista Detallada**: Todos los archivos procesados
- **🔍 Filtros**: Búsqueda y filtrado de datos

### Limpieza del Histórico

1. **En el panel lateral**, haz clic en "🗑️ Limpiar Histórico"
2. **Confirma** la acción
3. **El sistema eliminará** todos los datos históricos

## Solución de Problemas

### Problemas Comunes

#### ❌ "No se encontraron directorios válidos"

**Causa**: Estructura de directorios incorrecta
**Solución**:

1. Verifica que tus carpetas tengan formato: `Scene Capture - SUB1 - S1 - T1 - CC - OK`
2. Asegúrate de seleccionar el directorio correcto
3. Confirma que existan archivos CSV dentro de las carpetas

#### ❌ "Error de configuración de ruta"

**Causa**: Ruta de datos no configurada correctamente
**Solución**:

1. Edita el archivo `config.py`
2. Configura `DATA_DIRECTORY` con la ruta correcta
3. O usa el configurador: `python setup_data_path.py`

#### ❌ "Error en procesamiento global"

**Causa**: Problemas durante la conversión o fusión
**Solución**:

1. Verifica que los archivos CSV no estén corruptos
2. Asegúrate de que los nombres de archivo contengan los tipos de datos válidos
3. Revisa los logs para identificar archivos específicos con problemas

### Logs y Debugging

Los logs se muestran en tiempo real en la aplicación. Busca mensajes que empiecen con:
- `INFO`: Información normal del procesamiento
- `WARNING`: Advertencias que no impiden el funcionamiento
- `ERROR`: Errores que requieren atención

### Contacto y Soporte

Para problemas técnicos:
1. Revisa los logs en la aplicación
2. Verifica la configuración en `config.py`
3. Ejecuta las pruebas: `python -m pytest tests/`
