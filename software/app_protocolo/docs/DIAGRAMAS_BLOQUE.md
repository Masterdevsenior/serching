# 📦 Diagramas de Bloque - Protocolo de Medición Dashboard

## 🎯 Diagramas de Bloque Sencillos

Este documento contiene diagramas de bloque simples y visuales que complementan la documentación técnica detallada.

### 📋 **Instrucciones de Visualización**

Para ver correctamente los diagramas Mermaid:
1. **GitHub/GitLab**: Los diagramas se renderizan automáticamente
2. **Editores Markdown**: Usar extensiones como "Mermaid Preview"
3. **Navegador**: Usar herramientas online como [mermaid.live](https://mermaid.live)
4. **VS Code**: Instalar extensión "Markdown Preview Mermaid Support"

---

## 🏗️ Diagrama de Bloque - Arquitectura General

```mermaid
graph TB
    A[Usuario] --> B[Formulario]
    A --> C[Dashboard]
    A --> D[Gestion]
    A --> E[Consultas]
    
    B --> F[Flask App]
    C --> F
    D --> F
    E --> F
    
    F --> G[APIs REST]
    G --> H[Validacion]
    H --> I[Calculos]
    I --> J[CRUD]
    J --> K[PostgreSQL]
    
    K --> L[Tabla Principal]
    K --> M[Datos de Prueba]
    
    N[TestRunner] --> H
    N --> I
    N --> J
    N --> K
    
    N --> O[Reportes]
    N --> P[Alertas]
```

---

## 🔄 Diagrama de Bloque - Flujo de Datos

```mermaid
graph LR
    A[Formulario Web] --> B[Validar]
    C[API Externa] --> B
    D[Importar Excel] --> B
    
    B --> E[Limpiar]
    E --> F[Calcular]
    F --> G[Guardar]
    
    G --> H[PostgreSQL]
    G --> I[Archivos]
    G --> J[Cache]
    
    H --> K[Dashboard]
    H --> L[Excel]
    H --> M[Graficos]
    H --> N[Reportes]
    
    I --> L
    J --> K
```

---

## 🏃 Diagrama de Bloque - Flujo de Registro

```mermaid
graph TD
    A[Usuario] --> B[Llenar Formulario]
    B --> C[Validar Datos]
    C --> D{Valido?}
    D -->|No| E[Corregir]
    E --> C
    D -->|Si| F[Enviar al Servidor]
    F --> G[API Flask]
    G --> H[Procesar]
    H --> I[Guardar en BD]
    I --> J[Confirmar]
    J --> K[Mostrar Dashboard]
```

---

## 📊 Diagrama de Bloque - Flujo del Dashboard

```mermaid
graph LR
    A[Usuario] --> B[Acceder Dashboard]
    B --> C[Cargar Datos]
    C --> D[Estadisticas]
    C --> E[Graficos]
    C --> F[Tabla]
    D --> G[API Stats]
    E --> H[API Charts]
    F --> I[API Data]
    G --> J[BD Consulta]
    H --> J
    I --> J
    J --> K[Mostrar Resultados]
    K --> L[Actualizar cada 5 min]
    L --> C
```

---

## 🧪 Diagrama de Bloque - Flujo de Testing

```mermaid
graph TD
    A[Sistema Inicia] --> B{Ejecutar Tests?}
    B -->|No| C[App Normal]
    B -->|Si| D[Configurar Tests]
    D --> E[Crear DB Test]
    E --> F[Ejecutar Modelos]
    F --> G[Ejecutar App]
    G --> H[Ejecutar Integracion]
    H --> I[Generar Reporte]
    I --> J[Guardar Historial]
    J --> K[Enviar Alertas]
    K --> L[Programar Siguiente]
    L --> M[Esperar 6h]
    M --> D
```

---

## 📋 Diagrama de Bloque - Gestión de Datos

```mermaid
graph LR
    A[Usuario] --> B[Acceder Gestion]
    B --> C[Ver Tabla]
    C --> D{Accion}
    D -->|Buscar| E[Aplicar Filtros]
    D -->|Exportar| F[Generar Excel]
    D -->|Eliminar| G[Confirmar]
    D -->|Por Fecha| H[Seleccionar]
    E --> I[Actualizar Tabla]
    F --> J[Descargar]
    G --> K[Eliminar]
    H --> L[Mostrar Filtrado]
    I --> M[Volver a Gestion]
    J --> M
    K --> M
    L --> M
```

---

## 🔍 Diagrama de Bloque - Consultas y Filtros

```mermaid
graph TD
    A[Usuario] --> B[Iniciar Busqueda]
    B --> C[Definir Criterios]
    C --> D[Por Nombre]
    C --> E[Por Fecha]
    C --> F[Por Genero]
    C --> G[Por Ejercicio]
    C --> H[Por Riesgo]
    C --> I[Por Edad]
    D --> J[Aplicar Filtros]
    E --> J
    F --> J
    G --> J
    H --> J
    I --> J
    J --> K[Consultar BD]
    K --> L[Procesar]
    L --> M{Encontrado?}
    M -->|Si| N[Mostrar Resultados]
    M -->|No| O[Sin Resultados]
    N --> P[Exportar]
    N --> Q[Refinar]
    N --> R[Limpiar]
    O --> Q
    P --> S[Volver]
    Q --> C
    R --> S
```

---

## 📤 Diagrama de Bloque - Exportación

```mermaid
graph LR
    A[Usuario] --> B[Solicitar Exportacion]
    B --> C{Tipo?}
    C -->|Todos| D[SELECT *]
    C -->|Filtrados| E[SELECT WHERE]
    C -->|Por Fecha| F[SELECT DATE]
    D --> G[Procesar Pandas]
    E --> G
    F --> G
    G --> H[Crear Excel]
    H --> I[Formatear]
    I --> J[Agregar Timestamp]
    J --> K[Generar Archivo]
    K --> L{Exitoso?}
    L -->|No| M[Notificar Error]
    L -->|Si| N[Descargar]
    M --> O[Reintentar]
    O --> G
    N --> P[Limpiar]
```

---

## ⚙️ Diagrama de Bloque - Configuración del Sistema

```mermaid
graph TD
    A[Inicio Sistema] --> B[Cargar Config]
    B --> C[Variables Entorno]
    C --> D[Conectar BD]
    D --> E{Conectado?}
    E -->|No| F[Notificar Error]
    F --> G[Reintentar 30s]
    G --> D
    E -->|Si| H[Verificar Tabla]
    H --> I{Existe?}
    I -->|No| J[Crear Tabla]
    J --> K{Creada?}
    K -->|No| L[Error Creacion]
    K -->|Si| M[Tabla Lista]
    I -->|Si| N[Tabla Existe]
    M --> O[Configurar Tests]
    N --> O
    O --> P{Ejecutar Tests?}
    P -->|Si| Q[Ejecutar TestRunner]
    P -->|No| R[Iniciar Servidor]
    Q --> S{Tests OK?}
    S -->|No| T[Tests Fallidos]
    S -->|Si| U[Sistema Listo]
    T --> R
    U --> R
    R --> V[Servidor Activo]
    V --> W[Dashboard Listo]
    W --> X[Formulario Listo]
    X --> Y[Gestion Lista]
```

---

## 🎯 Diagrama de Bloque - Componentes del Sistema

```mermaid
graph TB
    A[HTML Forms] --> B[Flask App]
    C[CSS Styles] --> B
    D[JavaScript] --> B
    E[Chart.js] --> F[REST APIs]
    G[DataTables] --> F
    
    B --> F
    F --> H[Validacion]
    H --> I[Pandas]
    I --> J[Excel Gen]
    
    H --> K[PostgreSQL]
    I --> K
    J --> K
    
    K --> L[Tabla Principal]
    L --> M[Constraints]
    L --> N[Indices]
    
    O[TestRunner] --> P[Unit Tests]
    O --> Q[Integration]
    O --> R[Reports]
    
    P --> B
    Q --> B
    R --> B
```

---

## 📊 Diagrama de Bloque - Flujo de Datos Simplificado

```mermaid
graph LR
    A[Usuario] --> B[Formulario]
    B --> C[Servidor]
    C --> D[Base de Datos]
    D --> E[Dashboard]
    E --> F[Graficos]
    F --> G[Reportes]
```

---

## 📋 Diagramas Alternativos (Texto)

### Arquitectura del Sistema (Texto)

```
┌─────────────────────────────────────────────────────────────────┐
│                        USUARIOS                                 │
├─────────────────────────────────────────────────────────────────┤
│  👤 Usuario Final  🔧 Administrador  🧪 Tester                 │
└─────────────────────────────────────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│                      INTERFAZ WEB                               │
├─────────────────────────────────────────────────────────────────┤
│  📝 Formulario  📊 Dashboard  📋 Gestión  🔍 Consultas         │
└─────────────────────────────────────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│                     SERVIDOR WEB                                │
├─────────────────────────────────────────────────────────────────┤
│  🛣️ Flask App  📡 APIs REST  📤 Generador Excel               │
└─────────────────────────────────────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│                        LÓGICA                                   │
├─────────────────────────────────────────────────────────────────┤
│  ✅ Validación  📊 Cálculos  🔄 CRUD                           │
└─────────────────────────────────────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│                        DATOS                                    │
├─────────────────────────────────────────────────────────────────┤
│  🐘 PostgreSQL  📋 Tabla Principal  📊 Datos de Prueba         │
└─────────────────────────────────────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│                       TESTING                                   │
├─────────────────────────────────────────────────────────────────┤
│  🔬 TestRunner  📈 Reportes  📧 Alertas                         │
└─────────────────────────────────────────────────────────────────┘
```

### Flujo de Registro (Texto)

```
👤 Usuario
    │
    ▼
📝 Llenar Formulario
    │
    ▼
✅ Validar Datos
    │
    ▼
{ ¿Válido? }
    │
    ├─ ❌ No ──→ 🔧 Corregir ──→ ✅ Validar Datos
    │
    └─ ✅ Sí ──→ 📤 Enviar al Servidor
                    │
                    ▼
                🛣️ API Flask
                    │
                    ▼
                🧠 Procesar
                    │
                    ▼
                💾 Guardar en BD
                    │
                    ▼
                ✅ Confirmar
                    │
                    ▼
                📊 Mostrar Dashboard
```

### Flujo del Dashboard (Texto)

```
👤 Usuario
    │
    ▼
📊 Acceder Dashboard
    │
    ▼
🔄 Cargar Datos
    │
    ├─ 📈 Estadísticas ──→ 🛣️ API Stats ──→ 🗃️ BD Consulta
    ├─ 📊 Gráficos ──→ 🛣️ API Charts ──→ 🗃️ BD Consulta
    └─ 📋 Tabla ──→ 🛣️ API Data ──→ 🗃️ BD Consulta
    │
    ▼
📊 Mostrar Resultados
    │
    ▼
⏰ Actualizar cada 5 min ──→ 🔄 Cargar Datos
```

### Flujo de Testing (Texto)

```
🚀 Sistema Inicia
    │
    ▼
{ ¿Ejecutar Tests? }
    │
    ├─ ❌ No ──→ ⚡ App Normal
    │
    └─ ✅ Sí ──→ 🔧 Configurar Tests
                    │
                    ▼
                🗃️ Crear DB Test
                    │
                    ▼
                🧪 Ejecutar Modelos
                    │
                    ▼
                ⚡ Ejecutar App
                    │
                    ▼
                🔗 Ejecutar Integración
                    │
                    ▼
                📊 Generar Reporte
                    │
                    ▼
                💾 Guardar Historial
                    │
                    ▼
                📧 Enviar Alertas
                    │
                    ▼
                ⏰ Programar Siguiente
                    │
                    ▼
                🔄 Esperar 6h ──→ 🔧 Configurar Tests
```

---

## 🎯 Resumen de Diagramas de Bloque

### **Diagramas Incluidos:**

1. **🏗️ Arquitectura General**: Vista completa del sistema
2. **🔄 Flujo de Datos**: Procesamiento de información
3. **🏃 Flujo de Registro**: Proceso de ingreso de datos
4. **📊 Flujo del Dashboard**: Visualización en tiempo real
5. **🧪 Flujo de Testing**: Sistema de pruebas automatizado
6. **📋 Gestión de Datos**: Operaciones CRUD
7. **🔍 Consultas y Filtros**: Búsqueda avanzada
8. **📤 Exportación**: Generación de reportes
9. **⚙️ Configuración**: Inicialización del sistema
10. **🎯 Componentes**: Estructura técnica
11. **📊 Flujo Simplificado**: Vista general rápida

### **Características de los Diagramas:**

- ✅ **Simplicidad**: Fácil de entender a primera vista
- ✅ **Claridad**: Flujos lineales y lógicos
- ✅ **Completitud**: Cubren todos los procesos principales
- ✅ **Compatibilidad**: Funcionan en cualquier visor Mermaid
- ✅ **Alternativas**: Incluye diagramas en texto para máxima compatibilidad

### **Uso Recomendado:**

- **📖 Para Presentaciones**: Diagramas simples y claros
- **🎓 Para Capacitación**: Fácil comprensión para nuevos usuarios
- **📋 Para Documentación**: Referencia rápida de procesos
- **🔧 Para Desarrollo**: Vista general de componentes
- **📊 Para Stakeholders**: Explicación técnica simplificada

### **Solución de Problemas de Visualización:**

Si los diagramas Mermaid no se muestran correctamente:

1. **Copiar el código Mermaid** y pegarlo en [mermaid.live](https://mermaid.live)
2. **Usar los diagramas de texto** incluidos como alternativa
3. **Instalar extensiones** de Mermaid en tu editor
4. **Verificar compatibilidad** del visor Markdown

Estos diagramas complementan perfectamente la documentación técnica detallada existente, proporcionando una vista simplificada y visual de todos los procesos del sistema.
