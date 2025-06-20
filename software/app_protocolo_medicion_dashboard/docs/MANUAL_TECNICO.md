# Manual Técnico - Aplicación de Protocolo de Medición

## Índice

1. [Arquitectura del Sistema](#arquitectura-del-sistema)
2. [Configuración del Entorno](#configuración-del-entorno)
3. [Base de Datos](#base-de-datos)
4. [API y Endpoints](#api-y-endpoints)
5. [Sistema de Pruebas](#sistema-de-pruebas)
6. [Despliegue](#despliegue)
7. [Mantenimiento](#mantenimiento)
8. [Troubleshooting](#troubleshooting)

## Arquitectura del Sistema

### Tecnologías Utilizadas

- **Backend**: Python 3.8+, Flask 2.3+
- **Base de Datos**: PostgreSQL 12+
- **Frontend**: HTML5, CSS3, JavaScript ES6+
- **Frameworks**: Bootstrap 5, Chart.js 3.9+
- **Librerías**: Pandas 1.5+, psycopg2-binary 2.9+
- **Testing**: unittest, coverage, pytest

### Estructura del Proyecto

```
app_protocolo_medicion_dashboard/
├── src/
│   └── app/
│       └── main/
│           ├── app/
│           │   ├── app.py              # Aplicación principal Flask
│           │   ├── models/
│           │   │   └── db.py           # Modelos y conexión DB
│           │   ├── templates/          # Plantillas HTML
│           │   └── tests/              # Pruebas unitarias
│           ├── test_runner.py          # Ejecutor de pruebas
│           └── test_history_viewer.py  # Visor de historial
├── docs/                               # Documentación
├── scripts/                            # Scripts de ejecución
├── config/                             # Configuración
├── tests/                              # Pruebas externas
└── data/                               # Datos de ejemplo
```

### Patrón de Diseño

- **MVC (Model-View-Controller)**: Separación clara de responsabilidades
- **Repository Pattern**: Abstracción de acceso a datos
- **Factory Pattern**: Creación de conexiones de base de datos
- **Observer Pattern**: Sistema de pruebas automatizado

## Configuración del Entorno

### Variables de Entorno

Crear archivo `.env` en la raíz del proyecto:

```env
# Configuración de Base de Datos
DB_HOST=localhost
DB_PORT=5432
DB_NAME=protocolo_medicion
DB_USER=tu_usuario
DB_PASSWORD=tu_password

# Configuración de la Aplicación
FLASK_ENV=development
FLASK_DEBUG=True
SECRET_KEY=tu_clave_secreta_aqui

# Configuración de Logging
LOG_LEVEL=INFO
LOG_FILE=app.log

# Configuración de Pruebas
TEST_DB_NAME=test_protocolo_medicion
TEST_REPORTS_DIR=test_reports
TEST_EXECUTION_INTERVAL=21600  # 6 horas en segundos
```

### Instalación de Dependencias

```bash
# Crear entorno virtual
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# Instalar dependencias
pip install -r requirements.txt

# Verificar instalación
python -c "import flask, pandas, psycopg2; print('Dependencias instaladas correctamente')"
```

### Configuración de PostgreSQL

```sql
-- Crear base de datos
CREATE DATABASE protocolo_medicion;

-- Crear usuario (opcional)
CREATE USER app_user WITH PASSWORD 'app_password';
GRANT ALL PRIVILEGES ON DATABASE protocolo_medicion TO app_user;
```

## Base de Datos

### Esquema de la Tabla Principal

```sql
CREATE TABLE protocolo_medicion (
    id SERIAL PRIMARY KEY,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    nombre_completo VARCHAR(255) NOT NULL,
    edad INTEGER CHECK (edad >= 0 AND edad <= 150),
    genero VARCHAR(50) CHECK (genero IN ('Masculino', 'Femenino', 'Otro')),
    peso_corporal DECIMAL(5,2) CHECK (peso_corporal >= 0),
    altura DECIMAL(5,2) CHECK (altura >= 0),
    longitud_brazo DECIMAL(5,2) CHECK (longitud_brazo >= 0),
    longitud_pierna DECIMAL(5,2) CHECK (longitud_pierna >= 0),
    longitud_torso DECIMAL(5,2) CHECK (longitud_torso >= 0),
    antecedentes_lesiones BOOLEAN DEFAULT FALSE,
    limitaciones_movilidad BOOLEAN DEFAULT FALSE,
    experiencia_levantamiento BOOLEAN DEFAULT FALSE,
    sin_contraindicaciones BOOLEAN DEFAULT FALSE,
    ajuste_traje BOOLEAN DEFAULT FALSE,
    calibracion_sincronizada BOOLEAN DEFAULT FALSE,
    sensores_posicion BOOLEAN DEFAULT FALSE,
    tipo_ejercicio VARCHAR(100) NOT NULL,
    nivel_riesgo VARCHAR(50) CHECK (nivel_riesgo IN ('Bajo', 'Medio', 'Alto')),
    peso_carga DECIMAL(6,2) CHECK (peso_carga >= 0),
    duracion_minutos INTEGER CHECK (duracion_minutos >= 0),
    num_repeticiones INTEGER CHECK (num_repeticiones >= 0),
    forma_objeto VARCHAR(255),
    velocidad_movimiento VARCHAR(100),
    tipo_superficie VARCHAR(100)
);
```

### Índices Recomendados

```sql
-- Índices para optimizar consultas
CREATE INDEX idx_fecha_hora ON protocolo_medicion(fecha_hora);
CREATE INDEX idx_genero ON protocolo_medicion(genero);
CREATE INDEX idx_tipo_ejercicio ON protocolo_medicion(tipo_ejercicio);
CREATE INDEX idx_nivel_riesgo ON protocolo_medicion(nivel_riesgo);
```

### Funciones de Base de Datos

```python
# Conexión a la base de datos
def get_db_connection():
    """Establece conexión con PostgreSQL"""
    return psycopg2.connect(
        host=os.getenv('DB_HOST'),
        port=os.getenv('DB_PORT'),
        database=os.getenv('DB_NAME'),
        user=os.getenv('DB_USER'),
        password=os.getenv('DB_PASSWORD')
    )

# Operaciones CRUD
def crear_tabla():
    """Crea la tabla si no existe"""

def guardar_datos(data):
    """Inserta un nuevo registro"""

def obtener_registros():
    """Obtiene todos los registros"""

def eliminar_registro(id):
    """Elimina un registro por ID"""
```

## API y Endpoints

### Endpoints Principales

#### Dashboard

```http
GET /dashboard
GET /api/dashboard/stats
GET /api/dashboard/chart-data
GET /api/dashboard/recent-registros
```

#### Registros

```http
GET /registros
POST /guardar
DELETE /eliminar/<id>
GET /exportar-excel
```

#### Sistema de Pruebas

```http
GET /run-tests
GET /test-status
GET /test-history
```

### Formato de Respuestas

```json
{
    "success": true,
    "data": {...},
    "message": "Operación exitosa"
}
```

### Manejo de Errores

```python
@app.errorhandler(404)
def not_found(error):
    return jsonify({'error': 'Recurso no encontrado'}), 404

@app.errorhandler(500)
def internal_error(error):
    return jsonify({'error': 'Error interno del servidor'}), 500
```

## Sistema de Pruebas

### Arquitectura del Sistema de Pruebas

#### Componentes Principales
```
Sistema de Pruebas/
├── test_runner.py          # Ejecutor principal
├── test_history_viewer.py  # Visor web
├── tests/                  # Suite de pruebas
│   ├── test_app.py         # Pruebas de aplicación
│   ├── test_integration.py # Pruebas de integración
│   └── test_models.py      # Pruebas de modelos
├── test_reports/           # Reportes HTML
└── test_history.json       # Historial de ejecuciones
```

#### Flujo de Ejecución
1. **Inicio**: Las pruebas se ejecutan automáticamente al arrancar la app
2. **Programación**: Ejecución cada 6 horas en segundo plano
3. **Manual**: Endpoint para ejecución bajo demanda
4. **Reporte**: Generación automática de reportes HTML
5. **Historial**: Almacenamiento de resultados en JSON

### Tipos de Pruebas

#### 1. Pruebas Unitarias (`test_app.py`)
```python
class TestApp(unittest.TestCase):
    """Pruebas unitarias de la aplicación Flask"""
    
    def setUp(self):
        """Configuración inicial"""
        self.app = app.test_client()
        self.app.testing = True
    
    def test_index_route(self):
        """Prueba la ruta principal"""
        response = self.app.get('/')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'formulario', response.data.lower())
    
    def test_dashboard_route(self):
        """Prueba la ruta del dashboard"""
        response = self.app.get('/dashboard')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'dashboard', response.data.lower())
```

**Cobertura**: 15 pruebas que verifican rutas, APIs y funcionalidades básicas.

#### 2. Pruebas de Integración (`test_integration.py`)
```python
class TestIntegration(unittest.TestCase):
    """Pruebas de integración entre componentes"""
    
    def test_complete_workflow(self):
        """Prueba flujo completo: guardar -> consultar -> eliminar"""
        # 1. Guardar datos
        test_data = create_test_data()
        response = self.app.post('/guardar', data=test_data)
        self.assertEqual(response.status_code, 200)
        
        # 2. Verificar en registros
        response = self.app.get('/registros')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'Test User', response.data)
        
        # 3. Exportar a Excel
        response = self.app.get('/exportar-excel')
        self.assertEqual(response.status_code, 200)
```

**Cobertura**: 8 pruebas que verifican flujos completos de usuario.

#### 3. Pruebas de Modelos (`test_models.py`)
```python
class TestModels(unittest.TestCase):
    """Pruebas de modelos de base de datos"""
    
    def test_database_connection(self):
        """Prueba conexión a base de datos"""
        try:
            conn = get_db_connection()
            self.assertIsNotNone(conn)
            conn.close()
        except Exception as e:
            self.fail(f"Error de conexión: {e}")
    
    def test_table_creation(self):
        """Prueba creación de tabla"""
        result = crear_tabla()
        self.assertTrue(result)
```

**Cobertura**: 16 pruebas que verifican operaciones de base de datos.

#### 4. Pruebas Específicas del Dashboard (`tests/test_dashboard.py`)
```python
class TestDashboard(unittest.TestCase):
    """Pruebas específicas para el dashboard"""
    
    def test_dashboard_statistics_calculation(self):
        """Prueba cálculo correcto de estadísticas"""
        # Agregar datos de prueba
        guardar_datos(self.test_data)
        guardar_datos(self.test_data_2)
        
        # Verificar cálculos
        response = self.app.get('/api/dashboard/stats')
        data = json.loads(response.data)
        
        self.assertEqual(data['total_registros'], 2)
        self.assertEqual(data['promedio_edad'], 27.5)
        self.assertEqual(data['promedio_peso'], 65.25)
```

**Cobertura**: 12 pruebas que verifican estadísticas y gráficos del dashboard.

### Ejecutor de Pruebas (`test_runner.py`)

#### Clase TestRunner
```python
class TestRunner:
    """Ejecutor principal de pruebas"""
    
    def __init__(self):
        self.test_suites = [
            'tests.test_app',
            'tests.test_integration',
            'tests.test_models'
        ]
        self.results = {}
        self.start_time = None
        self.end_time = None
    
    def run_all_tests(self):
        """Ejecuta todas las suites de pruebas"""
        self.start_time = datetime.now()
        
        for suite_name in self.test_suites:
            self.results[suite_name] = self.run_test_suite(suite_name)
        
        self.end_time = datetime.now()
        self.save_results()
        self.generate_report()
    
    def run_test_suite(self, suite_name):
        """Ejecuta una suite específica de pruebas"""
        try:
            # Configurar test suite
            loader = unittest.TestLoader()
            suite = loader.loadTestsFromName(suite_name)
            
            # Ejecutar pruebas
            runner = unittest.TextTestRunner(verbosity=2)
            result = runner.run(suite)
            
            # Procesar resultados
            return {
                'total': result.testsRun,
                'passed': result.testsRun - len(result.failures) - len(result.errors),
                'failed': len(result.failures),
                'errors': len(result.errors),
                'success_rate': self.calculate_success_rate(result)
            }
        except Exception as e:
            logger.error(f"Error ejecutando suite {suite_name}: {e}")
            return {
                'total': 0,
                'passed': 0,
                'failed': 0,
                'errors': 1,
                'success_rate': 0
            }
```

#### Generación de Reportes
```python
def generate_report(self):
    """Genera reporte HTML con los resultados"""
    report_data = {
        'timestamp': self.end_time.isoformat(),
        'duration': str(self.end_time - self.start_time),
        'total_tests': sum(suite['total'] for suite in self.results.values()),
        'passed_tests': sum(suite['passed'] for suite in self.results.values()),
        'failed_tests': sum(suite['failed'] for suite in self.results.values()),
        'success_rate': self.calculate_success_rate(),
        'results': self.results
    }
    
    # Generar HTML
    html_content = self.create_html_report(report_data)
    
    # Guardar archivo
    filename = f"test_reports/report_{self.end_time.strftime('%Y%m%d_%H%M%S')}.html"
    with open(filename, 'w', encoding='utf-8') as f:
        f.write(html_content)
```

#### Almacenamiento de Historial
```python
def save_results(self):
    """Guarda los resultados en el historial JSON"""
    history_entry = {
        'timestamp': self.end_time.isoformat(),
        'duration': str(self.end_time - self.start_time),
        'results': self.results,
        'success_rate': self.calculate_success_rate()
    }
    
    # Cargar historial existente
    history = []
    if os.path.exists('test_history.json'):
        with open('test_history.json', 'r', encoding='utf-8') as f:
            history = json.load(f)
    
    # Agregar nueva entrada
    history.append(history_entry)
    
    # Guardar historial actualizado
    with open('test_history.json', 'w', encoding='utf-8') as f:
        json.dump(history, f, indent=2, ensure_ascii=False)
```

### Visor de Historial (`test_history_viewer.py`)

#### Aplicación Flask Separada
```python
app = Flask(__name__)

@app.route('/')
def index():
    """Vista principal del visor de pruebas"""
    return render_template('test_history.html')

@app.route('/api/test-history')
def api_test_history():
    """API para obtener datos del historial"""
    try:
        with open('test_history.json', 'r', encoding='utf-8') as f:
            history = json.load(f)
        return jsonify(history)
    except FileNotFoundError:
        return jsonify([])

@app.route('/api/test-status')
def api_test_status():
    """API para obtener estado actual de las pruebas"""
    try:
        with open('test_history.json', 'r', encoding='utf-8') as f:
            history = json.load(f)
        
        if history:
            latest = history[-1]
            return jsonify({
                'success': True,
                'last_execution': latest['timestamp'],
                'last_success_rate': latest['success_rate'],
                'total_executions': len(history)
            })
        
        return jsonify({
            'success': True,
            'message': 'No hay historial disponible'
        })
    except Exception as e:
        return jsonify({
            'success': False,
            'message': f'Error: {str(e)}'
        })
```

#### Generación de Gráficos
```python
def generate_trend_charts(history):
    """Genera gráficos de matplotlib para las tendencias"""
    if not history:
        return None
    
    # Preparar datos
    dates = [entry['timestamp'][:10] for entry in history]
    success_rates = [entry['success_rate'] for entry in history]
    
    # Crear gráfico
    plt.figure(figsize=(12, 6))
    plt.plot(dates, success_rates, marker='o', linewidth=2, markersize=6)
    plt.title('Tendencia de Tasa de Éxito de Pruebas', fontsize=16, fontweight='bold')
    plt.xlabel('Fecha', fontsize=12)
    plt.ylabel('Tasa de Éxito (%)', fontsize=12)
    plt.grid(True, alpha=0.3)
    plt.xticks(rotation=45)
    plt.tight_layout()
    
    # Guardar gráfico
    chart_path = 'static/test_trends.png'
    plt.savefig(chart_path, dpi=300, bbox_inches='tight')
    plt.close()
    
    return chart_path
```

### Configuración y Uso

#### Ejecución Manual
```bash
# Ejecutar todas las pruebas
cd src/app/main
python -m pytest tests/ -v

# Ejecutar con cobertura
coverage run -m pytest tests/
coverage report
coverage html

# Ejecutar pruebas específicas
python -m pytest tests/test_app.py::test_guardar_datos
```

#### Ejecución Automática
```python
# Las pruebas se ejecutan automáticamente al iniciar la app
if __name__ == '__main__':
    # Ejecutar pruebas iniciales
    run_automated_tests()
    
    # Iniciar programador de pruebas
    start_test_scheduler()
```

#### Programación de Pruebas
```python
def start_test_scheduler():
    """Inicia el programador de pruebas automáticas"""
    def scheduler():
        while True:
            try:
                # Ejecutar pruebas cada 6 horas
                time.sleep(6 * 60 * 60)  # 6 horas
                run_automated_tests()
            except Exception as e:
                logger.error(f"Error en el programador de pruebas: {e}")
                time.sleep(60)  # Esperar 1 minuto antes de reintentar
    
    # Iniciar thread en segundo plano
    test_thread = threading.Thread(target=scheduler, daemon=True)
    test_thread.start()
    logger.info("Programador de pruebas automáticas iniciado")
```

### Métricas y Monitoreo

#### Métricas Clave
- **Tasa de éxito**: Porcentaje de pruebas que pasan
- **Tiempo de ejecución**: Duración total de las pruebas
- **Cobertura de código**: Porcentaje de código probado
- **Frecuencia de fallos**: Identificación de problemas recurrentes

#### Alertas Automáticas
```python
def check_test_health():
    """Verifica la salud del sistema de pruebas"""
    try:
        with open('test_history.json', 'r') as f:
            history = json.load(f)
        
        if history:
            latest = history[-1]
            if latest['success_rate'] < 80:
                logger.warning(f"Tasa de éxito baja: {latest['success_rate']}%")
                # Enviar alerta por email o Slack
                
    except Exception as e:
        logger.error(f"Error al verificar salud de pruebas: {e}")
```

## Despliegue

### Entorno de Producción

```bash
# Configuración de producción
export FLASK_ENV=production
export FLASK_DEBUG=False
export SECRET_KEY=clave_secreta_produccion

# Instalar dependencias de producción
pip install -r requirements.txt

# Configurar servidor web (Gunicorn)
pip install gunicorn
gunicorn -w 4 -b 0.0.0.0:5000 app:app
```

### Configuración de Nginx

```nginx
server {
    listen 80;
    server_name tu-dominio.com;

    location / {
        proxy_pass http://127.0.0.1:5000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

### Docker (Opcional)

```dockerfile
FROM python:3.9-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .
EXPOSE 5000

CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app"]
```

## Mantenimiento

### Logs y Monitoreo

```python
# Configuración de logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('app.log'),
        logging.StreamHandler()
    ]
)
```

### Backup de Base de Datos

```bash
# Backup automático
pg_dump protocolo_medicion > backup_$(date +%Y%m%d_%H%M%S).sql

# Restaurar backup
psql protocolo_medicion < backup_20231201_120000.sql
```

### Limpieza de Datos

```sql
-- Eliminar registros antiguos (más de 2 años)
DELETE FROM protocolo_medicion
WHERE fecha_hora < CURRENT_DATE - INTERVAL '2 years';

-- Vacuum para optimizar espacio
VACUUM ANALYZE protocolo_medicion;
```

### Limpieza de Reportes de Pruebas

```python
def cleanup_old_reports():
    """Elimina reportes antiguos (más de 30 días)"""
    import glob
    from datetime import datetime, timedelta
    
    cutoff_date = datetime.now() - timedelta(days=30)
    
    for report_file in glob.glob('test_reports/report_*.html'):
        file_date_str = report_file.split('_')[1].split('.')[0]
        file_date = datetime.strptime(file_date_str, '%Y%m%d')
        
        if file_date < cutoff_date:
            os.remove(report_file)
            logger.info(f"Eliminado reporte antiguo: {report_file}")
```

## Troubleshooting

### Problemas Comunes

#### 1. Error de Conexión a Base de Datos

```bash
# Verificar conexión
psql -h localhost -U tu_usuario -d protocolo_medicion

# Verificar variables de entorno
echo $DB_HOST $DB_NAME $DB_USER
```

#### 2. Error de Permisos

```bash
# Verificar permisos de archivos
ls -la src/app/main/app/

# Corregir permisos
chmod 755 src/app/main/app/
chmod 644 src/app/main/app/*.py
```

#### 3. Error de Dependencias

```bash
# Verificar instalación
pip list | grep -E "(flask|pandas|psycopg2)"

# Reinstalar dependencias
pip uninstall -r requirements.txt
pip install -r requirements.txt
```

#### 4. Error de Memoria

```python
# Optimizar consultas grandes
def obtener_registros_paginados(offset=0, limit=1000):
    """Obtener registros con paginación"""
    query = "SELECT * FROM protocolo_medicion ORDER BY fecha_hora DESC LIMIT %s OFFSET %s"
    return execute_query(query, (limit, offset))
```

#### 5. Pruebas Fallan Inesperadamente

```bash
# Verificar configuración de base de datos
python -c "from models.db import get_db_connection; conn = get_db_connection(); print('DB OK')"

# Verificar dependencias
pip list | grep pytest
```

#### 6. Reportes No Se Generan

```bash
# Verificar permisos de escritura
ls -la test_reports/

# Verificar espacio en disco
df -h .
```

### Monitoreo de Rendimiento

```python
# Middleware para medir tiempo de respuesta
@app.before_request
def start_timer():
    g.start = time.time()

@app.after_request
def log_request(response):
    if hasattr(g, 'start'):
        diff = time.time() - g.start
        logger.info(f"Request to {request.endpoint} took {diff:.2f}s")
    return response
```

### Métricas de Salud

```python
@app.route('/health')
def health_check():
    """Endpoint para verificar salud del sistema"""
    try:
        # Verificar base de datos
        conn = get_db_connection()
        conn.close()
        
        # Verificar sistema de pruebas
        test_status = check_test_health()
        
        return jsonify({
            'status': 'healthy',
            'database': 'connected',
            'tests': test_status,
            'timestamp': datetime.now().isoformat()
        })
    except Exception as e:
        return jsonify({
            'status': 'unhealthy',
            'error': str(e)
        }), 500
```

---

**Nota**: Este manual técnico debe actualizarse cuando se realicen cambios significativos en la arquitectura o configuración del sistema.
