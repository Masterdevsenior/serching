# 📊 Análisis ICC - Aplicación de Fiabilidad de Datos

## 🎯 Descripción

Esta aplicación analiza la **confiabilidad** de datos de captura de movimiento mediante el cálculo de la **Correlación Intraclase (ICC)**. Proporciona una interfaz web moderna y fácil de usar para identificar variables con alta consistencia entre repeticiones.

## 🏗️ Arquitectura del Proyecto

El proyecto está organizado siguiendo una **arquitectura en capas** (Clean Architecture):

```
app_fiabilidad_ui/
├── 📁 data_layer/           # Capa de Datos
│   ├── __init__.py
│   └── data_loader.py       # Carga y validación de datos
├── 📁 domain_layer/         # Capa de Dominio
│   ├── __init__.py
│   └── icc_analyzer.py      # Lógica de negocio ICC
├── 📁 application_layer/    # Capa de Aplicación
│   ├── __init__.py
│   └── icc_service.py       # Servicios y coordinación
├── 📁 presentation_layer/   # Capa de Presentación
│   ├── __init__.py
│   └── streamlit_app.py     # Interfaz Streamlit
├── 📄 app.py               # Punto de entrada
├── 📄 requirements.txt     # Dependencias
└── 📄 README.md           # Documentación
```

### 🔧 Responsabilidades de cada capa:

#### **Capa de Datos** (`data_layer/`)

- ✅ Carga de archivos CSV
- ✅ Validación de estructura de datos
- ✅ Identificación de columnas numéricas
- ✅ Manejo de rutas de archivos

#### **Capa de Dominio** (`domain_layer/`)

- ✅ Lógica de cálculo ICC
- ✅ Preparación de datos para análisis
- ✅ Validación de completitud de datos
- ✅ Filtrado de variables de alto ICC

#### **Capa de Aplicación** (`application_layer/`)

- ✅ Coordinación entre capas
- ✅ Orquestación del análisis completo
- ✅ Manejo de errores y logging
- ✅ Exportación de resultados

#### **Capa de Presentación** (`presentation_layer/`)

- ✅ Interfaz web con Streamlit
- ✅ Visualizaciones interactivas
- ✅ Configuración de parámetros
- ✅ Exportación de datos

## 🚀 Instalación y Uso

### 1. Instalar dependencias

```bash
pip install -r requirements.txt
```

### 2. Configurar PostgreSQL (Opcional pero Recomendado)

```bash
# Crear archivo .env con configuración
python utils/setup_postgresql.py --create-env

# Probar conexión
python utils/setup_postgresql.py
```

### 3. Ejecutar la aplicación

```bash
streamlit run app.py
```

### 4. Abrir en el navegador

La aplicación se abrirá automáticamente en `http://localhost:8501`

## 📋 Funcionalidades

### 🎯 Análisis ICC

- **Carga automática** de archivos CSV con datos de mocap
- **Validación** de estructura de datos requerida
- **Análisis ICC** para todas las variables numéricas
- **Filtrado** de variables con alta confiabilidad (ICC > 0.90)

### 📊 Visualizaciones

- **Gráficos de barras** para variables de alto ICC
- **Histogramas** de distribución de valores ICC
- **Métricas** en tiempo real
- **Tablas interactivas** con filtros
- **Descripciones de variables** integradas en el dashboard

### 💾 Exportación

- **Descarga de resultados** en formato CSV
- **Archivos separados** para variables de alto ICC
- **Estadísticas completas** del análisis

## 📁 Estructura de Datos Requerida

### Archivo de Datos Principal

El archivo CSV debe contener las siguientes columnas:

| Columna               | Descripción                    | Tipo         |
| --------------------- | ------------------------------ | ------------ |
| `Sujeto`              | Identificador del participante | Texto/Número |
| `Sesion`              | Número de sesión               | Número       |
| `Tiempo`              | Número de repetición/tiempo    | Número       |
| Variables adicionales | Variables numéricas a analizar | Número       |

### Archivo de Descripciones de Variables (Opcional)

Para enriquecer el dashboard con descripciones de variables, puedes proporcionar un archivo adicional o conectar directamente a PostgreSQL:

#### Base de Datos PostgreSQL (Recomendado):

- **Base de datos**: `bd_tesla_suit`
- **Esquema**: `teslasuit`
- **Tabla**: `processedmocap_metadata`
- **Columnas**: `column_name`, `meaning_en`, `translation_es`, `description`

#### Formato CSV:

```csv
variable,descripcion
Variable_01,Ángulo de flexión de rodilla derecha (grados)
Variable_02,Ángulo de extensión de rodilla derecha (grados)
```

#### Formato SQLite:

Tabla `variable_descriptions` con columnas:

- `variable`: Nombre de la variable
- `descripcion`: Descripción de la variable
- `categoria`: Categoría (opcional)
- `unidad`: Unidad de medida (opcional)

#### Formato Excel:

Hoja con columnas `variable` y `descripcion`

### 📄 Ejemplo de estructura:

```csv
Sujeto,Sesion,Tiempo,Variable1,Variable2,Variable3
1,1,1,10.5,20.3,15.7
1,1,2,10.8,20.1,15.9
2,1,1,12.1,22.4,17.2
2,1,2,12.3,22.6,17.1
```

## 🎛️ Configuración

### Parámetros configurables:

- **Umbral de ICC**: Valor mínimo para considerar alta confiabilidad (por defecto: 0.90)
- **Archivo de datos**: Selección entre archivo predeterminado o subida personalizada
- **Filtros**: Rango de ICC y número mínimo de sujetos para exploración

## 📈 Interpretación de Resultados

### Valores ICC:

- **ICC > 0.90**: Excelente confiabilidad
- **ICC 0.75-0.90**: Buena confiabilidad
- **ICC 0.50-0.75**: Confiabilidad moderada
- **ICC < 0.50**: Baja confiabilidad

### Métricas importantes:

- **Variables de alto ICC**: Número de variables que superan el umbral
- **Porcentaje de alto ICC**: Proporción de variables con alta confiabilidad
- **Correlación promedio**: Valor medio de ICC de todas las variables
- **Sujetos completos**: Número de participantes con ambas repeticiones

## 🔧 Tecnologías Utilizadas

- **Streamlit**: Interfaz web interactiva
- **Pandas**: Manipulación y análisis de datos
- **Plotly**: Visualizaciones interactivas
- **NumPy**: Cálculos numéricos
- **Scipy**: Funciones estadísticas

## 📝 Logs y Debugging

La aplicación incluye logging detallado para facilitar el debugging:

```python
import logging
logging.basicConfig(level=logging.INFO)
```

Los logs muestran:

- ✅ Progreso del análisis
- ⚠️ Advertencias sobre datos
- ❌ Errores y excepciones
- 📊 Estadísticas de procesamiento

## 🚨 Solución de Problemas

### Error: "No se pudo encontrar el archivo"

- Verifica que el archivo CSV esté en la ubicación correcta
- Usa la opción "Subir archivo personalizado" si es necesario

### Error: "Columnas faltantes"

- Asegúrate de que el CSV tenga las columnas: `Sujeto`, `Sesion`, `Tiempo`
- Verifica que los nombres de columnas coincidan exactamente

### Error: "Datos insuficientes"

- Se necesitan al menos 2 sujetos con ambas repeticiones
- Verifica que los datos tengan la estructura correcta

## 🤝 Contribuciones

Para contribuir al proyecto:

1. Fork el repositorio
2. Crea una rama para tu feature (`git checkout -b feature/nueva-funcionalidad`)
3. Commit tus cambios (`git commit -am 'Agrega nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/nueva-funcionalidad`)
5. Crea un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.

## 📞 Contacto

Para preguntas o soporte, contacta al equipo de desarrollo.

---

**¡Disfruta analizando la fiabilidad de tus datos de captura de movimiento! 🎯**
