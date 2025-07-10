import pandas as pd
import numpy as np
import os

def generate_sample_data(output_file: str = "ProcessedMocap.csv", 
                        num_subjects: int = 10, 
                        num_variables: int = 20) -> None:
    """
    Genera datos de ejemplo para probar la aplicación ICC
    
    Args:
        output_file: Nombre del archivo de salida
        num_subjects: Número de sujetos a generar
        num_variables: Número de variables numéricas a generar
    """
    
    print(f"🎯 Generando datos de ejemplo...")
    print(f"   Sujetos: {num_subjects}")
    print(f"   Variables: {num_variables}")
    
    # Crear estructura de datos
    data = []
    
    for subject in range(1, num_subjects + 1):
        for session in [1, 2]:  # Dos sesiones
            for repetition in [1, 2]:  # Dos repeticiones por sesión
                
                # Valores base para cada sujeto (con cierta variabilidad)
                base_values = np.random.normal(100, 20, num_variables)
                
                # Agregar ruido para simular variabilidad entre repeticiones
                noise = np.random.normal(0, 2, num_variables)
                values = base_values + noise
                
                # Crear fila de datos
                row = {
                    'Sujeto': subject,
                    'Sesion': session,
                    'Tiempo': repetition
                }
                
                # Agregar variables numéricas
                for i in range(num_variables):
                    row[f'Variable_{i+1:02d}'] = round(values[i], 3)
                
                data.append(row)
    
    # Crear DataFrame
    df = pd.DataFrame(data)
    
    # Guardar archivo
    df.to_csv(output_file, index=False)
    
    print(f"✅ Datos generados exitosamente en: {output_file}")
    print(f"   Registros: {len(df)}")
    print(f"   Columnas: {len(df.columns)}")
    print(f"   Sujetos únicos: {df['Sujeto'].nunique()}")
    print(f"   Variables numéricas: {num_variables}")
    
    # Mostrar estadísticas básicas
    print(f"\n📊 Estadísticas básicas:")
    print(f"   Rango de sujetos: {df['Sujeto'].min()} - {df['Sujeto'].max()}")
    print(f"   Sesiones: {df['Sesion'].unique()}")
    print(f"   Repeticiones: {df['Tiempo'].unique()}")
    
    # Mostrar ejemplo de las primeras filas
    print(f"\n📋 Ejemplo de datos (primeras 3 filas):")
    print(df.head(3).to_string(index=False))

def generate_high_icc_data(output_file: str = "ProcessedMocap_HighICC.csv") -> None:
    """
    Genera datos con alta correlación intraclase para demostrar la funcionalidad
    
    Args:
        output_file: Nombre del archivo de salida
    """
    
    print(f"🎯 Generando datos con alta ICC...")
    
    data = []
    num_subjects = 15
    num_variables = 10
    
    for subject in range(1, num_subjects + 1):
        # Generar valores base para cada sujeto
        base_values = np.random.normal(100, 15, num_variables)
        
        for repetition in [1, 2]:  # Dos repeticiones
            # Agregar muy poco ruido para alta ICC
            noise = np.random.normal(0, 0.5, num_variables)  # Ruido muy bajo
            values = base_values + noise
            
            row = {
                'Sujeto': subject,
                'Sesion': 1,  # Una sola sesión
                'Tiempo': repetition
            }
            
            for i in range(num_variables):
                row[f'Variable_{i+1:02d}'] = round(values[i], 3)
            
            data.append(row)
    
    df = pd.DataFrame(data)
    df.to_csv(output_file, index=False)
    
    print(f"✅ Datos con alta ICC generados en: {output_file}")
    print(f"   Registros: {len(df)}")
    print(f"   Sujetos: {df['Sujeto'].nunique()}")
    print(f"   Variables: {num_variables}")

if __name__ == "__main__":
    # Crear directorio de datos si no existe
    os.makedirs("data", exist_ok=True)
    
    print("🚀 Generador de Datos de Ejemplo para Análisis ICC")
    print("=" * 60)
    
    # Generar datos normales
    generate_sample_data("ProcessedMocap.csv", num_subjects=12, num_variables=25)
    
    print("\n" + "=" * 60)
    
    # Generar datos con alta ICC
    generate_high_icc_data("ProcessedMocap_HighICC.csv")
    
    print("\n" + "=" * 60)
    print("✅ ¡Datos de ejemplo generados exitosamente!")
    print("💡 Ahora puedes ejecutar: streamlit run app.py")
    print("📁 Archivos generados:")
    print("   - ProcessedMocap.csv (datos normales)")
    print("   - ProcessedMocap_HighICC.csv (datos con alta ICC)") 