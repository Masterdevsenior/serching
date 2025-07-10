# Manual de Usuario - Sistema de Análisis ICC

## 📋 Descripción General

El Sistema de Análisis ICC es una herramienta diseñada para realizar análisis de fiabilidad usando el coeficiente de correlación intraclase (ICC) en datos de captura de movimiento. Este sistema permite evaluar la consistencia de las variables de movimiento entre diferentes repeticiones de mediciones.

## 🎯 Objetivo

El objetivo principal es identificar qué variables de movimiento muestran alta fiabilidad (ICC > 0.90), lo que indica que las mediciones son consistentes y confiables entre repeticiones.

## 🚀 Inicio Rápido

### Requisitos Previos

- Python 3.7 o superior instalado
- Acceso a los datos de captura de movimiento en formato CSV

### Ejecución Automática

```bash
python start.py
```

### Ejecución Manual

```bash
python run_analysis.py [archivo_csv]
```

## 📊 Formato de Datos Requerido

### Estructura del Archivo CSV

El archivo de datos debe contener las siguientes columnas obligatorias:

| Columna    | Descripción                          | Ejemplo          |
| ---------- | ------------------------------------ | ---------------- |
| **Sujeto** | Identificador único del participante | S001, S002, S003 |
| **Sesion** | Número de sesión de medición         | 1, 2, 3          |
| **Tiempo** | Número de repetición o tiempo        | 1, 2, 3          |

### Variables de Movimiento

Además de las columnas obligatorias, el archivo debe contener columnas numéricas con los datos de movimiento que se desean analizar.

### Ejemplo de Estructura

```csv
Sujeto,Sesion,Tiempo,Variable1,Variable2,Variable3
S001,1,1,0.123,0.456,0.789
S001,1,2,0.124,0.457,0.790
S002,1,1,0.125,0.458,0.791
S002,1,2,0.126,0.459,0.792
```

## 🔧 Instalación y Configuración

### Paso 1: Verificar Python

```bash
python --version
```

Debe mostrar Python 3.7 o superior.

### Paso 2: Ejecutar el Sistema

```bash
# Opción 1: Inicio automático (recomendado)
python start.py

# Opción 2: Solo la aplicación
python run_analysis.py
```

### Paso 3: Verificar Resultados

Los resultados se mostrarán en la consola y se guardarán en la carpeta `output/`.

## 📈 Interpretación de Resultados

### Variables con ICC Alto (> 0.90)

Estas variables muestran excelente fiabilidad entre repeticiones:

- **ICC > 0.90**: Fiabilidad excelente
- **ICC 0.75-0.90**: Fiabilidad buena
- **ICC < 0.75**: Fiabilidad pobre

### Estadísticas Generales

- **Total de variables analizadas**: Número total de variables en el archivo
- **Variables con ICC > 0.90**: Cantidad de variables con alta fiabilidad
- **Porcentaje de variables con ICC > 0.90**: Proporción de variables confiables
- **ICC promedio**: Correlación promedio de todas las variables
- **ICC mínimo/máximo**: Rango de valores de correlación

## 📁 Archivos de Salida

### Archivos Generados

1. **output/resultados_icc_alto_0.90.csv**: Variables con ICC > 0.90
2. **output/resultados_icc_completo.csv**: Todos los resultados del análisis

### Contenido de los Archivos

- **variable**: Nombre de la variable de movimiento
- **correlacion**: Valor del ICC calculado
- **sujetos**: Número de sujetos utilizados en el cálculo

## ⚠️ Solución de Problemas

### Error: "No se encontró el archivo"

**Problema**: El sistema no puede encontrar el archivo de datos.
**Solución**:

1. Verificar que el archivo existe en la ruta correcta
2. Por defecto busca en: `../data/processed_data/merged/ProcessedMocap.csv`
3. Especificar la ruta manualmente: `python start.py mi_archivo.csv`

### Error: "No se encontraron todas las columnas requeridas"

**Problema**: Faltan columnas obligatorias en el archivo CSV.
**Solución**:

1. Verificar que el archivo contenga las columnas: "Sujeto", "Sesion", "Tiempo"
2. Verificar que los nombres de las columnas coincidan exactamente
3. Revisar el formato del archivo CSV

### Error: "No se encontraron columnas numéricas válidas"

**Problema**: No hay variables numéricas para analizar.
**Solución**:

1. Verificar que existan columnas con datos numéricos
2. Asegurar que al menos el 50% de los valores sean numéricos
3. Revisar el formato de los datos

### Error: "Se necesitan al menos 2 sujetos"

**Problema**: Datos insuficientes para el análisis.
**Solución**:

1. Verificar que haya al menos 2 sujetos diferentes
2. Asegurar que cada sujeto tenga al menos 2 repeticiones
3. Revisar la calidad de los datos

## 📋 Checklist de Verificación

Antes de ejecutar el análisis, verificar:

- [ ] Python 3.7+ instalado
- [ ] Archivo CSV existe y es accesible
- [ ] Columnas obligatorias presentes: "Sujeto", "Sesion", "Tiempo"
- [ ] Variables numéricas disponibles
- [ ] Al menos 2 sujetos con 2 repeticiones cada uno
- [ ] Datos sin valores faltantes excesivos

## 🎯 Casos de Uso Típicos

### Caso 1: Análisis de Fiabilidad de Movimientos

1. Preparar archivo CSV con datos de captura de movimiento
2. Ejecutar: `python start.py`
3. Revisar variables con ICC > 0.90
4. Usar solo variables confiables para análisis posteriores

### Caso 2: Validación de Protocolo de Medición

1. Ejecutar análisis con datos de prueba
2. Verificar que las variables clave tengan ICC alto
3. Ajustar protocolo si es necesario
4. Re-ejecutar con datos finales

### Caso 3: Comparación de Condiciones

1. Ejecutar análisis para cada condición experimental
2. Comparar ICC entre condiciones
3. Identificar variables más estables
4. Documentar diferencias en fiabilidad

## 📞 Soporte Técnico

### Información Necesaria para Reportes

- Versión de Python utilizada
- Estructura del archivo CSV (columnas presentes)
- Mensaje de error completo
- Pasos para reproducir el problema

### Contacto

Para problemas técnicos o preguntas sobre el uso del sistema, proporcionar:

1. Descripción detallada del problema
2. Archivo de datos de ejemplo (si es posible)
3. Logs completos de ejecución

---

**Versión**: 1.0  
**Fecha**: 2024  
**Desarrollado para**: Análisis de fiabilidad en captura de movimiento
