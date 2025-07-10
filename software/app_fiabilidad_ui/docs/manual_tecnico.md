# Manual Técnico

## Descripción General

La aplicación ICC es un sistema multi-capa para el análisis de fiabilidad de datos de captura de movimiento, con visualización interactiva en Streamlit y exportación de resultados.

## Estructura del Proyecto

```
software/
  app_fiabilidad_ui/           # Código fuente principal
    data_layer/                # Capa de acceso a datos
    domain_layer/              # Lógica de negocio (ICC)
    application_layer/         # Servicios y coordinación
    presentation_layer/        # Interfaz Streamlit
    tests/                     # Pruebas unitarias y funcionales
    docs/                      # Documentación
    data/ICC/                  # Exportación de resultados
    requirements.txt           # Dependencias
    start_app.bat              # Script de arranque
```

## Principales Componentes

- **data_layer**: Carga de datos, acceso a descripciones (PostgreSQL, CSV, etc.)
- **domain_layer**: Cálculo de ICC, filtrado y estadísticas
- **application_layer**: Orquestación, integración de servicios
- **presentation_layer**: Interfaz Streamlit, visualización y exportación

## Configuración

- Variables de entorno en `.env` para conexión a PostgreSQL
- Dependencias en `requirements.txt`

## Ejecución

1. Instala dependencias y ejecuta la app con `start_app.bat`
2. Accede a la interfaz en `http://localhost:8501`

## Exportación de Resultados

- Los resultados se guardan automáticamente en `./data/ICC/`
- Incluyen la columna de descripción para cada variable

## Pruebas

- Ejecuta `pytest tests/` para validar la lógica del sistema
- Las pruebas cubren carga de datos, descripciones, ICC, integración y exportación

## Mantenimiento

- Para agregar nuevas fuentes de descripciones, implementa en `data_layer`
- Para nuevos análisis, extiende `domain_layer` y `application_layer`

## Contacto

Para soporte técnico, contactar al equipo de desarrollo.
