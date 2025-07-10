# Procesador de Datos Biométricos

## Configuración de Ruta de Datos

Este proyecto permite configurar fácilmente la ubicación de la carpeta `/data` para que apunte a una carpeta externa con el mismo nombre.

### 🚀 Configuración Simple

#### **Script Interactivo (Recomendado)**

Ejecuta el script de configuración:

```bash
python setup_data_path.py
```

Este script te guiará a través de las opciones disponibles:

- **Configurar ruta absoluta**: Para rutas como `C:/Users/TuUsuario/Datos/data`
- **Configurar ruta relativa**: Para rutas como `../datos_externos/data`
- **Restaurar configuración por defecto**: Volver a la carpeta data del proyecto
- **Ver configuración actual**: Mostrar la ruta configurada
- **Probar configuración**: Verificar que todo funciona correctamente

### 📋 Prioridad de Configuración

El sistema busca la ruta de datos en este orden:

1. **Configuración en** `config.py` (DATA_DIRECTORY)
2. **Ubicación por defecto** (carpeta `data` dentro del proyecto)

### 🔧 Verificación

Para verificar que la configuración funciona:

```bash
python setup_data_path.py
# Selecciona opción 5: "Probar configuración"
```

### 📁 Estructura Esperada

Tu carpeta `/data` debe tener esta estructura:

```
tu_carpeta_data/
├── 2025-03-19-11-00-00/
│   ├── Scene Capture - SUB1 - S1 - T1 - CC - OK/
│   │   ├── ...-PpgHrv-....csv
│   │   ├── ...-ProcessedMocap-....csv
│   │   └── ...-ProcessedPpg-....csv
│   └── Scene Capture - SUB2 - S2 - T2 - SC - BAD/
│       └── ...
└── 2025-03-20-14-30-00/
    └── ...
```

### ⚠️ Notas Importantes

- La carpeta debe contener subdirectorios con formato de fecha: `YYYY-MM-DD-HH-MM-SS`
- Los subdirectorios deben contener archivos CSV con metadatos en el nombre
- El sistema validará automáticamente la estructura al iniciar

### 🚀 Uso

Una vez configurada la ruta:

```bash
python run_app.py
```

La aplicación usará automáticamente tu carpeta de datos externa.

### 📝 Ejemplo de Uso

1. **Ejecuta el configurador:**

   ```bash
   python setup_data_path.py
   ```

2. **Selecciona opción 1** para configurar ruta absoluta

3. **Ingresa tu ruta**, por ejemplo:

   ```
   C:/Users/TuUsuario/Documents/DatosBiometricos/data
   ```

4. **Prueba la configuración** con opción 5

5. **Ejecuta la aplicación:**
   ```bash
   python run_app.py
   ```

¡Listo! La aplicación ahora usará tu carpeta de datos externa. 🎉
