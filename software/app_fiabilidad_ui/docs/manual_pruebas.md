# Manual de Pruebas

## Objetivo

Este manual describe las pruebas unitarias, funcionales e integración implementadas para la aplicación ICC, así como instrucciones para su ejecución y criterios de éxito.

## Estructura de Pruebas

Las pruebas se encuentran en la carpeta `/tests` y cubren:

- **Carga de datos**
- **Carga de descripciones**
- **Cálculo de ICC**
- **Integración de servicios**
- **Exportación de resultados**

## Ejecución de Pruebas

1. Instala las dependencias:
   ```
   pip install -r requirements.txt
   pip install pytest
   ```
2. Ejecuta las pruebas desde la raíz del proyecto:
   ```
   pytest tests/
   ```

## Descripción de Pruebas

- `test_data_loader.py`: Verifica la carga y búsqueda de archivos de datos.
- `test_postgresql_descriptions.py`: Prueba la carga de descripciones desde PostgreSQL (mockeada).
- `test_icc_analyzer.py`: Valida el cálculo de ICC para variables.
- `test_icc_service.py`: Prueba el flujo completo de análisis ICC desde un CSV.
- `test_export.py`: Verifica que la exportación incluya la columna de descripción.
- `conftest.py`: Fixtures para pruebas.

## Criterios de Éxito

- Todas las pruebas deben pasar (`PASSED`) al ejecutar `pytest`.
- Los archivos exportados deben contener la columna de descripción.
- El sistema debe funcionar correctamente tras cambios, validado por las pruebas.

## Buenas Prácticas

- Agrega nuevas pruebas al modificar o extender la lógica.
- Usa mocks/dummies para evitar dependencias externas en pruebas unitarias.
- Ejecuta las pruebas antes de cada despliegue o actualización.

## Contacto

Para dudas sobre las pruebas, contactar al equipo de desarrollo.
