# Manual de Usuario - Aplicación de Protocolo de Medición

## Índice

1. [Introducción](#introducción)
2. [Acceso a la Aplicación](#acceso-a-la-aplicación)
3. [Formulario de Registro](#formulario-de-registro)
4. [Dashboard](#dashboard)
5. [Gestión de Registros](#gestión-de-registros)
6. [Exportación de Datos](#exportación-de-datos)
7. [Sistema de Pruebas](#sistema-de-pruebas)
8. [Solución de Problemas](#solución-de-problemas)

## Introducción

La Aplicación de Protocolo de Medición es una herramienta web diseñada para registrar y gestionar información relacionada con protocolos de medición para ejercicios físicos. Esta aplicación permite a los usuarios capturar datos detallados sobre las características físicas de los participantes, sus antecedentes médicos y las configuraciones específicas de los ejercicios.

### Características Principales

- **Formulario de Registro Completo**: Captura de datos físicos, médicos y de ejercicio
- **Dashboard Interactivo**: Visualización de estadísticas y tendencias
- **Gestión de Registros**: Consulta, filtrado y eliminación de datos
- **Exportación de Datos**: Descarga de información en formato Excel
- **Sistema de Pruebas Automatizado**: Verificación continua de la funcionalidad

## Acceso a la Aplicación

### Requisitos del Sistema

- Navegador web moderno (Chrome, Firefox, Safari, Edge)
- Conexión a internet estable
- Acceso al servidor de la aplicación

### URL de Acceso

- **Aplicación Principal**: `http://localhost:5000`
- **Dashboard**: `http://localhost:5000/dashboard`
- **Registros**: `http://localhost:5000/registros`
- **Visor de Pruebas**: `http://localhost:5001`

## Formulario de Registro

### Sección 1: Información Personal

1. **Nombre Completo**: Ingrese el nombre completo del participante
2. **Edad**: Especifique la edad en años
3. **Género**: Seleccione entre Masculino, Femenino u Otro
4. **Peso Corporal**: Ingrese el peso en kilogramos
5. **Altura**: Especifique la altura en centímetros

### Sección 2: Medidas Corporales

1. **Longitud del Brazo**: Medida desde el hombro hasta la muñeca
2. **Longitud de la Pierna**: Medida desde la cadera hasta el tobillo
3. **Longitud del Torso**: Medida desde los hombros hasta la cadera

### Sección 3: Antecedentes Médicos

1. **Antecedentes de Lesiones**: Marque si el participante tiene historial de lesiones
2. **Limitaciones de Movilidad**: Indique si existen restricciones de movimiento
3. **Experiencia en Levantamiento**: Especifique el nivel de experiencia

### Sección 4: Configuración del Ejercicio

1. **Tipo de Ejercicio**: Seleccione el tipo de actividad física
2. **Nivel de Riesgo**: Elija entre Bajo, Medio o Alto
3. **Peso de Carga**: Especifique el peso en kilogramos
4. **Duración**: Indique la duración en minutos
5. **Número de Repeticiones**: Especifique la cantidad de repeticiones

### Sección 5: Configuración del Equipo

1. **Forma del Objeto**: Describa la forma del objeto a levantar
2. **Velocidad del Movimiento**: Especifique la velocidad requerida
3. **Tipo de Superficie**: Indique el tipo de superficie de trabajo

### Guardado de Datos

- Haga clic en el botón "Guardar Datos" para almacenar la información
- El sistema validará automáticamente todos los campos
- Se mostrará un mensaje de confirmación al guardar exitosamente

## Dashboard

### Acceso al Dashboard

- Navegue a la pestaña "Dashboard" en la barra de navegación
- O acceda directamente a `http://localhost:5000/dashboard`

### Elementos del Dashboard

#### 1. Tarjetas de Estadísticas

- **Total de Registros**: Número total de protocolos registrados
- **Promedio de Edad**: Edad promedio de todos los participantes
- **Promedio de Peso**: Peso promedio en kilogramos
- **Registros Últimos 7 Días**: Actividad reciente del sistema

#### 2. Gráficos Interactivos

- **Registros por Fecha**: Línea temporal de registros en los últimos 30 días
- **Distribución por Género**: Gráfico de dona con porcentajes por género
- **Tipos de Ejercicio**: Gráfico de barras con ejercicios más populares
- **Nivel de Riesgo**: Distribución de niveles de riesgo

#### 3. Tabla de Registros Recientes

- Muestra los últimos 10 registros ingresados
- Incluye información básica: ID, fecha, nombre, edad, género, tipo de ejercicio
- Los datos se actualizan automáticamente cada 5 minutos

### Interacción con Gráficos

- **Hover**: Pase el cursor sobre los gráficos para ver detalles
- **Clic**: Algunos gráficos permiten interacción adicional
- **Zoom**: Los gráficos se adaptan automáticamente al tamaño de pantalla

## Gestión de Registros

### Vista de Todos los Registros

1. Acceda a la pestaña "Registros" en la navegación
2. Se mostrará una tabla con todos los registros del sistema
3. Utilice las funciones de búsqueda y filtrado para encontrar registros específicos

### Funciones de la Tabla

- **Búsqueda**: Ingrese texto en el campo de búsqueda para filtrar registros
- **Ordenamiento**: Haga clic en los encabezados de columna para ordenar
- **Paginación**: Navegue entre páginas de resultados
- **Mostrar/Ocultar Columnas**: Personalice las columnas visibles

### Eliminación de Registros

1. Localice el registro que desea eliminar
2. Haga clic en el botón "Eliminar" correspondiente
3. Confirme la eliminación en el diálogo emergente
4. El registro será eliminado permanentemente

### Consulta por Fecha

1. Acceda a "Consulta por Fecha" desde la navegación
2. Seleccione una fecha del calendario
3. Se mostrarán todos los registros de esa fecha específica

## Exportación de Datos

### Exportación a Excel

1. Acceda a la vista de registros
2. Haga clic en el botón "Exportar a Excel"
3. El archivo se descargará automáticamente
4. El nombre del archivo incluirá la fecha y hora de exportación

### Formato del Archivo Excel

- **Columnas**: Todas las variables del formulario
- **Formato**: Datos organizados en filas y columnas
- **Codificación**: UTF-8 para caracteres especiales
- **Fórmulas**: No incluye fórmulas, solo datos

## Sistema de Pruebas

### ¿Qué es el Sistema de Pruebas?

El sistema de pruebas es una funcionalidad automática que verifica continuamente que todas las características de la aplicación funcionen correctamente. Esto garantiza la calidad y confiabilidad del sistema.

### Características del Sistema de Pruebas

#### 🔄 Ejecución Automática
- **Al inicio**: Las pruebas se ejecutan automáticamente cuando se inicia la aplicación
- **Programada**: Se ejecutan cada 6 horas para verificar la funcionalidad
- **Manual**: Puede ejecutar pruebas manualmente desde la interfaz web

#### 📊 Tipos de Pruebas Realizadas
- **Pruebas del Formulario**: Verifican que el guardado de datos funcione correctamente
- **Pruebas del Dashboard**: Validan que las estadísticas y gráficos se calculen bien
- **Pruebas de Base de Datos**: Comprueban que las operaciones de datos sean correctas
- **Pruebas de Exportación**: Verifican que la exportación a Excel funcione
- **Pruebas de Rendimiento**: Aseguran que la aplicación responda rápidamente

#### 📈 Reportes Automáticos
- **Formato HTML**: Se generan reportes imprimibles con resultados detallados
- **Historial**: Se mantiene un registro de todas las ejecuciones de pruebas
- **Tendencias**: Se visualizan gráficos de rendimiento a lo largo del tiempo

### Acceso al Sistema de Pruebas

#### Visor Web de Pruebas
1. Acceda a `http://localhost:5001` en su navegador
2. Verá un dashboard con el estado actual de las pruebas
3. Puede consultar el historial de ejecuciones anteriores
4. Los gráficos muestran tendencias de rendimiento

#### Funciones Disponibles
- **Estado Actual**: Vea si las pruebas están pasando o fallando
- **Historial**: Consulte resultados de ejecuciones anteriores
- **Tendencias**: Analice el rendimiento a lo largo del tiempo
- **Detalles**: Vea información específica de cada prueba

### Interpretación de Resultados

#### ✅ Pruebas Exitosas
- **Verde**: Todas las pruebas pasaron correctamente
- **Significado**: La aplicación funciona perfectamente
- **Acción**: No se requiere intervención

#### ⚠️ Pruebas con Advertencias
- **Amarillo**: Algunas pruebas fallaron pero no son críticas
- **Significado**: Hay problemas menores que no afectan la funcionalidad principal
- **Acción**: Revisar los logs para identificar problemas

#### ❌ Pruebas Fallidas
- **Rojo**: Pruebas críticas fallaron
- **Significado**: Hay problemas que afectan la funcionalidad
- **Acción**: Contactar al equipo técnico inmediatamente

### Métricas Importantes

#### Tasa de Éxito
- **Objetivo**: Mantener por encima del 90%
- **Significado**: Porcentaje de pruebas que pasan correctamente
- **Monitoreo**: Se actualiza automáticamente

#### Tiempo de Ejecución
- **Objetivo**: Menos de 30 segundos para todas las pruebas
- **Significado**: Velocidad de verificación del sistema
- **Monitoreo**: Se registra en cada ejecución

#### Cobertura de Funcionalidades
- **Objetivo**: 100% de las funciones principales
- **Significado**: Todas las características están siendo probadas
- **Monitoreo**: Se actualiza con cada nueva funcionalidad

### Beneficios para el Usuario

#### Confiabilidad
- **Garantía de Calidad**: Las pruebas verifican que todo funcione correctamente
- **Detección Temprana**: Los problemas se identifican antes de afectar a los usuarios
- **Estabilidad**: La aplicación es más estable y confiable

#### Transparencia
- **Visibilidad**: Puede ver el estado de la aplicación en tiempo real
- **Historial**: Acceso a información histórica de rendimiento
- **Reportes**: Documentación detallada de la calidad del sistema

#### Mantenimiento
- **Prevención**: Los problemas se detectan y corrigen proactivamente
- **Optimización**: El rendimiento se monitorea y mejora continuamente
- **Actualizaciones**: Las nuevas funcionalidades se prueban antes del lanzamiento

## Solución de Problemas

### Problemas Comunes

#### 1. Error de Conexión

**Síntoma**: No se puede acceder a la aplicación
**Solución**:

- Verifique que el servidor esté ejecutándose
- Compruebe la URL de acceso
- Revise la conexión a internet

#### 2. Error al Guardar Datos

**Síntoma**: Los datos no se guardan correctamente
**Solución**:

- Verifique que todos los campos obligatorios estén completos
- Revise el formato de los datos ingresados
- Intente guardar nuevamente

#### 3. Gráficos No Se Muestran

**Síntoma**: Los gráficos del dashboard no aparecen
**Solución**:

- Actualice la página del navegador
- Verifique la conexión a internet
- Limpie la caché del navegador

#### 4. Error en Exportación

**Síntoma**: No se puede exportar a Excel
**Solución**:

- Verifique que haya registros para exportar
- Compruebe el espacio disponible en disco
- Intente la exportación nuevamente

#### 5. Pruebas Fallando

**Síntoma**: El visor de pruebas muestra errores
**Solución**:

- Verifique que la aplicación principal esté funcionando
- Revise los logs del sistema
- Contacte al equipo técnico si persiste

### Verificación del Estado del Sistema

#### Dashboard de Estado
1. Acceda al visor de pruebas en `http://localhost:5001`
2. Revise el estado general del sistema
3. Consulte el historial de ejecuciones
4. Analice las tendencias de rendimiento

#### Logs del Sistema
- Los logs contienen información detallada sobre errores
- Se pueden consultar para diagnóstico técnico
- Proporcionan contexto sobre problemas específicos

### Contacto de Soporte

Si experimenta problemas que no se resuelven con las soluciones anteriores:

- Documente el problema con capturas de pantalla
- Anote los pasos que llevaron al error
- Incluya información del estado de las pruebas
- Contacte al equipo de soporte técnico

---

**Nota**: Este manual se actualiza regularmente. Para la versión más reciente, consulte la documentación oficial del proyecto.
