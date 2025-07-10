import pandas as pd
import sqlite3
import os

def create_sample_descriptions_csv():
    """Crea un archivo CSV de ejemplo con descripciones de variables"""
    
    # Descripciones de ejemplo para variables típicas de mocap
    descriptions_data = {
        'variable': [
            'Variable_01', 'Variable_02', 'Variable_03', 'Variable_04', 'Variable_05',
            'Variable_06', 'Variable_07', 'Variable_08', 'Variable_09', 'Variable_10',
            'Variable_11', 'Variable_12', 'Variable_13', 'Variable_14', 'Variable_15',
            'Variable_16', 'Variable_17', 'Variable_18', 'Variable_19', 'Variable_20',
            'Variable_21', 'Variable_22', 'Variable_23', 'Variable_24', 'Variable_25'
        ],
        'descripcion': [
            'Ángulo de flexión de rodilla derecha (grados)',
            'Ángulo de extensión de rodilla derecha (grados)',
            'Ángulo de flexión de cadera derecha (grados)',
            'Ángulo de extensión de cadera derecha (grados)',
            'Ángulo de flexión de tobillo derecho (grados)',
            'Ángulo de extensión de tobillo derecho (grados)',
            'Velocidad angular de rodilla derecha (rad/s)',
            'Velocidad angular de cadera derecha (rad/s)',
            'Velocidad angular de tobillo derecho (rad/s)',
            'Momento de fuerza de rodilla derecha (Nm)',
            'Momento de fuerza de cadera derecha (Nm)',
            'Momento de fuerza de tobillo derecho (Nm)',
            'Potencia de rodilla derecha (W)',
            'Potencia de cadera derecha (W)',
            'Potencia de tobillo derecho (W)',
            'Ángulo de flexión de rodilla izquierda (grados)',
            'Ángulo de extensión de rodilla izquierda (grados)',
            'Ángulo de flexión de cadera izquierda (grados)',
            'Ángulo de extensión de cadera izquierda (grados)',
            'Ángulo de flexión de tobillo izquierdo (grados)',
            'Ángulo de extensión de tobillo izquierdo (grados)',
            'Velocidad angular de rodilla izquierda (rad/s)',
            'Velocidad angular de cadera izquierda (rad/s)',
            'Velocidad angular de tobillo izquierdo (rad/s)',
            'Momento de fuerza de rodilla izquierda (Nm)'
        ]
    }
    
    df = pd.DataFrame(descriptions_data)
    df.to_csv('variable_descriptions.csv', index=False)
    
    print("✅ Archivo CSV de descripciones creado: variable_descriptions.csv")
    print(f"   Variables descritas: {len(df)}")
    
    return df

def create_sample_descriptions_sqlite():
    """Crea una base de datos SQLite de ejemplo con descripciones"""
    
    # Crear base de datos
    conn = sqlite3.connect('variable_descriptions.db')
    
    # Crear tabla
    conn.execute('''
        CREATE TABLE IF NOT EXISTS variable_descriptions (
            variable TEXT PRIMARY KEY,
            descripcion TEXT,
            categoria TEXT,
            unidad TEXT
        )
    ''')
    
    # Datos de ejemplo
    descriptions_data = [
        ('Variable_01', 'Ángulo de flexión de rodilla derecha', 'Ángulos', 'grados'),
        ('Variable_02', 'Ángulo de extensión de rodilla derecha', 'Ángulos', 'grados'),
        ('Variable_03', 'Ángulo de flexión de cadera derecha', 'Ángulos', 'grados'),
        ('Variable_04', 'Ángulo de extensión de cadera derecha', 'Ángulos', 'grados'),
        ('Variable_05', 'Ángulo de flexión de tobillo derecho', 'Ángulos', 'grados'),
        ('Variable_06', 'Velocidad angular de rodilla derecha', 'Velocidades', 'rad/s'),
        ('Variable_07', 'Velocidad angular de cadera derecha', 'Velocidades', 'rad/s'),
        ('Variable_08', 'Velocidad angular de tobillo derecho', 'Velocidades', 'rad/s'),
        ('Variable_09', 'Momento de fuerza de rodilla derecha', 'Momentos', 'Nm'),
        ('Variable_10', 'Momento de fuerza de cadera derecha', 'Momentos', 'Nm'),
        ('Variable_11', 'Potencia de rodilla derecha', 'Potencia', 'W'),
        ('Variable_12', 'Potencia de cadera derecha', 'Potencia', 'W'),
        ('Variable_13', 'Ángulo de flexión de rodilla izquierda', 'Ángulos', 'grados'),
        ('Variable_14', 'Ángulo de extensión de rodilla izquierda', 'Ángulos', 'grados'),
        ('Variable_15', 'Ángulo de flexión de cadera izquierda', 'Ángulos', 'grados'),
        ('Variable_16', 'Velocidad angular de rodilla izquierda', 'Velocidades', 'rad/s'),
        ('Variable_17', 'Velocidad angular de cadera izquierda', 'Velocidades', 'rad/s'),
        ('Variable_18', 'Momento de fuerza de rodilla izquierda', 'Momentos', 'Nm'),
        ('Variable_19', 'Momento de fuerza de cadera izquierda', 'Momentos', 'Nm'),
        ('Variable_20', 'Potencia de rodilla izquierda', 'Potencia', 'W'),
        ('Variable_21', 'Potencia de cadera izquierda', 'Potencia', 'W'),
        ('Variable_22', 'Centro de masa X', 'Cinética', 'm'),
        ('Variable_23', 'Centro de masa Y', 'Cinética', 'm'),
        ('Variable_24', 'Centro de masa Z', 'Cinética', 'm'),
        ('Variable_25', 'Energía cinética total', 'Energía', 'J')
    ]
    
    # Insertar datos
    conn.executemany('''
        INSERT OR REPLACE INTO variable_descriptions 
        (variable, descripcion, categoria, unidad) 
        VALUES (?, ?, ?, ?)
    ''', descriptions_data)
    
    conn.commit()
    conn.close()
    
    print("✅ Base de datos SQLite creada: variable_descriptions.db")
    print(f"   Variables descritas: {len(descriptions_data)}")
    print("   Tabla: variable_descriptions")
    print("   Columnas: variable, descripcion, categoria, unidad")

def create_sample_descriptions_excel():
    """Crea un archivo Excel de ejemplo con descripciones"""
    
    # Crear DataFrame con múltiples hojas
    descriptions_data = {
        'variable': [
            'Variable_01', 'Variable_02', 'Variable_03', 'Variable_04', 'Variable_05',
            'Variable_06', 'Variable_07', 'Variable_08', 'Variable_09', 'Variable_10'
        ],
        'descripcion': [
            'Ángulo de flexión de rodilla derecha (grados)',
            'Ángulo de extensión de rodilla derecha (grados)',
            'Ángulo de flexión de cadera derecha (grados)',
            'Ángulo de extensión de cadera derecha (grados)',
            'Ángulo de flexión de tobillo derecho (grados)',
            'Velocidad angular de rodilla derecha (rad/s)',
            'Velocidad angular de cadera derecha (rad/s)',
            'Velocidad angular de tobillo derecho (rad/s)',
            'Momento de fuerza de rodilla derecha (Nm)',
            'Momento de fuerza de cadera derecha (Nm)'
        ],
        'categoria': [
            'Ángulos', 'Ángulos', 'Ángulos', 'Ángulos', 'Ángulos',
            'Velocidades', 'Velocidades', 'Velocidades', 'Momentos', 'Momentos'
        ],
        'unidad': [
            'grados', 'grados', 'grados', 'grados', 'grados',
            'rad/s', 'rad/s', 'rad/s', 'Nm', 'Nm'
        ]
    }
    
    df = pd.DataFrame(descriptions_data)
    
    # Crear archivo Excel con múltiples hojas
    with pd.ExcelWriter('variable_descriptions.xlsx', engine='openpyxl') as writer:
        df.to_excel(writer, sheet_name='Descripciones', index=False)
        
        # Hoja adicional con estadísticas
        stats_data = {
            'Categoría': ['Ángulos', 'Velocidades', 'Momentos', 'Potencia', 'Energía'],
            'Cantidad': [5, 3, 2, 0, 0],
            'Descripción': [
                'Medidas angulares de articulaciones',
                'Velocidades angulares de articulaciones',
                'Momentos de fuerza en articulaciones',
                'Potencia generada en articulaciones',
                'Energía cinética y potencial'
            ]
        }
        pd.DataFrame(stats_data).to_excel(writer, sheet_name='Estadísticas', index=False)
    
    print("✅ Archivo Excel creado: variable_descriptions.xlsx")
    print(f"   Variables descritas: {len(df)}")
    print("   Hojas: Descripciones, Estadísticas")

if __name__ == "__main__":
    print("🚀 Generador de Archivos de Descripciones de Variables")
    print("=" * 60)
    
    # Crear directorio de ejemplos si no existe
    os.makedirs("examples", exist_ok=True)
    
    # Cambiar al directorio de ejemplos
    os.chdir("examples")
    
    # Crear archivos de ejemplo
    create_sample_descriptions_csv()
    print()
    
    create_sample_descriptions_sqlite()
    print()
    
    create_sample_descriptions_excel()
    print()
    
    print("=" * 60)
    print("✅ ¡Archivos de ejemplo creados exitosamente!")
    print("📁 Ubicación: examples/")
    print("📄 Archivos creados:")
    print("   - variable_descriptions.csv")
    print("   - variable_descriptions.db")
    print("   - variable_descriptions.xlsx")
    print("\n💡 Puedes usar estos archivos para probar la funcionalidad de descripciones")
    print("   en la aplicación Streamlit.") 