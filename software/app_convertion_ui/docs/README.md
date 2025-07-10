# Procesador de Datos Biométricos

Sistema avanzado para el procesamiento y análisis de datos biométricos almacenados en archivos CSV. La aplicación proporciona una interfaz web intuitiva para convertir, fusionar y visualizar datos de múltiples tipos biométricos.

## 🚀 Características Principales

### ✨ Procesamiento Global
- **Conversión automática**: CSV → XLSX con metadatos
- **Fusión inteligente**: Combina archivos por tipo de dato
- **Procesamiento unificado**: Una sola carpeta de salida para todos los datos
- **Metadatos automáticos**: Extracción y gestión de información contextual

### 📊 Visualización Avanzada
- **Dashboard interactivo**: Métricas en tiempo real
- **Gráficos dinámicos**: Análisis visual de datos
- **Histórico completo**: Seguimiento de procesamientos anteriores
- **Filtros inteligentes**: Búsqueda y análisis específico

### ⚙️ Configuración Flexible
- **Rutas configurables**: Datos en carpeta externa (recomendado) o personalizada
- **Configuración simple**: Archivo config.py centralizado
- **Validación automática**: Verificación de estructura de datos
- **Manejo de errores**: Sistema robusto de detección y reporte

## 📋 Requisitos

- **Python**: 3.8 o superior
- **Navegador**: Moderno (Chrome, Firefox, Safari, Edge)
- **Memoria**: Mínimo 4GB RAM
- **Almacenamiento**: Suficiente para datos de entrada y salida

## 🛠️ Instalación

### Instalación Automática (Recomendado)

```bash
# 1. Navega al directorio del proyecto
cd app_convertion_ui

# 2. Ejecuta el script de inicio
python run_app.py
```

El sistema automáticamente:
- ✅ Instala todas las dependencias necesarias
- 🧪 Ejecuta pruebas de integridad
- 🌐 Inicia la aplicación web
- 📊 Genera reporte de pruebas

### Instalación Manual

```bash
# Instalar dependencias
pip install -r requirements.txt

# Ejecutar pruebas
python -m pytest tests/

# Iniciar aplicación
streamlit run src/app.py
```

## 📁 Configuración de Datos

### Estructura de Datos Requerida

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

> **Nota:** La carpeta `/data` debe estar fuera de `app_convertion_ui` o en la ubicación que configures en `config.py`. Ya no se recomienda ni se soporta una carpeta `/data` interna dentro del proyecto.

### Configuración de Rutas

#### Opción 1: Carpeta Externa (Recomendado)
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

## 🎯 Uso Rápido

### 1. Preparar Datos
Organiza tus archivos CSV en carpetas con formato:
```
Scene Capture - [SUJETO] - [SESION] - [TIEMPO] - [TIPO] - [RESULTADO]
```

### 2. Configurar Ruta
Edita `config.py` o usa el configurador interactivo:
```bash
python setup_data_path.py
```

### 3. Ejecutar Procesamiento
1. Abre la aplicación: `http://localhost:8501`
2. Selecciona el directorio de datos
3. Haz clic en "🚀 Procesar Datos"
4. Observa el progreso en tiempo real

### 4. Revisar Resultados
Los archivos procesados se guardan en:
```
/processed_data/
├── staging_xls/         # Archivos XLSX individuales
└── merged/              # Archivos fusionados por tipo
    ├── PpgHrv.csv
    ├── ProcessedMocap.csv
    ├── ProcessedPpg.csv
    ├── RawMocap.csv
    └── RawPpg.csv
```

## 📊 Tipos de Datos Soportados

| Tipo de Dato       | Descripción          | Formato de Salida |
| ------------------ | -------------------- | ----------------- |
| **PpgHrv**         | Frecuencia cardíaca  | CSV fusionado     |
| **ProcessedMocap** | Movimiento procesado | CSV fusionado     |
| **ProcessedPpg**   | PPG procesado        | CSV fusionado     |
| **RawMocap**       | Movimiento crudo     | CSV fusionado     |
| **RawPpg**         | PPG crudo            | CSV fusionado     |

## 🔧 Características Técnicas

### Arquitectura del Sistema
- **Frontend**: Streamlit 1.28.0+
- **Backend**: Python 3.8+
- **Procesamiento**: Pandas 2.0.0+
- **Visualización**: Plotly 5.15.0+
- **Pruebas**: Pytest 7.4.0+

### Flujo de Procesamiento
1. **Validación**: Verifica estructura de directorios
2. **Detección**: Identifica archivos CSV válidos
3. **Conversión**: Transforma CSV a XLSX con metadatos
4. **Fusión Global**: Combina todos los archivos por tipo
5. **Almacenamiento**: Guarda en estructura unificada

### Metadatos Extraídos
- **Sujeto**: SUB1, SUB2, SUB3, etc.
- **Sesión**: S1, S2, S3, etc.
- **Tiempo**: T1, T2, etc.
- **Tipo**: CC (Ciclo Cardíaco), SC (Sin Ciclo)
- **Resultado**: OK, BAD
- **Fecha/Hora**: Automática (fecha actual)

## 📈 Visualización y Análisis

### Dashboard Principal
- **Métricas en tiempo real**: Estadísticas del procesamiento
- **Gráficos interactivos**: Análisis visual de datos
- **Histórico de procesamiento**: Resultados anteriores
- **Progreso detallado**: Estado actual del procesamiento

### Pestañas de Análisis
1. **📊 Resumen**: Vista general de métricas
2. **📈 Tendencias**: Análisis temporal
3. **📋 Detalles**: Información específica por archivo

### Funcionalidades Avanzadas
- **Filtros inteligentes**: Búsqueda por tipo, sujeto, sesión
- **Comparativas**: Análisis entre diferentes procesamientos
- **Exportación**: Descarga de resultados y gráficos
- **Histórico completo**: Seguimiento de todas las ejecuciones

## 🧪 Sistema de Pruebas

### Ejecutar Pruebas
```bash
# Todas las pruebas
python -m pytest tests/

# Pruebas unitarias
python -m pytest tests/unit/

# Pruebas funcionales
python -m pytest tests/functional/

# Con reporte HTML
python -m pytest --html=test_reports/test_report.html
```

### Cobertura de Pruebas
- **Pruebas unitarias**: Funciones individuales
- **Pruebas funcionales**: Flujos completos
- **Pruebas de integración**: Componentes del sistema
- **Pruebas de rendimiento**: Optimización

## 🔍 Solución de Problemas

### Problemas Comunes

#### ❌ "No se encontraron directorios válidos"
**Solución**:
1. Verifica formato: `Scene Capture - SUB1 - S1 - T1 - CC - OK`
2. Confirma que existan archivos CSV dentro de las carpetas
3. Revisa la configuración en `config.py`

#### ❌ "Error de configuración de ruta"
**Solución**:
1. Edita `config.py` con la ruta correcta
2. Usa el configurador: `python setup_data_path.py`
3. Verifica permisos de acceso a la carpeta

#### ❌ "Error en procesamiento global"
**Solución**:
1. Verifica integridad de archivos CSV
2. Confirma nombres de archivo con tipos válidos
3. Revisa logs para identificar archivos específicos

### Logs y Debugging
- **Logs en tiempo real**: Se muestran en la aplicación
- **Niveles**: INFO, WARNING, ERROR, DEBUG
- **Ubicación**: Consola del navegador (F12) y terminal

## 📚 Documentación

### Manuales Disponibles
- **[Manual de Usuario](user_manual.md)**: Guía completa para usuarios
- **[Manual Técnico](tech_manual.md)**: Documentación para desarrolladores

### Estructura del Proyecto
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
│   ├── README.md                # Este archivo
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

## 🤝 Contribución

### Desarrollo
1. Fork del repositorio
2. Crea una rama para tu feature
3. Implementa cambios con pruebas
4. Ejecuta todas las pruebas
5. Envía pull request

### Reporte de Bugs
1. Verifica que no sea un problema de configuración
2. Revisa los logs de error
3. Proporciona información del sistema
4. Incluye pasos para reproducir

## 📄 Licencia

Este proyecto está bajo licencia MIT. Ver archivo LICENSE para más detalles.

## 🆘 Soporte

### Contacto
- **Documentación**: Revisa los manuales en `/docs`
- **Issues**: Reporta problemas en el repositorio
- **Pruebas**: Ejecuta `python -m pytest tests/` para verificar integridad

### Recursos Adicionales
- **Streamlit**: [Documentación oficial](https://docs.streamlit.io/)
- **Pandas**: [Guía de usuario](https://pandas.pydata.org/docs/)
- **Plotly**: [Referencia de gráficos](https://plotly.com/python/)

---

**¡Disfruta procesando tus datos biométricos de manera eficiente y profesional! 🚀**
