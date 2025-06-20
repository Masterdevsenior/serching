# Manual de Usuario - Procesador de Datos Biométricos

## Índice

1. [Instalación y Configuración](#instalación-y-configuración)
2. [Primer Uso](#primer-uso)
3. [Interfaz de Usuario](#interfaz-de-usuario)
4. [Procesamiento de Datos](#procesamiento-de-datos)
5. [Visualización de Resultados](#visualización-de-resultados)
6. [Gestión del Histórico](#gestión-del-histórico)
7. [Solución de Problemas](#solución-de-problemas)

## Instalación y Configuración

### Requisitos Previos

- Python 3.8 o superior
- Navegador web moderno
- Acceso a internet (para descarga de dependencias)

### Instalación Automática

1. **Navega al directorio del proyecto**:

   ```bash
   cd app_convertion_ui
   ```

2. **Ejecuta el script de inicio**:

   ```bash
   python run_app.py
   ```

3. **El sistema automáticamente**:

   - ✅ Instala todas las dependencias necesarias
   - 🧪 Ejecuta pruebas de integridad
   - 🌐 Inicia la aplicación web
   - 📊 Genera reporte de pruebas

4. **Accede a la aplicación**:
   - Abre tu navegador
   - Ve a: `http://localhost:8501`

### Estructura de Archivos

```
app_convertion_ui/
├── run_app.py              # Script de inicio (ejecutar este)
├── requirements.txt        # Dependencias
├── src/                   # Código fuente
│   ├── app.py            # Interfaz principal
│   └── data_processing.py # Lógica de procesamiento
├── docs/manuales/        # Esta documentación
└── data/                # Tus datos (aquí o en otra ubicación)
```

## Primer Uso

### 1. Preparación de Datos

Asegúrate de que tus datos estén organizados correctamente:

```
tu_proyecto/
└── data/
    ├── 2025-03-19-11-00-00/
    │   ├── Scene Capture - SUB1 - S1 - T1 - CC - OK/
    │   │   ├── ...-PpgHrv-....csv
    │   │   ├── ...-ProcessedMocap-....csv
    │   │   └── ...-ProcessedPpg-....csv
    │   └── Scene Capture - SUB1 - S2 - T2 - SC - OK/
    │       └── ...
    └── 2025-03-20-14-30-00/
        └── ...
```

### 2. Selección de Directorio

1. **Abre la aplicación** en tu navegador
2. **En el panel lateral**, haz clic en "📁 Explorar"
3. **Selecciona** el directorio raíz de tu proyecto
4. **El sistema validará automáticamente** la estructura

### 3. Procesamiento Inicial

1. **Verifica** que aparezcan directorios válidos
2. **Haz clic** en "🚀 Procesar Datos"
3. **Observa** el progreso en tiempo real
4. **Espera** a que termine el procesamiento

## Interfaz de Usuario

### Panel Lateral (Configuración)

- **📁 Explorar**: Selecciona directorio del proyecto
- **📊 Ver Histórico**: Accede a resultados anteriores
- **🗑️ Limpiar Histórico**: Elimina datos históricos
- **ℹ️ Información**: Detalles del sistema

### Área Principal (Dashboard)

- **📈 Métricas en Tiempo Real**: Estadísticas del procesamiento
- **📊 Gráficos Interactivos**: Visualización de datos
- **📋 Histórico de Procesamiento**: Resultados anteriores
- **⚡ Progreso**: Estado actual del procesamiento

### Pestañas del Dashboard

1. **📊 Resumen**: Vista general de métricas
2. **📈 Tendencias**: Análisis temporal
3. **📋 Detalles**: Información específica por archivo

## Procesamiento de Datos

### Flujo Automático

1. **Validación**: El sistema verifica la estructura de directorios
2. **Detección**: Identifica archivos CSV válidos
3. **Conversión**: Transforma CSV a XLSX con metadatos
4. **Fusión**: Combina archivos por tipo de dato
5. **Almacenamiento**: Guarda resultados en histórico

### Metadatos Extraídos

- **Sujeto**: SUB1, SUB2, SUB3, etc.
- **Sesión**: S1, S2, S3, etc.
- **Tiempo**: T1, T2, etc.
- **Tipo**: CC (Ciclo Cardíaco), SC (Sin Ciclo)
- **Resultado**: OK, BAD
- **Fecha/Hora**: YYYY-MM-DD-HH-MM-SS

### Tipos de Datos Procesados

- **PpgHrv**: Datos de frecuencia cardíaca
- **ProcessedMocap**: Datos de movimiento procesados
- **ProcessedPpg**: Datos PPG procesados
- **RawMocap**: Datos de movimiento crudos
- **RawPpg**: Datos PPG crudos

## Visualización de Resultados

### Métricas Principales

- **📁 Directorios Procesados**: Total de carpetas válidas
- **📄 Archivos Convertidos**: CSV → XLSX exitosos
- **📊 Archivos Fusionados**: Combinaciones por tipo
- **⏱️ Tiempo Total**: Duración del procesamiento

### Gráficos Interactivos

- **Distribución por Tipo**: Proporción de cada tipo de dato
- **Análisis por Sujeto**: Comparativa entre sujetos
- **Tendencias Temporales**: Evolución en el tiempo
- **Eficiencia del Sistema**: Rendimiento del procesamiento

### Información Detallada

- **Lista de Archivos**: Todos los archivos procesados
- **Errores y Advertencias**: Problemas encontrados
- **Estadísticas por Sesión**: Análisis detallado
- **Comparativas**: Diferencias entre sesiones

## Gestión del Histórico

### Acceso al Histórico

1. **En el panel lateral**, haz clic en "📊 Ver Histórico"
2. **Explora** las diferentes pestañas:
   - **Resumen**: Vista general
   - **Tendencias**: Análisis temporal
   - **Detalles**: Información específica

### Funcionalidades del Histórico

- **📈 Gráficos de Tendencia**: Evolución temporal
- **📊 Comparativas**: Entre diferentes ejecuciones
- **📋 Lista Detallada**: Todos los archivos procesados
- **🔍 Filtros**: Búsqueda y filtrado de datos

### Limpieza del Histórico

1. **En el panel lateral**, haz clic en "🗑️ Limpiar Histórico"
2. **Confirma** la acción
3. **El sistema eliminará** todos los datos históricos

## Solución de Problemas

### Problemas Comunes

#### ❌ "No se encontraron directorios válidos"

**Causa**: Estructura de directorios incorrecta
**Solución**:

1. Verifica que tus carpetas tengan formato: `YYYY-MM-DD-HH-MM-SS`
2. Asegúrate de seleccionar el directorio correcto
3. Confirma que existan subcarpetas con archivos CSV

#### ❌ "Error al procesar archivos"

**Causa**: Archivos CSV corruptos o formato incorrecto
**Solución**:

1. Verifica la integridad de los archivos CSV
2. Asegúrate de que los archivos no estén abiertos en Excel
3. Comprueba que los nombres de archivo sean correctos

#### ❌ "La aplicación no inicia"

**Causa**: Dependencias faltantes o Python incorrecto
**Solución**:

1. Ejecuta: `python run_app.py`
2. Verifica que tengas Python 3.8+
3. Comprueba tu conexión a internet

#### ❌ "Progreso no se actualiza"

**Causa**: Problema temporal de interfaz
**Solución**:

1. Refresca la página del navegador
2. Verifica que no haya errores en la consola
3. Reinicia la aplicación si es necesario

### Verificación de Datos

#### Estructura Correcta

```
proyecto/
└── data/
    ├── 2025-03-19-11-00-00/          ✅ Formato correcto
    │   ├── Scene Capture - SUB1 - S1 - T1 - CC - OK/
    │   │   ├── ...-PpgHrv-....csv    ✅ Archivo válido
    │   │   └── ...-ProcessedMocap-....csv
    └── 2025-03-20-14-30-00/          ✅ Formato correcto
```

#### Estructura Incorrecta

```
proyecto/
├── datos/                            ❌ Nombre incorrecto
├── 2025-03-19/                      ❌ Formato incorrecto
└── archivos/                        ❌ Estructura incorrecta
```

### Logs y Debugging

- **Consola del Navegador**: F12 → Console
- **Terminal**: Mensajes de error detallados
- **Reportes de Pruebas**: `test_reports/test_report.html`

### Contacto y Soporte

- **Documentación Técnica**: `docs/manuales/tech_manual.md`
- **Reportes de Pruebas**: Verifica la integridad del sistema
- **Logs de Error**: Revisa la consola para detalles

## Consejos de Uso

### Mejores Prácticas

1. **Organiza tus datos** antes de procesar
2. **Haz copias de seguridad** de archivos originales
3. **Verifica los resultados** después del procesamiento
4. **Mantén el histórico** para análisis posteriores

### Optimización

- **Archivos grandes**: Procesa en lotes pequeños
- **Múltiples proyectos**: Usa directorios separados
- **Análisis frecuente**: Mantén el histórico activo

### Mantenimiento

- **Limpia el histórico** periódicamente
- **Verifica las pruebas** regularmente
- **Actualiza la aplicación** cuando sea necesario

---

**¡Disfruta procesando tus datos biométricos de manera eficiente y profesional! 🚀**
