# Sistema de Análisis de Fiabilidad ICC

Sistema simple y funcional para análisis de fiabilidad usando el coeficiente de correlación intraclase (ICC) en datos de captura de movimiento.

## 🚀 Inicio Rápido

### Ejecutar la Aplicación

```bash
# Inicio automático (instala dependencias + ejecuta aplicación)
python start.py

# Con archivo específico
python start.py [archivo_csv]

# Solo la aplicación (si las dependencias ya están instaladas)
python run_analysis.py [archivo_csv]
```

## 📁 Estructura del Proyecto

```
app_fiabilidad/
├── src/                    # Código fuente principal
│   └── icc.py            # Analizador ICC principal
├── output/                # Resultados del análisis
├── requirements.txt       # Dependencias
├── start.py              # Script de inicio automático
├── run_analysis.py       # Script principal
└── README.md
```

## 🔧 Instalación Manual

```bash
# 1. Instalar dependencias
pip install -r requirements.txt

# 2. Ejecutar análisis
python run_analysis.py [archivo_csv]
```

## 📊 Uso

### Análisis Automático

```bash
python start.py
```

### Con Archivo Personalizado

```bash
python start.py mi_archivo.csv
```

### Solo la Aplicación

```bash
python run_analysis.py [archivo_csv]
```

## 🔍 Características

- ✅ **Inicio automático** con instalación de dependencias
- ✅ **Análisis ICC robusto** con manejo de errores
- ✅ **Estructura limpia** del proyecto
- ✅ **Resultados en consola** con estadísticas detalladas
- ✅ **Archivos de salida** en formato CSV
- ✅ **Manejo de rutas** automático

## 🛠️ Dependencias

- Python 3.7+
- pandas
- scipy
- pingouin
- mermaid-cli

## 📝 Logs

La aplicación muestra información detallada durante la ejecución:

- Instalación de dependencias
- Carga de datos
- Progreso del análisis
- Variables con ICC > 0.90
- Estadísticas generales
- Archivos guardados

## ⚠️ Solución de Problemas

### Error de Dependencias

```bash
pip install --upgrade pip
pip install -r requirements.txt
```

### Error de Archivo No Encontrado

```bash
# Verificar que el archivo existe en la ruta correcta
# Por defecto busca en: ../data/processed_data/merged/ProcessedMocap.csv
```

### Error de Permisos

```bash
# En Linux/Mac
chmod +x start.py
```

## 📞 Soporte

Para problemas o preguntas:

1. Verificar que el archivo CSV existe y tiene el formato correcto
2. Revisar logs de ejecución
3. Asegurar que las columnas requeridas estén presentes:
   - "Sujeto"
   - "Sesion"
   - "Tiempo"

## 📊 Formato de Datos

El archivo CSV debe contener:

- **Sujeto**: Identificador del sujeto
- **Sesion**: Número de sesión
- **Tiempo**: Número de repetición/tiempo
- **Variables numéricas**: Columnas con datos de movimiento

## 🎯 Resultados

La aplicación genera:

- **Consola**: Variables con ICC > 0.90 y estadísticas
- **output/resultados_icc_alto_0.90.csv**: Variables con ICC alto
- **output/resultados_icc_completo.csv**: Todos los resultados

---

**Desarrollado con ❤️ para análisis de fiabilidad en captura de movimiento**
