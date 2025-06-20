# Scripts del Proyecto - Protocolo de Medición

Este documento describe los scripts disponibles en la raíz del proyecto para facilitar el uso de la aplicación.

## 📋 Scripts Disponibles

### 1. `run_simple.py` - Ejecutar la Aplicación

**Propósito**: Iniciar la aplicación Flask del Protocolo de Medición

**Uso**:

```bash
python run_simple.py
```

**Características**:

- ✅ Configuración automática del entorno
- ✅ Verificación de archivos necesarios
- ✅ Variables de entorno preconfiguradas
- ✅ Servidor en modo desarrollo con debug
- ✅ Accesible en `http://localhost:5000`

**Salida esperada**:

```
Iniciando Aplicación del Protocolo de Medición
==================================================
Directorio de trabajo: src/app/main
Python path: /usr/bin/python3
Archivo app.py encontrado
Variables de entorno configuradas:
   FLASK_APP = app.app
   FLASK_ENV = development
   FLASK_DEBUG = 1

Iniciando servidor Flask...
   Presiona Ctrl+C para detener el servidor
--------------------------------------------------
```

### 2. `run_tests_safe.py` - Pruebas Seguras (Recomendado)

**Propósito**: Ejecutar todas las pruebas sin afectar la base de datos principal

**Uso**:

```bash
python run_tests_safe.py
```

**Características**:

- ✅ Base de datos separada (`formulario_protocolo_tesla_test`)
- ✅ No afecta datos de producción
- ✅ Configuración automática del entorno de prueba
- ✅ Reportes HTML y historial JSON
- ✅ Verificación de archivos de prueba

**Salida esperada**:

```
Ejecutando Pruebas de Forma Segura
==================================================
Este script ejecuta las pruebas usando una base de datos separada
para no afectar los datos de producción.

Directorio de trabajo: src/app/main/app
Python path: /usr/bin/python3
✓ test_runner.py
✓ test_config.py
✓ tests/test_models.py
✓ tests/test_app.py
✓ tests/test_integration.py

Archivos de prueba verificados
--------------------------------------------------
Iniciando ejecución de pruebas...
   Las pruebas usarán una base de datos separada
   Presiona Ctrl+C para detener la ejecución
--------------------------------------------------
```

### 3. `run_tests_advanced.py` - Pruebas Avanzadas

**Propósito**: Ejecutar diferentes tipos de pruebas con opciones avanzadas

**Uso**:

```bash
# Suite completa de pruebas
python run_tests_advanced.py --type full

# Solo pruebas de modelos
python run_tests_advanced.py --type models

# Solo pruebas de aplicación
python run_tests_advanced.py --type app

# Solo pruebas de integración
python run_tests_advanced.py --type integration

# Pruebas con cobertura de código
python run_tests_advanced.py --type coverage

# Ver resultados de pruebas previas
python run_tests_advanced.py --show-results

# Ejecutar con salida detallada
python run_tests_advanced.py --type full --verbose
```

**Características**:

- ✅ Múltiples tipos de pruebas
- ✅ Cobertura de código
- ✅ Visualización de resultados previos
- ✅ Salida detallada opcional
- ✅ Verificación de entorno

## 🚀 Flujo de Trabajo Recomendado

### Para Desarrollo Diario:

1. **Iniciar la aplicación**:

   ```bash
   python run_simple.py
   ```

2. **Ejecutar pruebas después de cambios**:

   ```bash
   python run_tests_safe.py
   ```

3. **Ver resultados detallados**:
   ```bash
   python run_tests_advanced.py --show-results
   ```

### Para Análisis de Código:

1. **Ejecutar pruebas con cobertura**:

   ```bash
   python run_tests_advanced.py --type coverage
   ```

2. **Revisar reporte de cobertura**:
   - Abrir `src/app/main/app/htmlcov/index.html` en el navegador

### Para Debugging:

1. **Ejecutar pruebas específicas**:

   ```bash
   python run_tests_advanced.py --type models --verbose
   ```

2. **Revisar reportes HTML**:
   - Abrir `src/app/main/app/test_reports/` para ver reportes detallados

## 📁 Archivos Generados

Los scripts generan los siguientes archivos:

### `run_tests_safe.py` y `run_tests_advanced.py`:

- `test_history.json` - Historial de ejecuciones de pruebas
- `test_reports/` - Carpeta con reportes HTML de pruebas
- `htmlcov/` - Reporte de cobertura de código (solo con `--type coverage`)

### `run_simple.py`:

- No genera archivos adicionales
- Solo inicia el servidor Flask

## ⚠️ Notas Importantes

1. **Ejecutar desde la raíz**: Todos los scripts deben ejecutarse desde la raíz del proyecto
2. **Base de datos**: `run_tests_safe.py` usa una base de datos separada para no afectar datos de producción
3. **Dependencias**: Asegúrate de tener instaladas todas las dependencias de `requirements.txt`
4. **Permisos**: Los scripts requieren permisos de escritura para generar reportes

## 🔧 Solución de Problemas

### Error "No module named 'app'":

```bash
# Asegúrate de estar en la raíz del proyecto
pwd  # Debe mostrar la ruta del proyecto
python run_simple.py
```

### Error de base de datos:

```bash
# Usa el script seguro que no afecta la base principal
python run_tests_safe.py
```

### Error de dependencias:

```bash
# Instala las dependencias
pip install -r requirements.txt
```

### Error de permisos:

```bash
# En sistemas Unix/Linux
chmod +x run_simple.py run_tests_safe.py run_tests_advanced.py
```
