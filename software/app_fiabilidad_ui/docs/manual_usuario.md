# Manual de Usuario

## Introducción

Esta aplicación permite analizar la fiabilidad de datos de captura de movimiento mediante el cálculo de la Correlación Intraclase (ICC) y visualizar los resultados de forma interactiva.

## Requisitos

- Tener Python 3.8+ instalado
- Tener acceso a los datos de entrada (CSV)
- Tener configurado el acceso a la base de datos PostgreSQL si se usan descripciones desde BD

## Arranque de la aplicación

1. Ejecuta el script `start_app.bat` (doble clic o desde terminal)
2. Se abrirá la app en tu navegador en `http://localhost:8501`

## Uso de la aplicación

1. **Selecciona el archivo de datos** en la barra lateral (usa el archivo por defecto o sube uno propio)
2. **Selecciona la fuente de descripciones** (PostgreSQL, CSV, SQLite, Excel o sin descripciones)
3. **Configura el umbral de ICC** para filtrar variables de alta fiabilidad
4. Haz clic en **Ejecutar Análisis ICC**
5. Explora los resultados en las pestañas:
   - Variables de Alto ICC
   - Todas las Variables
   - Estadísticas Generales
   - Explorar Todos los Resultados
   - Exportar Datos
6. Los archivos de resultados se guardan automáticamente en `./data/ICC/`

## Exportación de resultados

- Los archivos `resultados_icc_completo.csv` y `resultados_icc_alto.csv` incluyen la descripción de cada variable y se guardan en `./data/ICC/`.

## Soporte

Para dudas o problemas, contacta al equipo de desarrollo o revisa el manual técnico en la carpeta `/docs`.
