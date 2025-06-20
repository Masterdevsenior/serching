# Aplicación de Protocolo de Medición - Dashboard

## Descripción

Esta aplicación web permite registrar y gestionar protocolos de medición para ejercicios físicos, incluyendo un dashboard interactivo que proporciona visualizaciones y estadísticas de los datos recopilados.

## Características Principales

### 📊 Dashboard Interactivo

- **Estadísticas en tiempo real**: Total de registros, promedios de edad y peso
- **Gráficos dinámicos**: Distribución por género, tipos de ejercicio, nivel de riesgo
- **Registros recientes**: Tabla con los últimos 10 registros
- **Actualización automática**: Los datos se actualizan cada 5 minutos

### 📝 Formulario de Registro

- **Datos físicos básicos**: Nombre, edad, género, peso, altura
- **Medidas corporales**: Longitud de brazos, piernas y torso
- **Historial médico**: Antecedentes de lesiones y limitaciones
- **Configuración de ejercicio**: Tipo, nivel de riesgo, carga, duración

### 📋 Gestión de Registros

- **Vista de todos los registros**: Tabla con DataTables
- **Filtros y búsqueda**: Búsqueda avanzada en los datos
- **Exportación a Excel**: Descarga de datos en formato Excel
- **Eliminación de registros**: Gestión completa de datos

## Tecnologías Utilizadas

- **Backend**: Python Flask
- **Base de Datos**: PostgreSQL
- **Frontend**: HTML5, CSS3, JavaScript
- **Frameworks**: Bootstrap 5, Chart.js
- **Librerías**: Pandas, DataTables
- **Iconos**: Font Awesome

## Instalación y Configuración

### Requisitos Previos

- Python 3.8 o superior
- PostgreSQL
- pip (gestor de paquetes de Python)

### Pasos de Instalación

1. **Clonar el repositorio**

   ```bash
   git clone <url-del-repositorio>
   cd app_protocolo_medicion_dashboard
   ```

2. **Crear entorno virtual**

   ```bash
   python -m venv venv
   source venv/bin/activate  # En Windows: venv\Scripts\activate
   ```

3. **Instalar dependencias**

   ```bash
   pip install -r requirements.txt
   ```

4. **Configurar base de datos**

   - Crear archivo `.env` basado en `config/config.example`
   - Configurar credenciales de PostgreSQL

5. **Ejecutar la aplicación**

   ```bash
   python scripts/run_app.py
   ```

6. **Acceder a la aplicación**
   - URL: `http://localhost:5000`
   - Dashboard: `http://localhost:5000/dashboard`

## Estructura del Proyecto

```
app_protocolo_medicion_dashboard/
├── src/
│   └── app/
│       └── main/
│           ├── app/
│           │   ├── app.py              # Aplicación principal Flask
│           │   ├── models/
│           │   │   └── db.py           # Modelos de base de datos
│           │   └── templates/
│           │       ├── form.html       # Formulario de registro
│           │       ├── dashboard.html  # Dashboard interactivo
│           │       ├── registros.html  # Vista de registros
│           │       └── ...
│           └── requirements.txt
├── docs/                               # Documentación
├── scripts/                            # Scripts de ejecución
├── config/                             # Configuración
├── tests/                              # Pruebas externas
├── requirements.txt
└── README.md
```

## Funcionalidades del Dashboard

### 📈 Gráficos Disponibles

1. **Registros por Fecha**

   - Línea temporal de registros en los últimos 30 días
   - Visualización de tendencias de actividad

2. **Distribución por Género**

   - Gráfico de dona con porcentajes por género
   - Análisis demográfico de usuarios

3. **Tipos de Ejercicio**

   - Gráfico de barras con ejercicios más populares
   - Estadísticas de preferencias de entrenamiento

4. **Nivel de Riesgo**
   - Distribución de niveles de riesgo (Bajo, Medio, Alto)
   - Análisis de seguridad en ejercicios

### 📊 Métricas Principales

- **Total de Registros**: Número total de protocolos registrados
- **Últimos 7 días**: Actividad reciente del sistema
- **Edad Promedio**: Demografía de usuarios
- **Peso Promedio**: Estadísticas físicas generales

### 🔄 Actualización Automática

- Los datos se actualizan automáticamente cada 5 minutos
- Gráficos interactivos con Chart.js
- Diseño responsive para dispositivos móviles

## API Endpoints

### Dashboard

- `GET /dashboard` - Vista principal del dashboard
- `GET /api/dashboard/stats` - Estadísticas generales
- `GET /api/dashboard/chart-data` - Datos para gráficos
- `GET /api/dashboard/recent-registros` - Registros recientes

### Registros

- `GET /registros` - Vista de todos los registros
- `POST /guardar` - Guardar nuevo registro
- `DELETE /eliminar/<id>` - Eliminar registro
- `GET /exportar-excel` - Exportar a Excel

## Características Técnicas

### Base de Datos

- **Tabla principal**: `protocolo_medicion`
- **Campos**: 25 campos incluyendo datos físicos, médicos y de ejercicio
- **Validaciones**: Restricciones de integridad y rangos válidos

### Seguridad

- Validación de datos en frontend y backend
- Sanitización de entradas
- Manejo de errores robusto

### Rendimiento

- Consultas optimizadas con pandas
- Caché de datos para gráficos
- Lazy loading de componentes

## Uso del Dashboard

1. **Acceso**: Navegar a `/dashboard` desde cualquier página
2. **Navegación**: Usar la barra de navegación superior
3. **Interacción**: Hacer clic en gráficos para más detalles
4. **Actualización**: Los datos se actualizan automáticamente

## Mantenimiento

### Logs

- Logs detallados en consola
- Registro de errores y operaciones
- Monitoreo de rendimiento

### Backup

- Exportación regular a Excel
- Respaldo de base de datos recomendado
- Versionado de datos

## Contribución

1. Fork del repositorio
2. Crear rama para nueva funcionalidad
3. Implementar cambios
4. Ejecutar pruebas
5. Crear Pull Request

## Licencia

Este proyecto está bajo la licencia MIT. Ver archivo LICENSE para más detalles.

## Soporte

Para soporte técnico o preguntas:

- Revisar la documentación técnica
- Consultar los manuales de usuario
- Abrir un issue en el repositorio

---

**Desarrollado para la gestión eficiente de protocolos de medición**
