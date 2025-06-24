# 🔄 Flujos de Trabajo del Sistema - Protocolo de Medición Dashboard

## 📋 Índice de Flujos

1. [🔄 Flujo de Registro de Datos](#flujo-de-registro-de-datos)
2. [📊 Flujo del Dashboard en Tiempo Real](#flujo-del-dashboard-en-tiempo-real)
3. [🧪 Flujo de Pruebas Automatizadas](#flujo-de-pruebas-automatizadas)
4. [📋 Flujo de Gestión de Datos](#flujo-de-gestión-de-datos)
5. [🔍 Flujo de Consultas y Filtros](#flujo-de-consultas-y-filtros)
6. [📤 Flujo de Exportación de Datos](#flujo-de-exportación-de-datos)
7. [⚙️ Flujo de Configuración del Sistema](#flujo-de-configuración-del-sistema)

---

## 🔄 Flujo de Registro de Datos

### Diagrama de Flujo Principal

```mermaid
flowchart TD
    A[👤 Usuario accede al sistema] --> B{¿Usuario autenticado?}
    B -->|No| C[🔐 Mostrar login]
    B -->|Sí| D[📝 Mostrar formulario de registro]

    D --> E[📋 Datos Personales]
    E --> F[📏 Medidas Corporales]
    F --> G[🏥 Historial Médico]
    G --> H[🏃 Configuración de Ejercicio]

    H --> I[✅ Validación Frontend]
    I --> J{¿Datos válidos?}
    J -->|No| K[❌ Mostrar errores]
    K --> E

    J -->|Sí| L[📤 Enviar datos al servidor]
    L --> M[🔍 Validación Backend]
    M --> N{¿Validación exitosa?}

    N -->|No| O[❌ Retornar errores]
    O --> P[📝 Usuario corrige datos]
    P --> L

    N -->|Sí| Q[💾 Guardar en PostgreSQL]
    Q --> R{¿Guardado exitoso?}
    R -->|No| S[❌ Error de base de datos]
    S --> T[📧 Notificar administrador]
    T --> U[🔄 Reintentar]
    U --> Q

    R -->|Sí| V[✅ Confirmación de éxito]
    V --> W[📊 Redirigir al dashboard]
    W --> X[🎉 Mostrar mensaje de éxito]

    style A fill:#e3f2fd
    style D fill:#e8f5e8
    style E fill:#fff3e0
    style F fill:#fff3e0
    style G fill:#fff3e0
    style H fill:#fff3e0
    style Q fill:#f1f8e9
    style V fill:#e8f5e8
    style X fill:#e8f5e8
    style K fill:#ffebee
    style O fill:#ffebee
    style S fill:#ffebee
```

### Diagrama de Secuencia Detallado

```mermaid
sequenceDiagram
    participant U as 👤 Usuario
    participant F as 🌐 Frontend
    participant V as ✅ Validación
    participant A as ⚡ API Flask
    participant B as 🧠 Business Logic
    participant D as 🗃️ PostgreSQL
    participant N as 📧 Notificaciones

    U->>F: Accede al formulario
    F->>U: Renderiza formulario HTML

    loop Llenado de datos
        U->>F: Completa sección de datos
        F->>V: Validación en tiempo real
        V->>F: Resultado de validación
        F->>U: Feedback visual
    end

    U->>F: Envía formulario completo
    F->>V: Validación completa frontend
    V->>F: Resultado validación

    alt Datos inválidos
        F->>U: Mostrar errores específicos
        U->>F: Corregir datos
        F->>V: Re-validación
    else Datos válidos
        F->>A: POST /guardar con datos
        A->>B: Procesar datos de entrada
        B->>V: Validación backend
        V->>B: Resultado validación

        alt Validación backend fallida
            B->>A: Errores de validación
            A->>F: JSON con errores
            F->>U: Mostrar errores
        else Validación exitosa
            B->>D: INSERT INTO protocolo_medicion
            D->>B: Confirmación de inserción

            alt Error en base de datos
                B->>N: Notificar error crítico
                N->>B: Confirmación de notificación
                B->>A: Error de sistema
                A->>F: Mensaje de error
                F->>U: Mostrar error crítico
            else Inserción exitosa
                B->>A: Confirmación de éxito
                A->>F: JSON {success: true, id: 123}
                F->>U: Mostrar mensaje de éxito
                F->>U: Redirigir a /dashboard
            end
        end
    end
```

---

## 📊 Flujo del Dashboard en Tiempo Real

### Diagrama de Flujo del Dashboard

```mermaid
flowchart TD
    A[👤 Usuario accede al dashboard] --> B[📄 Cargar página HTML]
    B --> C[⚡ Ejecutar JavaScript]
    C --> D[🔄 Inicializar componentes]

    D --> E[📊 Cargar estadísticas]
    E --> F[📈 Cargar gráficos]
    F --> G[📋 Cargar tabla de registros]

    E --> H[🛣️ GET /api/dashboard/stats]
    F --> I[🛣️ GET /api/dashboard/chart-data]
    G --> J[🛣️ GET /api/dashboard/recent-registros]

    H --> K[🧠 Procesar estadísticas]
    I --> L[📊 Procesar datos gráficos]
    J --> M[📋 Procesar registros]

    K --> N[📈 Actualizar contadores]
    L --> O[📊 Renderizar gráficos]
    M --> P[📋 Actualizar tabla]

    N --> Q[✅ Dashboard listo]
    O --> Q
    P --> Q

    Q --> R[⏰ Programar actualización]
    R --> S[🔄 Esperar 5 minutos]
    S --> T{¿Usuario sigue en página?}
    T -->|No| U[⏹️ Detener actualizaciones]
    T -->|Sí| V[🔄 Actualizar datos]
    V --> H

    style A fill:#e3f2fd
    style B fill:#e8f5e8
    style Q fill:#e8f5e8
    style H fill:#f1f8e9
    style I fill:#f1f8e9
    style J fill:#f1f8e9
    style N fill:#fff3e0
    style O fill:#fff3e0
    style P fill:#fff3e0
```

### Diagrama de Secuencia del Dashboard

```mermaid
sequenceDiagram
    participant U as 👤 Usuario
    participant D as 📊 Dashboard
    participant A as ⚡ API Flask
    participant C as 🧠 Cálculos
    participant DB as 🗃️ PostgreSQL
    participant G as 📈 Gráficos
    participant T as ⏰ Timer

    U->>D: Accede al dashboard
    D->>D: Cargar HTML + CSS
    D->>D: Inicializar JavaScript

    par Cargar estadísticas
        D->>A: GET /api/dashboard/stats
        A->>DB: SELECT COUNT(*), AVG(edad), AVG(peso)
        DB->>A: Datos estadísticos
        A->>C: Calcular distribuciones
        C->>A: Estadísticas procesadas
        A->>D: JSON con métricas
        D->>G: Actualizar contadores
    and Cargar gráficos
        D->>A: GET /api/dashboard/chart-data
        A->>DB: SELECT genero, tipo_ejercicio, nivel_riesgo
        DB->>A: Datos para gráficos
        A->>C: Procesar para Chart.js
        C->>A: Datos formateados
        A->>D: JSON con datos de gráficos
        D->>G: Renderizar gráficos Chart.js
    and Cargar registros
        D->>A: GET /api/dashboard/recent-registros
        A->>DB: SELECT * ORDER BY fecha_hora DESC LIMIT 10
        DB->>A: Registros recientes
        A->>D: JSON con registros
        D->>G: Actualizar tabla DataTables
    end

    D->>T: Programar actualización cada 5 min

    loop Actualización automática
        T->>D: Tiempo de actualización
        D->>A: GET /api/dashboard/stats
        A->>DB: Consultas actualizadas
        DB->>A: Datos frescos
        A->>D: Nuevos datos
        D->>G: Actualizar visualizaciones
        D->>T: Programar siguiente actualización
    end
```

---

## 🧪 Flujo de Pruebas Automatizadas

### Diagrama de Flujo de Testing

```mermaid
flowchart TD
    A[🚀 Inicio del sistema] --> B{¿Ejecutar pruebas automáticas?}
    B -->|No| C[⚡ Iniciar aplicación normal]
    B -->|Sí| D[🔧 Configurar entorno de prueba]

    D --> E[🗃️ Crear base de datos de prueba]
    E --> F{¿DB creada exitosamente?}
    F -->|No| G[❌ Error crítico]
    G --> H[📧 Notificar administrador]
    H --> I[🔄 Reintentar en 1 hora]
    I --> D

    F -->|Sí| J[🧪 Ejecutar suite de modelos]
    J --> K[⚡ Ejecutar suite de aplicación]
    K --> L[🔗 Ejecutar suite de integración]

    J --> M{¿Pruebas de modelos exitosas?}
    K --> N{¿Pruebas de aplicación exitosas?}
    L --> O{¿Pruebas de integración exitosas?}

    M -->|No| P[❌ Fallo en modelos]
    N -->|No| Q[❌ Fallo en aplicación]
    O -->|No| R[❌ Fallo en integración]

    P --> S[📊 Generar reporte de errores]
    Q --> S
    R --> S

    M -->|Sí| T[✅ Modelos OK]
    N -->|Sí| U[✅ Aplicación OK]
    O -->|Sí| V[✅ Integración OK]

    T --> W[📈 Generar reporte HTML]
    U --> W
    V --> W

    W --> X[💾 Guardar en historial JSON]
    X --> Y[📧 Enviar reporte por email]
    Y --> Z[⏰ Programar siguiente ejecución]
    Z --> AA[🔄 Esperar 6 horas]
    AA --> D

    style A fill:#e3f2fd
    style D fill:#e8f5e8
    style J fill:#fff3e0
    style K fill:#fff3e0
    style L fill:#fff3e0
    style W fill:#e8f5e8
    style G fill:#ffebee
    style P fill:#ffebee
    style Q fill:#ffebee
    style R fill:#ffebee
```

### Diagrama de Secuencia de Testing

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
    participant N as 📧 Notificaciones

    S->>T: Iniciar pruebas automáticas
    T->>E: Configurar entorno de prueba
    E->>DB: Crear base de datos de prueba
    DB->>E: Confirmación de creación

    par Suite de Modelos
        T->>M: Ejecutar pruebas de conexión
        M->>DB: Test de conexión
        DB->>M: Resultado conexión
        M->>T: Reporte conexión

        T->>M: Ejecutar pruebas de tabla
        M->>DB: Test creación tabla
        DB->>M: Resultado creación
        M->>T: Reporte tabla

        T->>M: Ejecutar pruebas CRUD
        M->>DB: Test operaciones
        DB->>M: Resultado operaciones
        M->>T: Reporte CRUD
    and Suite de Aplicación
        T->>A: Ejecutar pruebas de rutas
        A->>E: Test rutas HTTP
        E->>A: Resultado rutas
        A->>T: Reporte rutas

        T->>A: Ejecutar pruebas de APIs
        A->>E: Test endpoints
        E->>A: Resultado APIs
        A->>T: Reporte APIs
    and Suite de Integración
        T->>I: Ejecutar pruebas de flujo
        I->>E: Test flujo completo
        E->>I: Resultado flujo
        I->>T: Reporte flujo

        T->>I: Ejecutar pruebas de rendimiento
        I->>E: Test performance
        E->>I: Resultado performance
        I->>T: Reporte performance
    end

    T->>R: Consolidar resultados
    R->>T: Reporte consolidado

    T->>R: Generar reporte HTML
    T->>R: Guardar historial JSON
    R->>T: Confirmación reportes

    alt Hay errores críticos
        T->>N: Enviar alerta por email
        N->>T: Confirmación envío
    end

    T->>S: Finalizar pruebas
    S->>T: Programar siguiente ejecución (6h)
```

---

## 📋 Flujo de Gestión de Datos

### Diagrama de Flujo de Gestión

```mermaid
flowchart TD
    A[👤 Usuario accede a gestión] --> B[📋 Cargar todos los registros]
    B --> C[🛣️ GET /registros]
    C --> D[🗃️ Consultar PostgreSQL]
    D --> E[📊 Mostrar tabla DataTables]

    E --> F{Usuario selecciona acción}

    F -->|🔍 Buscar| G[📝 Aplicar filtros]
    G --> H[🛣️ GET con parámetros]
    H --> I[🗃️ SELECT con WHERE]
    I --> J[📊 Actualizar tabla filtrada]

    F -->|📤 Exportar| K[📄 Generar Excel]
    K --> L[🛣️ GET /exportar-excel]
    L --> M[🗃️ SELECT todos los datos]
    M --> N[📊 Procesar con pandas]
    N --> O[📄 Crear archivo Excel]
    O --> P[⬇️ Descargar archivo]

    F -->|🗑️ Eliminar| Q[⚠️ Confirmar eliminación]
    Q --> R{¿Confirmado?}
    R -->|No| S[❌ Cancelar operación]
    R -->|Sí| T[🛣️ DELETE /eliminar/{id}]
    T --> U[🗃️ DELETE FROM WHERE id]
    U --> V[✅ Confirmar eliminación]
    V --> W[📊 Actualizar tabla]

    F -->|📅 Consultar por fecha| X[📅 Seleccionar fecha]
    X --> Y[🛣️ GET /registros-fecha/{fecha}]
    Y --> Z[🗃️ SELECT WHERE fecha_hora]
    Z --> AA[📊 Mostrar registros de fecha]

    J --> BB[🔄 Volver a gestión]
    P --> BB
    W --> BB
    AA --> BB
    S --> BB

    style A fill:#e3f2fd
    style E fill:#e8f5e8
    style G fill:#fff3e0
    style K fill:#fff3e0
    style Q fill:#fff3e0
    style X fill:#fff3e0
    style BB fill:#e8f5e8
```

---

## 🔍 Flujo de Consultas y Filtros

### Diagrama de Flujo de Búsqueda

```mermaid
flowchart TD
    A[👤 Usuario inicia búsqueda] --> B[🔍 Mostrar panel de filtros]
    B --> C[📝 Usuario define criterios]

    C --> D[👤 Filtro por nombre]
    C --> E[📅 Filtro por fecha]
    C --> F[⚖️ Filtro por género]
    C --> G[🏃 Filtro por tipo ejercicio]
    C --> H[⚠️ Filtro por nivel riesgo]
    C --> I[📊 Filtro por rango edad]

    D --> J[🔄 Aplicar filtros]
    E --> J
    F --> J
    G --> J
    H --> J
    I --> J

    J --> K[🛣️ Construir query SQL]
    K --> L[🗃️ Ejecutar consulta]
    L --> M[📊 Procesar resultados]
    M --> N[📋 Mostrar resultados filtrados]

    N --> O{¿Resultados encontrados?}
    O -->|Sí| P[📊 Mostrar tabla con datos]
    O -->|No| Q[📭 Mostrar mensaje "Sin resultados"]

    P --> R[🔄 Opciones adicionales]
    Q --> R

    R --> S[📤 Exportar resultados]
    R --> T[🔄 Refinar búsqueda]
    R --> U[🗑️ Limpiar filtros]

    S --> V[📄 Generar Excel filtrado]
    T --> C
    U --> W[📊 Mostrar todos los registros]

    style A fill:#e3f2fd
    style B fill:#e8f5e8
    style J fill:#fff3e0
    style N fill:#e8f5e8
    style P fill:#e8f5e8
    style Q fill:#ffebee
    style V fill:#fff3e0
    style W fill:#e8f5e8
```

---

## 📤 Flujo de Exportación de Datos

### Diagrama de Flujo de Exportación

```mermaid
flowchart TD
    A[👤 Usuario solicita exportación] --> B{¿Tipo de exportación?}

    B -->|📊 Todos los datos| C[🗃️ SELECT * FROM protocolo_medicion]
    B -->|🔍 Datos filtrados| D[🗃️ SELECT con WHERE clause]
    B -->|📅 Datos por fecha| E[🗃️ SELECT WHERE fecha_hora]

    C --> F[📊 Procesar datos con pandas]
    D --> F
    E --> F

    F --> G[📄 Crear DataFrame]
    G --> H[🎨 Aplicar formato Excel]
    H --> I[📊 Agregar estadísticas]
    I --> J[📅 Agregar timestamp]
    J --> K[💾 Generar archivo Excel]

    K --> L{¿Archivo generado?}
    L -->|No| M[❌ Error en generación]
    M --> N[📧 Notificar error]
    N --> O[🔄 Reintentar]
    O --> F

    L -->|Sí| P[📤 Preparar descarga]
    P --> Q[⬇️ Enviar archivo al cliente]
    Q --> R[✅ Confirmar descarga]
    R --> S[🗑️ Limpiar archivo temporal]

    style A fill:#e3f2fd
    style B fill:#e8f5e8
    style F fill:#fff3e0
    style K fill:#e8f5e8
    style Q fill:#e8f5e8
    style M fill:#ffebee
```

---

## ⚙️ Flujo de Configuración del Sistema

### Diagrama de Flujo de Configuración

```mermaid
flowchart TD
    A[🚀 Inicio del sistema] --> B[📋 Cargar configuración]
    B --> C[🔧 Leer variables de entorno]
    C --> D[🗃️ Configurar conexión DB]

    D --> E{¿Conexión exitosa?}
    E -->|No| F[❌ Error de conexión]
    F --> G[📧 Notificar administrador]
    G --> H[🔄 Reintentar en 30s]
    H --> D

    E -->|Sí| I[📋 Verificar estructura DB]
    I --> J{¿Tabla existe?}
    J -->|No| K[🔨 Crear tabla protocolo_medicion]
    K --> L{¿Tabla creada?}
    L -->|No| M[❌ Error creación tabla]
    M --> G
    L -->|Sí| N[✅ Tabla creada exitosamente]

    J -->|Sí| O[✅ Tabla ya existe]
    N --> P[🧪 Configurar sistema de pruebas]
    O --> P

    P --> Q{¿Ejecutar pruebas iniciales?}
    Q -->|Sí| R[🔬 Ejecutar TestRunner]
    Q -->|No| S[⚡ Iniciar servidor Flask]

    R --> T{¿Pruebas exitosas?}
    T -->|No| U[⚠️ Advertencia: Pruebas fallidas]
    T -->|Sí| V[✅ Sistema listo]

    U --> S
    V --> S

    S --> W[🌐 Servidor activo en puerto 5000]
    W --> X[📊 Dashboard disponible]
    X --> Y[📝 Formulario disponible]
    Y --> Z[📋 Gestión disponible]

    style A fill:#e3f2fd
    style B fill:#e8f5e8
    style D fill:#fff3e0
    style I fill:#fff3e0
    style P fill:#fff3e0
    style S fill:#e8f5e8
    style W fill:#e8f5e8
    style F fill:#ffebee
    style M fill:#ffebee
    style U fill:#fff3e0
```

---

## 📊 Resumen de Flujos

### **Flujos Principales del Sistema:**

1. **🔄 Registro de Datos**: Flujo completo desde formulario hasta base de datos
2. **📊 Dashboard en Tiempo Real**: Actualización automática de estadísticas
3. **🧪 Pruebas Automatizadas**: Sistema de testing continuo
4. **📋 Gestión de Datos**: Operaciones CRUD completas
5. **🔍 Consultas y Filtros**: Búsqueda avanzada de datos
6. **📤 Exportación**: Generación de reportes Excel
7. **⚙️ Configuración**: Inicialización del sistema

### **Características de los Flujos:**

- ✅ **Validación Multi-capa**: Frontend y Backend
- ✅ **Manejo de Errores**: Recuperación automática
- ✅ **Feedback en Tiempo Real**: Respuestas inmediatas
- ✅ **Persistencia Robusta**: Transacciones ACID
- ✅ **Monitoreo Continuo**: Testing automatizado
- ✅ **Escalabilidad**: Arquitectura modular
- ✅ **UX Optimizada**: Interfaz intuitiva
