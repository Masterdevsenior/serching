# filepath: d:\app_protocolo_medicion\src\app\main\app\app.py
from flask import Flask, request, render_template, jsonify, send_file
from models.db import crear_tabla, guardar_datos, obtener_registros, eliminar_registro, obtener_fechas_disponibles, obtener_registros_por_fecha
import pandas as pd
from datetime import datetime
import os
import tempfile
import logging
import sys

# Configurar logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    stream=sys.stdout
)
logger = logging.getLogger(__name__)

app = Flask(__name__)

# Crear la tabla al iniciar la aplicación
try:
    logger.info("=== INICIANDO APLICACIÓN ===")
    logger.info("Intentando crear la tabla...")
    if crear_tabla():
        logger.info("Tabla creada exitosamente")
    else:
        logger.error("Error al crear la tabla")
        sys.exit(1)  # Salir si no se puede crear la tabla
except Exception as e:
    logger.error(f"Error durante la inicialización: {e}")
    sys.exit(1)  # Salir si hay un error

@app.route('/')
def index():
    return render_template('form.html')

@app.route('/registros')
def ver_registros():
    registros = obtener_registros()
    return render_template('registros.html', registros=registros)

@app.route('/consulta-fecha')
def consulta_fecha():
    fechas = obtener_fechas_disponibles()
    return render_template('consulta_fecha.html', fechas=fechas)

@app.route('/registros-fecha/<fecha>')
def registros_fecha(fecha):
    fecha_obj = datetime.strptime(fecha, '%Y-%m-%d').date()
    registros = obtener_registros_por_fecha(fecha_obj)
    return render_template('registros_fecha.html', registros=registros, fecha=fecha_obj)

@app.route('/guardar', methods=['POST'])
def guardar():
    try:
        if guardar_datos(request.form):
            return jsonify({'success': True, 'message': 'Datos guardados correctamente'})
        else:
            return jsonify({'success': False, 'message': 'Error al guardar los datos'})
    except Exception as e:
        return jsonify({'success': False, 'message': f'Error: {str(e)}'})

@app.route('/eliminar/<int:id>', methods=['DELETE'])
def eliminar(id):
    if eliminar_registro(id):
        return jsonify({'success': True, 'message': 'Registro eliminado correctamente'})
    return jsonify({'success': False, 'message': 'Error al eliminar el registro'})

@app.route('/exportar-excel')
def exportar_excel():
    try:
        # Obtener los registros
        registros = obtener_registros()
        
        if not registros:
            return jsonify({'success': False, 'message': 'No hay registros para exportar'})
        
        # Crear un DataFrame de pandas
        df = pd.DataFrame(registros)
        
        # Reordenar las columnas
        columnas = [
            'id', 'fecha_hora', 'nombre_completo', 'edad', 'genero',
            'peso_corporal', 'altura', 'longitud_brazo', 'longitud_pierna',
            'longitud_torso', 'antecedentes_lesiones', 'limitaciones_movilidad',
            'experiencia_levantamiento', 'sin_contraindicaciones', 'ajuste_traje',
            'calibracion_sincronizada', 'sensores_posicion', 'tipo_ejercicio',
            'nivel_riesgo', 'peso_carga', 'duracion_minutos', 'num_repeticiones',
            'forma_objeto', 'velocidad_movimiento', 'tipo_superficie'
        ]
        df = df[columnas]
        
        # Renombrar las columnas para mejor presentación
        df.columns = [
            'ID', 'Fecha y Hora', 'Nombre Completo', 'Edad', 'Género',
            'Peso Corporal (kg)', 'Altura (cm)', 'Longitud Brazo (cm)',
            'Longitud Pierna (cm)', 'Longitud Torso (cm)', 'Antecedentes Lesiones',
            'Limitaciones Movilidad', 'Experiencia Levantamiento',
            'Sin Contraindicaciones', 'Ajuste Traje', 'Calibración Sincronizada',
            'Sensores Posición', 'Tipo de Ejercicio', 'Nivel de Riesgo',
            'Peso de Carga (kg)', 'Duración (min)', 'Número de Repeticiones',
            'Forma Objeto', 'Velocidad Movimiento', 'Tipo Superficie'
        ]
        
        # Convertir valores booleanos a texto
        columnas_booleanas = [
            'Antecedentes Lesiones', 'Limitaciones Movilidad',
            'Experiencia Levantamiento', 'Sin Contraindicaciones',
            'Ajuste Traje', 'Calibración Sincronizada', 'Sensores Posición'
        ]
        for col in columnas_booleanas:
            df[col] = df[col].map({True: 'Sí', False: 'No'})
        
        # Crear un archivo temporal
        with tempfile.NamedTemporaryFile(delete=False, suffix='.xlsx') as tmp:
            # Guardar el archivo Excel
            df.to_excel(tmp.name, index=False, engine='openpyxl')
            
            # Enviar el archivo al usuario
            return send_file(
                tmp.name,
                as_attachment=True,
                download_name=f'protocolo_medicion_{datetime.now().strftime("%Y%m%d_%H%M%S")}.xlsx',
                mimetype='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
            )
    except Exception as e:
        return jsonify({'success': False, 'message': f'Error al exportar a Excel: {str(e)}'})

if __name__ == '__main__':
    app.run(debug=True)