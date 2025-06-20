# Procesador y Visualizador de Datos Biométricos

## Descripción

Aplicación web moderna para procesar y fusionar archivos CSV de datos biométricos organizados en carpetas con formato de fecha y hora. La aplicación incluye una interfaz intuitiva, validación automática de directorios, procesamiento en tiempo real y visualización avanzada de resultados.

## Características Principales

### 🚀 **Interfaz Moderna y Intuitiva**
- Panel lateral para configuración y control
- Dashboard principal con progreso en tiempo real
- Mensajes claros y no redundantes
- Diseño responsive y profesional

### 🔍 **Validación Automática**
- Detección automática de estructura de directorios
- Validación de formato de fecha/hora (YYYY-MM-DD-HH-MM-SS)
- Búsqueda inteligente de subcarpetas 'data'
- Mensajes de estado claros y unificados

### ⚡ **Procesamiento Eficiente**
- Conversión automática de CSV a XLSX con metadatos
- Fusión inteligente por tipo de dato biométrico
- Progreso visible en tiempo real
- Manejo robusto de errores

### 📊 **Visualización Avanzada**
- Gráficos interactivos con Plotly
- Dashboard histórico con tendencias
- Métricas en tiempo real
- Reportes detallados de procesamiento

### 🧪 **Sistema de Pruebas Completo**
- Pruebas unitarias automáticas
- Pruebas funcionales de flujo completo
- Reportes HTML de pruebas
- Validación de integridad del sistema

## Estructura del Proyecto

```
app_convertion_ui/
├── run_app.py              # Script de inicio (raíz para comodidad)
├── requirements.txt        # Dependencias del proyecto
├── src/                   # Código fuente principal
│   ├── app.py            # Interfaz Streamlit
│   └── data_processing.py # Lógica de procesamiento
├── scripts/              # Scripts de utilidad
├── docs/                 # Documentación
│   └── manuales/        # Manuales de usuario y técnico
├── tests/               # Sistema de pruebas
│   ├── unit/           # Pruebas unitarias
│   └── functional/     # Pruebas funcionales
├── test_reports/       # Reportes de pruebas HTML
└── data/              # Datos de ejemplo (sin mover)
```

## Instalación y Uso

### Instalación Automática
```bash
python run_app.py
```

Este comando:
1. ✅ Instala todas las dependencias necesarias
2. 🧪 Ejecuta pruebas automáticas
3. 🌐 Inicia la aplicación web
4. 📊 Genera reporte de pruebas HTML

### Acceso
- **URL Local**: http://localhost:8501
- **Navegador**: Cualquier navegador moderno

## Estructura de Datos

### Formato Requerido
```
proyecto/
└── data/
    ├── 2025-03-19-11-00-00/
    │   ├── Scene Capture - SUB1 - S1 - T1 - CC - OK/
    │   │   ├── ...-PpgHrv-....csv
    │   │   ├── ...-ProcessedMocap-....csv
    │   │   └── ...-ProcessedPpg-....csv
    │   └── Scene Capture - SUB1 - S2 - T2 - SC - OK/
    │       └── ...
    └── 2025-03-20-14-30-00/
        └── ...
```

### Metadatos Extraídos
- **Sujeto**: SUB1, SUB2, etc.
- **Sesión**: S1, S2, S3, etc.
- **Tiempo**: T1, T2, etc.
- **Tipo de Captura**: CC (Ciclo Cardíaco), SC (Sin Ciclo)
- **Resultado**: OK, BAD
- **Fecha y Hora**: Formato YYYY-MM-DD-HH-MM-SS

## Flujo de Trabajo

### 1. Selección de Directorio
- Usuario selecciona directorio raíz del proyecto
- Sistema valida automáticamente la estructura
- Se detectan directorios válidos para procesar

### 2. Procesamiento
- Conversión de CSV a XLSX con metadatos
- Fusión por tipo de dato biométrico
- Progreso visible en tiempo real
- Guardado en histórico

### 3. Resultados
- Métricas de procesamiento
- Gráficos interactivos
- Dashboard histórico
- Archivos procesados disponibles

## Funcionalidades Avanzadas

### Gestión del Histórico
- Almacenamiento automático de resultados
- Visualización de tendencias temporales
- Limpieza de datos históricos
- Análisis de eficiencia del sistema

### Visualización de Datos
- Gráficos interactivos con Plotly
- Distribución por tipo de dato
- Análisis por sujeto y sesión
- Comparativas temporales

### Sistema de Pruebas
- Cobertura completa de funcionalidades
- Validación de casos límite
- Reportes HTML detallados
- Pruebas automáticas al inicio

## Mejoras Recientes

### Interfaz de Usuario
- ✅ Eliminación de botón "Validar Directorios" redundante
- ✅ Mensajes unificados y claros
- ✅ Progreso visible en dashboard principal
- ✅ Organización mejorada de componentes

### Funcionalidad
- ✅ Validación automática de directorios
- ✅ Manejo mejorado de estados de sesión
- ✅ Sistema de histórico robusto
- ✅ Gráficos interactivos mejorados

### Pruebas y Documentación
- ✅ Cobertura completa de nuevas funcionalidades
- ✅ Pruebas de casos límite
- ✅ Documentación actualizada
- ✅ Manuales de usuario y técnico

### Estructura del Proyecto
- ✅ Reorganización profesional en carpetas
- ✅ Código fuente en `src/`
- ✅ Documentación en `docs/`
- ✅ Scripts de utilidad en `scripts/`
- ✅ `run_app.py` en raíz para comodidad

## Dependencias

### Principales
- `streamlit>=1.28.0`: Interfaz web
- `pandas>=2.0.0`: Manipulación de datos
- `openpyxl>=3.1.0`: Procesamiento de Excel
- `plotly>=5.15.0`: Gráficos interactivos

### Desarrollo
- `pytest>=7.4.0`: Framework de pruebas
- `pytest-html>=4.1.0`: Reportes HTML
- `streamlit-extras>=0.3.0`: Componentes adicionales

## Solución de Problemas

### Problemas Comunes
- **Estructura de directorios**: Verifica formato YYYY-MM-DD-HH-MM-SS
- **Carpeta 'data'**: Asegúrate de seleccionar el directorio correcto
- **Archivos CSV**: Verifica integridad y formato
- **Permisos**: Comprueba permisos de lectura/escritura

### Soporte
- **Manual de Usuario**: `docs/manuales/user_manual.md`
- **Manual Técnico**: `docs/manuales/tech_manual.md`
- **Reportes de Pruebas**: `test_reports/test_report.html`

## Contribución

Para contribuir al proyecto:
1. Ejecuta las pruebas: `pytest tests/`
2. Verifica la cobertura: `pytest --cov=src/data_processing tests/`
3. Actualiza la documentación según sea necesario
4. Mantén la estructura de pruebas existente

## Licencia

Este proyecto está diseñado para procesamiento de datos biométricos de manera eficiente y segura. Siempre verifica los resultados y mantén copias de seguridad de tus datos originales.

---

**Desarrollado con ❤️ para el procesamiento eficiente de datos biométricos**
