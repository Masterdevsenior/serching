# 📐 Arquitectura del Sistema - Protocolo de Medición Dashboard

## 🏗️ Diagrama de Arquitectura General

```mermaid
graph TB
    subgraph "🌐 FRONTEND LAYER"
        A1[📄 Formulario de Registro<br/>form.html]
        A2[📊 Dashboard Interactivo<br/>dashboard.html]
        A3[📋 Gestión de Registros<br/>registros.html]
        A4[📅 Consulta por Fecha<br/>consulta_fecha.html]
    end

    subgraph "🔧 PRESENTATION LAYER"
        B1[⚡ Flask Web Framework<br/>app.py]
        B2[🛣️ Rutas HTTP<br/>/api/dashboard/*]
        B3[📝 Manejo de Formularios]
        B4[📤 Generación JSON/Excel]
    end

    subgraph "🧠 BUSINESS LOGIC LAYER"
        C1[🗃️ Modelos de Datos<br/>models/db.py]
        C2[✅ Validación de Datos]
        C3[📊 Cálculos Estadísticos]
        C4[🔄 Operaciones CRUD]
    end

    subgraph "💾 DATA ACCESS LAYER"
        D1[🐘 PostgreSQL Database]
        D2[📋 Tabla: protocolo_medicion]
        D3[🔒 Constraints & Índices]
        D4[⚡ Transacciones ACID]
    end

    subgraph "🧪 TESTING & MONITORING LAYER"
        E1[🔬 TestRunner<br/>test_runner.py]
        E2[📈 Pruebas Unitarias]
        E3[🔗 Pruebas de Integración]
        E4[📊 Reportes HTML/JSON]
    end

    A1 --> B1
    A2 --> B1
    A3 --> B1
    A4 --> B1

    B1 --> C1
    B2 --> C1
    B3 --> C1
    B4 --> C1

    C1 --> D1
    C2 --> D1
    C3 --> D1
    C4 --> D1

    E1 --> C1
    E2 --> C1
    E3 --> C1
    E4 --> C1

    style A1 fill:#e1f5fe
    style A2 fill:#e1f5fe
    style A3 fill:#e1f5fe
    style A4 fill:#e1f5fe
    style B1 fill:#f3e5f5
    style B2 fill:#f3e5f5
    style B3 fill:#f3e5f5
    style B4 fill:#f3e5f5
    style C1 fill:#e8f5e8
    style C2 fill:#e8f5e8
    style C3 fill:#e8f5e8
    style C4 fill:#e8f5e8
    style D1 fill:#fff3e0
    style D2 fill:#fff3e0
    style D3 fill:#fff3e0
    style D4 fill:#fff3e0
    style E1 fill:#fce4ec
    style E2 fill:#fce4ec
    style E3 fill:#fce4ec
    style E4 fill:#fce4ec
```

## 🔧 Diagrama de Componentes Detallado

```mermaid
graph LR
    subgraph "🎨 INTERFAZ DE USUARIO"
        UI1[📝 Formulario<br/>HTML + Bootstrap]
        UI2[📊 Dashboard<br/>Chart.js + DataTables]
        UI3[📋 Gestión<br/>CRUD Interface]
        UI4[🔍 Consultas<br/>Filtros Avanzados]
    end

    subgraph "⚡ SERVICIOS WEB"
        API1[🛣️ /api/dashboard/stats<br/>Estadísticas en tiempo real]
        API2[📈 /api/dashboard/chart-data<br/>Datos para gráficos]
        API3[📋 /api/dashboard/recent-registros<br/>Registros recientes]
        API4[💾 /guardar<br/>Guardar datos]
        API5[🗑️ /eliminar<br/>Eliminar registros]
        API6[📤 /exportar-excel<br/>Exportar datos]
    end

    subgraph "🧠 LÓGICA DE NEGOCIO"
        BL1[✅ Validación de Datos<br/>Campos requeridos]
        BL2[📊 Cálculos Estadísticos<br/>Promedios, distribuciones]
        BL3[🔄 Operaciones CRUD<br/>Create, Read, Update, Delete]
        BL4[📈 Análisis de Datos<br/>Pandas processing]
    end

    subgraph "🗃️ PERSISTENCIA"
        DB1[🐘 PostgreSQL<br/>Base de datos principal]
        DB2[📋 protocolo_medicion<br/>Tabla principal]
        DB3[🔒 Constraints<br/>Validación a nivel DB]
        DB4[⚡ Índices<br/>Optimización de consultas]
    end

    subgraph "🧪 CALIDAD Y MONITOREO"
        TEST1[🔬 TestRunner<br/>Ejecutor de pruebas]
        TEST2[📊 Pruebas Unitarias<br/>unittest framework]
        TEST3[🔗 Pruebas Integración<br/>End-to-end testing]
        TEST4[📈 Reportes<br/>HTML + JSON]
    end

    UI1 --> API4
    UI2 --> API1
    UI2 --> API2
    UI2 --> API3
    UI3 --> API5
    UI3 --> API6
    UI4 --> API1

    API1 --> BL2
    API2 --> BL2
    API3 --> BL3
    API4 --> BL1
    API5 --> BL3
    API6 --> BL4

    BL1 --> DB1
    BL2 --> DB1
    BL3 --> DB1
    BL4 --> DB1

    TEST1 --> BL1
    TEST2 --> BL1
    TEST3 --> BL1
    TEST4 --> BL1

    style UI1 fill:#e3f2fd
    style UI2 fill:#e3f2fd
    style UI3 fill:#e3f2fd
    style UI4 fill:#e3f2fd
    style API1 fill:#f1f8e9
    style API2 fill:#f1f8e9
    style API3 fill:#f1f8e9
    style API4 fill:#f1f8e9
    style API5 fill:#f1f8e9
    style API6 fill:#f1f8e9
    style BL1 fill:#fff8e1
    style BL2 fill:#fff8e1
    style BL3 fill:#fff8e1
    style BL4 fill:#fff8e1
    style DB1 fill:#fce4ec
    style DB2 fill:#fce4ec
    style DB3 fill:#fce4ec
    style DB4 fill:#fce4ec
    style TEST1 fill:#e0f2f1
    style TEST2 fill:#e0f2f1
    style TEST3 fill:#e0f2f1
    style TEST4 fill:#e0f2f1
```

## 🗃️ Diagrama de Base de Datos

```mermaid
erDiagram
    protocolo_medicion {
        serial id PK
        timestamp fecha_hora
        varchar nombre_completo
        integer edad
        varchar genero
        decimal peso_corporal
        decimal altura
        decimal longitud_brazo
        decimal longitud_pierna
        decimal longitud_torso
        boolean antecedentes_lesiones
        boolean limitaciones_movilidad
        boolean experiencia_levantamiento
        boolean sin_contraindicaciones
        boolean ajuste_traje
        boolean calibracion_sincronizada
        boolean sensores_posicion
        varchar tipo_ejercicio
        varchar nivel_riesgo
        decimal peso_carga
        integer duracion_minutos
        integer num_repeticiones
        varchar forma_objeto
        varchar velocidad_movimiento
        varchar tipo_superficie
    }

    %% Constraints y validaciones
    protocolo_medicion ||--o{ edad : "CHECK (edad > 0 AND edad <= 120)"
    protocolo_medicion ||--o{ peso_corporal : "CHECK (peso_corporal > 0)"
    protocolo_medicion ||--o{ altura : "CHECK (altura > 0)"
    protocolo_medicion ||--o{ longitud_brazo : "CHECK (longitud_brazo > 0)"
    protocolo_medicion ||--o{ longitud_pierna : "CHECK (longitud_pierna > 0)"
    protocolo_medicion ||--o{ longitud_torso : "CHECK (longitud_torso > 0)"
    protocolo_medicion ||--o{ peso_carga : "CHECK (peso_carga >= 0)"
    protocolo_medicion ||--o{ duracion_minutos : "CHECK (duracion_minutos > 0)"
    protocolo_medicion ||--o{ num_repeticiones : "CHECK (num_repeticiones >= 0)"
```

## 🔄 Flujos de Trabajo Detallados

### 1. Flujo de Registro de Datos

```mermaid
sequenceDiagram
    participant U as 👤 Usuario
    participant F as 🌐 Frontend
    participant A as ⚡ API Flask
    participant V as ✅ Validación
    participant D as 🗃️ Base de Datos
    participant R as 📊 Respuesta

    U->>F: Accede al formulario
    F->>U: Muestra formulario HTML
    U->>F: Llena datos personales
    U->>F: Completa medidas corporales
    U->>F: Indica historial médico
    U->>F: Configura ejercicio
    U->>F: Envía formulario

    F->>A: POST /guardar
    A->>V: Validar datos requeridos
    V->>A: Resultado validación

    alt Datos válidos
        A->>D: INSERT INTO protocolo_medicion
        D->>A: Confirmación de inserción
        A->>R: Respuesta de éxito
        R->>F: JSON {success: true}
        F->>U: Mostrar mensaje de éxito
        F->>U: Redirigir al dashboard
    else Datos inválidos
        A->>R: Respuesta de error
        R->>F: JSON {success: false, errors: [...]}
        F->>U: Mostrar errores
        U->>F: Corregir datos
    end
```

### 2. Flujo del Dashboard en Tiempo Real

```mermaid
sequenceDiagram
    participant U as 👤 Usuario
    participant D as 📊 Dashboard
    participant A as ⚡ API Flask
    participant C as 🧠 Cálculos
    participant DB as 🗃️ PostgreSQL
    participant G as 📈 Gráficos

    U->>D: Accede al dashboard
    D->>A: GET /api/dashboard/stats
    A->>DB: SELECT COUNT(*), AVG(edad), AVG(peso)
    DB->>A: Datos estadísticos
    A->>C: Calcular distribuciones
    C->>A: Estadísticas procesadas
    A->>D: JSON con métricas
    D->>G: Actualizar contadores

    D->>A: GET /api/dashboard/chart-data
    A->>DB: SELECT genero, tipo_ejercicio, nivel_riesgo
    DB->>A: Datos para gráficos
    A->>C: Procesar para Chart.js
    C->>A: Datos formateados
    A->>D: JSON con datos de gráficos
    D->>G: Renderizar gráficos

    D->>A: GET /api/dashboard/recent-registros
    A->>DB: SELECT * ORDER BY fecha_hora DESC LIMIT 10
    DB->>A: Registros recientes
    A->>D: JSON con registros
    D->>G: Actualizar tabla

    loop Cada 5 minutos
        D->>A: Actualizar datos
        A->>DB: Consultas actualizadas
        DB->>A: Datos frescos
        A->>D: Nuevos datos
        D->>G: Actualizar visualizaciones
    end
```

### 3. Flujo de Pruebas Automatizadas

```mermaid
sequenceDiagram
    participant S as 🚀 Sistema
    participant T as 🔬 TestRunner
    participant E as ⚙️ Entorno
    participant DB as 🗃️ DB Test
    participant M as 🧪 Modelos
    participant A as ⚡ Aplicación
    participant I as 🔗 Integración
    participant R as 📊 Reportes

    S->>T: Iniciar pruebas automáticas
    T->>E: Configurar entorno de prueba
    E->>DB: Crear base de datos de prueba
    DB->>E: Confirmación de creación

    T->>M: Ejecutar suite de modelos
    M->>DB: Pruebas de conexión
    M->>DB: Pruebas de creación de tabla
    M->>DB: Pruebas de operaciones CRUD
    M->>DB: Pruebas de validación
    DB->>M: Resultados de pruebas
    M->>T: Reporte de modelos

    T->>A: Ejecutar suite de aplicación
    A->>E: Pruebas de rutas HTTP
    A->>E: Pruebas de APIs
    A->>E: Pruebas de formularios
    A->>E: Pruebas de manejo de errores
    E->>A: Resultados de pruebas
    A->>T: Reporte de aplicación

    T->>I: Ejecutar suite de integración
    I->>E: Pruebas de flujo completo
    I->>E: Pruebas de dashboard
    I->>E: Pruebas de rendimiento
    E->>I: Resultados de integración
    I->>T: Reporte de integración

    T->>R: Generar reporte HTML
    T->>R: Guardar historial JSON
    R->>T: Confirmación de reportes
    T->>S: Finalizar pruebas

    loop Cada 6 horas
        S->>T: Programar siguiente ejecución
    end
```

### 4. Flujo de Gestión de Datos

```mermaid
sequenceDiagram
    participant U as 👤 Usuario
    participant G as 📋 Gestión
    participant A as ⚡ API Flask
    participant F as 🔍 Filtros
    participant DB as 🗃️ PostgreSQL
    participant E as 📤 Exportación

    U->>G: Accede a gestión de registros
    G->>A: GET /registros
    A->>DB: SELECT * FROM protocolo_medicion
    DB->>A: Todos los registros
    A->>G: Datos para DataTables
    G->>U: Mostrar tabla interactiva

    alt Búsqueda/Filtrado
        U->>G: Aplicar filtros
        G->>F: Procesar criterios
        F->>A: GET con parámetros
        A->>DB: SELECT con WHERE
        DB->>A: Registros filtrados
        A->>G: Datos filtrados
        G->>U: Actualizar tabla
    end

    alt Exportar a Excel
        U->>G: Solicitar exportación
        G->>A: GET /exportar-excel
        A->>DB: SELECT todos los datos
        DB->>A: Datos completos
        A->>E: Generar archivo Excel
        E->>A: Archivo generado
        A->>G: Descargar archivo
        G->>U: Archivo descargado
    end

    alt Eliminar registro
        U->>G: Seleccionar registro
        G->>U: Confirmar eliminación
        U->>G: Confirmar
        G->>A: DELETE /eliminar/{id}
        A->>DB: DELETE FROM WHERE id
        DB->>A: Confirmación
        A->>G: Respuesta de éxito
        G->>U: Actualizar tabla
    end

    alt Consulta por fecha
        U->>G: Seleccionar fecha
        G->>A: GET /registros-fecha/{fecha}
        A->>DB: SELECT WHERE fecha_hora
        DB->>A: Registros de fecha
        A->>G: Datos filtrados
        G->>U: Mostrar resultados
    end
```

## 📊 Diagrama de Tecnologías y Dependencias

```mermaid
graph TB
    subgraph "🎨 FRONTEND TECHNOLOGIES"
        F1[HTML5]
        F2[CSS3]
        F3[JavaScript]
        F4[Bootstrap 5]
        F5[Chart.js]
        F6[DataTables]
    end

    subgraph "⚡ BACKEND TECHNOLOGIES"
        B1[Flask 3.0.0]
        B2[Python 3.8+]
        B3[psycopg2-binary]
        B4[pandas 2.1.4]
        B5[openpyxl 3.1.2]
        B6[python-dotenv]
    end

    subgraph "🗃️ DATABASE TECHNOLOGIES"
        D1[PostgreSQL]
        D2[ACID Transactions]
        D3[Indexes]
        D4[Constraints]
    end

    subgraph "🧪 TESTING TECHNOLOGIES"
        T1[unittest]
        T2[pytest]
        T3[coverage]
        T4[HTML Reports]
    end

    F1 --> B1
    F2 --> B1
    F3 --> B1
    F4 --> B1
    F5 --> B1
    F6 --> B1

    B1 --> B2
    B3 --> D1
    B4 --> D1
    B5 --> B1
    B6 --> B1

    T1 --> B1
    T2 --> B1
    T3 --> B1
    T4 --> B1

    style F1 fill:#e3f2fd
    style F2 fill:#e3f2fd
    style F3 fill:#e3f2fd
    style F4 fill:#e3f2fd
    style F5 fill:#e3f2fd
    style F6 fill:#e3f2fd
    style B1 fill:#f1f8e9
    style B2 fill:#f1f8e9
    style B3 fill:#f1f8e9
    style B4 fill:#f1f8e9
    style B5 fill:#f1f8e9
    style B6 fill:#f1f8e9
    style D1 fill:#fff8e1
    style D2 fill:#fff8e1
    style D3 fill:#fff8e1
    style D4 fill:#fff8e1
    style T1 fill:#fce4ec
    style T2 fill:#fce4ec
    style T3 fill:#fce4ec
    style T4 fill:#fce4ec
```

## 🎯 Métricas y KPIs del Sistema

```mermaid
graph LR
    subgraph "📊 MÉTRICAS DE RENDIMIENTO"
        P1[⚡ Tiempo de respuesta API<br/>< 500ms]
        P2[🔄 Throughput<br/>100+ req/min]
        P3[💾 Uso de memoria<br/>< 512MB]
        P4[🖥️ CPU Usage<br/>< 30%]
    end

    subgraph "🧪 MÉTRICAS DE CALIDAD"
        Q1[✅ Tasa de éxito pruebas<br/>82.4%]
        Q2[📈 Cobertura de código<br/>> 90%]
        Q3[🐛 Bugs por sprint<br/>< 5]
        Q4[🔧 Tiempo de resolución<br/>< 24h]
    end

    subgraph "📈 MÉTRICAS DE NEGOCIO"
        B1[👥 Total de registros<br/>En tiempo real]
        B2[📊 Promedio de edad<br/>Cálculo dinámico]
        B3[⚖️ Distribución por género<br/>Gráficos actualizados]
        B4[🏃 Tipos de ejercicio<br/>Análisis estadístico]
        B5[⚠️ Niveles de riesgo<br/>Distribución %]
    end

    subgraph "🔍 MÉTRICAS DE USABILIDAD"
        U1[⏱️ Tiempo de carga página<br/>< 3s]
        U2[📱 Responsive design<br/>100%]
        U3[♿ Accesibilidad<br/>WCAG 2.1]
        U4[🌐 Compatibilidad navegadores<br/>Chrome, Firefox, Safari]
    end

    style P1 fill:#e8f5e8
    style P2 fill:#e8f5e8
    style P3 fill:#e8f5e8
    style P4 fill:#e8f5e8
    style Q1 fill:#fff3e0
    style Q2 fill:#fff3e0
    style Q3 fill:#fff3e0
    style Q4 fill:#fff3e0
    style B1 fill:#f3e5f5
    style B2 fill:#f3e5f5
    style B3 fill:#f3e5f5
    style B4 fill:#f3e5f5
    style B5 fill:#f3e5f5
    style U1 fill:#e1f5fe
    style U2 fill:#e1f5fe
    style U3 fill:#e1f5fe
    style U4 fill:#e1f5fe
```

---

## 📋 Resumen de Arquitectura

### **Principios de Diseño:**

- ✅ **Separación de Responsabilidades**: Cada capa tiene una función específica
- ✅ **Escalabilidad**: Arquitectura modular permite crecimiento
- ✅ **Mantenibilidad**: Código bien estructurado y documentado
- ✅ **Testabilidad**: Sistema de pruebas automatizado completo
- ✅ **Rendimiento**: Optimizaciones en base de datos y frontend
- ✅ **Seguridad**: Validación en múltiples capas

### **Ventajas de la Arquitectura:**

- 🚀 **Desarrollo Rápido**: Flask permite prototipado rápido
- 🔧 **Flexibilidad**: Fácil modificación y extensión
- 📊 **Monitoreo**: Sistema de pruebas y métricas integrado
- 🎨 **UX Moderna**: Interfaz responsiva y atractiva
- 💾 **Persistencia Robusta**: PostgreSQL con transacciones ACID
- 🧪 **Calidad Garantizada**: Testing automatizado continuo
