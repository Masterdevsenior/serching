# 🦾 Aplicación de Evaluación Ergonomía

## 📋 Descripción

Esta aplicación permite evaluar la ergonomía laboral utilizando datos de un traje háptico Tesla Suit. Analiza parámetros fisiológicos (HRV, frecuencia cardíaca, SpO2) y biomecánicos (ángulos articulares) para identificar riesgos ergonómicos y generar recomendaciones.

## 🚀 Funcionalidades

### ✅ Funcionalidades implementadas:

- **📊 Carga de datos**: Soporte para archivos JSON y CSV
- **🔬 Análisis fisiológico**: HRV, frecuencia cardíaca, SpO2
- **🦿 Análisis biomecánico**: Ángulos de rodillas, caderas, tronco
- **🤖 IA integrada**: Evaluación automática con Google Gemini
- **📈 Visualizaciones**: Gráficas interactivas con Streamlit
- **📄 Reportes PDF**: Exportación de resultados
- **💾 Base de datos**: Almacenamiento de análisis
- **⚠️ Análisis de riesgo**: Detección automática de riesgos ergonómicos

### 🔄 Flujo de trabajo:

1. **Carga de datos** → Archivo JSON o CSV con datos del Tesla Suit
2. **Procesamiento** → Análisis automático de HRV y biomecánica
3. **Evaluación IA** → Gemini AI evalúa riesgos ergonómicos
4. **Visualización** → Gráficas y métricas en tiempo real
5. **Reporte** → Exportación a PDF y guardado en BD

## 🛠️ Instalación

```bash
# Clonar repositorio
git clone <url-repositorio>
cd app_ergonomia

# Instalar dependencias
pip install -r requirements.txt

# Ejecutar aplicación
streamlit run app/main.py
```

## 📁 Estructura del proyecto

```
app_ergonomia/
├── app/
│   ├── main.py              # Aplicación principal Streamlit
│   ├── api_handler.py       # Comunicación con API
│   ├── db.py               # Gestión de base de datos
│   ├── pdf_exporter.py     # Generación de reportes PDF
│   ├── visualizer.py       # Visualizaciones y gráficas
│   ├── csv_loader.py       # Carga de archivos CSV
│   └── api_fastapi.py      # API backend (opcional)
├── utils/
│   ├── gemini_client.py    # Cliente de Google Gemini AI
│   ├── processor.py        # Procesamiento de datos
│   └── prompt_generator.py # Generación de prompts para IA
├── data/
│   └── resultados.db       # Base de datos SQLite
└── requirements.txt        # Dependencias Python
```

## 🎯 Uso de la aplicación

### 1. Cargar datos JSON

- Sube un archivo JSON con datos procesados
- La aplicación analizará automáticamente los parámetros
- Genera visualizaciones y métricas

### 2. Cargar archivos CSV

- Sube archivos CSV separados para HRV, PPG y Motion Capture
- El sistema procesa automáticamente los datos
- Genera resúmenes estadísticos

### 3. Evaluación con IA

- Genera evaluaciones automáticas de ergonomía
- Identifica riesgos y proporciona recomendaciones
- Utiliza Google Gemini para análisis avanzado

### 4. Exportar resultados

- Genera reportes PDF detallados
- Guarda análisis en base de datos
- Incluye métricas y recomendaciones

## 🔧 Configuración

### Variables de entorno (opcional):

```bash
API_URL=http://localhost:8000/analizar
```

### Base de datos:

- **PostgreSQL** (preferido): Configurar en `app/db.py`
- **SQLite** (fallback): Se crea automáticamente en `data/resultados.db`

## 📊 Parámetros analizados

### Fisiológicos:

- **Frecuencia cardíaca**: Promedio y máximo
- **HRV**: RMSSD, SDNN, LF/HF ratio
- **SpO2**: Saturación de oxígeno

### Biomecánicos:

- **Rodillas**: Flexión/extensión derecha e izquierda
- **Caderas**: Flexión/extensión derecha e izquierda
- **Tronco**: Flexión/extensión
- **Pelvis**: Inclinación
- **Hombros**: Flexión/extensión

## ⚠️ Análisis de riesgo

La aplicación detecta automáticamente:

- Flexión excesiva de rodillas (>60°)
- Flexión excesiva del tronco (>30°)
- Inclinación excesiva de la pelvis (>15°)
- Patrones de movimiento de riesgo

## 🤖 Integración con IA

### Google Gemini:

- Evaluación automática de ergonomía
- Identificación de riesgos laborales
- Generación de recomendaciones personalizadas
- Análisis de patrones de movimiento

### Prompt personalizado:

- Contexto específico de levantamiento de carga
- Análisis de dos tiempos (T1: bajar, T2: subir)
- Evaluación de esfuerzo físico
- Predicción de lesiones potenciales

## 📈 Visualizaciones

- **Métricas en tiempo real**: Frecuencia cardíaca, HRV
- **Gráficas de tendencias**: Evolución temporal de parámetros
- **Análisis de ángulos**: Comparación lado derecho vs izquierdo
- **Indicadores de riesgo**: Alertas visuales para valores críticos

## 🔮 Mejoras futuras

### Funcionalidades planificadas:

- [ ] **Real-time monitoring**: Monitoreo en tiempo real
- [ ] **3D visualizations**: Visualizaciones 3D de posturas
- [ ] **Machine Learning**: Modelos predictivos de lesiones
- [ ] **Mobile app**: Aplicación móvil complementaria
- [ ] **API REST**: Endpoints para integración externa
- [ ] **Multi-user**: Soporte para múltiples usuarios
- [ ] **Advanced analytics**: Análisis estadístico avanzado
- [ ] **Integration APIs**: Conexión con otros sistemas

### Mejoras técnicas:

- [ ] **Performance**: Optimización de procesamiento
- [ ] **Security**: Autenticación y autorización
- [ ] **Testing**: Suite de pruebas automatizadas
- [ ] **Documentation**: Documentación técnica completa
- [ ] **Deployment**: Configuración de producción

## 🐛 Solución de problemas

### Error común: API no configurada

- La aplicación funciona sin API externa
- Usa modo simulado para procesamiento
- Configura `API_URL` en `.env` si necesitas API externa

### Error común: Base de datos

- SQLite se crea automáticamente
- PostgreSQL requiere configuración manual
- Verifica permisos de escritura en carpeta `data/`

## 📞 Soporte

Para reportar problemas o solicitar nuevas funcionalidades:

- Crear issue en el repositorio
- Incluir logs de error y pasos para reproducir
- Especificar versión de Python y dependencias

## 📄 Licencia

Este proyecto está bajo licencia MIT. Ver archivo LICENSE para más detalles.

---

**Desarrollado para evaluación ergonómica con traje háptico Tesla Suit** 🦾
