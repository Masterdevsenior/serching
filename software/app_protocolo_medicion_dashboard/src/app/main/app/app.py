# filepath: d:\app_protocolo_medicion\src\app\main\app\app.py
from flask import Flask, request, render_template, jsonify, send_file
from app.models.db import crear_tabla, guardar_datos, obtener_registros, eliminar_registro, obtener_fechas_disponibles, obtener_registros_por_fecha
import pandas as pd
from datetime import datetime, timedelta
import os
import tempfile
import logging
import sys
import json
import threading
import time

# Configurar logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    stream=sys.stdout
)
logger = logging.getLogger(__name__)

app = Flask(__name__)

def run_automated_tests():
    """Ejecutar pruebas automáticas en segundo plano"""
    try:
        logger.info("=== INICIANDO PRUEBAS AUTOMÁTICAS ===")
        
        # Importar y ejecutar el test runner
        from test_runner import TestRunner
        runner = TestRunner()
        runner.run_all_tests()
        
        logger.info("=== PRUEBAS AUTOMÁTICAS COMPLETADAS ===")
    except Exception as e:
        logger.error(f"Error en pruebas automáticas: {e}")

def start_test_scheduler():
    """Iniciar el programador de pruebas automáticas"""
    def scheduler():
        while True:
            try:
                # Ejecutar pruebas cada 6 horas
                time.sleep(6 * 60 * 60)  # 6 horas
                run_automated_tests()
            except Exception as e:
                logger.error(f"Error en el programador de pruebas: {e}")
                time.sleep(60)  # Esperar 1 minuto antes de reintentar
    
    # Iniciar thread en segundo plano
    test_thread = threading.Thread(target=scheduler, daemon=True)
    test_thread.start()
    logger.info("Programador de pruebas automáticas iniciado")

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

# Solo ejecutar pruebas automáticas si se especifica explícitamente
# Esto evita borrar datos de producción
if __name__ == '__main__':
    # Verificar si se debe ejecutar pruebas automáticas
    if len(sys.argv) > 1 and sys.argv[1] == '--run-tests':
        logger.info("Ejecutando pruebas automáticas por solicitud explícita...")
        # Ejecutar pruebas iniciales
        run_automated_tests()
        
        # Iniciar programador de pruebas
        start_test_scheduler()
    else:
        logger.info("Aplicación iniciada sin ejecutar pruebas automáticas")
        logger.info("Para ejecutar pruebas automáticas, use: python app.py --run-tests")

@app.route('/')
def index():
    return render_template('form.html')

@app.route('/dashboard')
def dashboard():
    return render_template('dashboard.html')

@app.route('/run-tests')
def run_tests_endpoint():
    """Endpoint para ejecutar pruebas manualmente"""
    try:
        # Ejecutar pruebas en un thread separado
        test_thread = threading.Thread(target=run_automated_tests, daemon=True)
        test_thread.start()
        
        return jsonify({
            'success': True,
            'message': 'Pruebas iniciadas en segundo plano'
        })
    except Exception as e:
        return jsonify({
            'success': False,
            'message': f'Error al iniciar pruebas: {str(e)}'
        })

@app.route('/test-status')
def test_status():
    """Endpoint para verificar el estado de las pruebas"""
    try:
        # Verificar si existe el archivo de historial más reciente
        import os
        from pathlib import Path
        
        history_file = Path("test_history.json")
        if history_file.exists():
            with open(history_file, 'r', encoding='utf-8') as f:
                history = json.load(f)
            
            if history:
                latest = history[-1]
                return jsonify({
                    'success': True,
                    'last_execution': latest['timestamp'],
                    'last_success_rate': sum(suite['success_rate'] for suite in latest['results'].values()) / len(latest['results']),
                    'total_executions': len(history)
                })
        
        return jsonify({
            'success': True,
            'message': 'No hay historial de pruebas disponible'
        })
    except Exception as e:
        return jsonify({
            'success': False,
            'message': f'Error al obtener estado: {str(e)}'
        })

@app.route('/api/dashboard/stats')
def api_dashboard_stats():
    try:
        registros = obtener_registros()
        if not registros:
            return jsonify({
                'total_registros': 0,
                'promedio_edad': 0,
                'promedio_peso': 0,
                'promedio_altura': 0,
                'distribucion_genero': {},
                'distribucion_ejercicios': {},
                'distribucion_riesgo': {},
                'registros_ultimos_7_dias': 0,
                'registros_ultimos_30_dias': 0
            })
        
        df = pd.DataFrame(registros)
        
        # Verificar que las columnas necesarias existan
        columnas_requeridas = ['edad', 'peso_corporal', 'altura', 'genero', 'tipo_ejercicio', 'nivel_riesgo', 'fecha_hora']
        columnas_faltantes = [col for col in columnas_requeridas if col not in df.columns]
        
        if columnas_faltantes:
            logger.warning(f"Columnas faltantes en los datos: {columnas_faltantes}")
            # En lugar de fallar, devolver datos por defecto
            return jsonify({
                'total_registros': len(registros),
                'promedio_edad': 0,
                'promedio_peso': 0,
                'promedio_altura': 0,
                'distribucion_genero': {},
                'distribucion_ejercicios': {},
                'distribucion_riesgo': {},
                'registros_ultimos_7_dias': 0,
                'registros_ultimos_30_dias': 0
            })
        
        # Estadísticas básicas
        total_registros = len(df)
        promedio_edad = round(df['edad'].mean(), 1) if not df['edad'].isna().all() else 0
        promedio_peso = round(df['peso_corporal'].mean(), 1) if not df['peso_corporal'].isna().all() else 0
        promedio_altura = round(df['altura'].mean(), 1) if not df['altura'].isna().all() else 0
        
        # Distribución por género
        distribucion_genero = df['genero'].value_counts().to_dict() if not df['genero'].isna().all() else {}
        
        # Distribución por tipo de ejercicio
        distribucion_ejercicios = df['tipo_ejercicio'].value_counts().to_dict() if not df['tipo_ejercicio'].isna().all() else {}
        
        # Distribución por nivel de riesgo
        distribucion_riesgo = df['nivel_riesgo'].value_counts().to_dict() if not df['nivel_riesgo'].isna().all() else {}
        
        # Registros de los últimos días
        try:
            df['fecha_hora'] = pd.to_datetime(df['fecha_hora'])
            fecha_actual = datetime.now()
            
            registros_ultimos_7_dias = len(df[df['fecha_hora'] >= fecha_actual - timedelta(days=7)])
            registros_ultimos_30_dias = len(df[df['fecha_hora'] >= fecha_actual - timedelta(days=30)])
        except Exception as e:
            logger.warning(f"Error al procesar fechas: {e}")
            registros_ultimos_7_dias = 0
            registros_ultimos_30_dias = 0
        
        return jsonify({
            'total_registros': total_registros,
            'promedio_edad': promedio_edad,
            'promedio_peso': promedio_peso,
            'promedio_altura': promedio_altura,
            'distribucion_genero': distribucion_genero,
            'distribucion_ejercicios': distribucion_ejercicios,
            'distribucion_riesgo': distribucion_riesgo,
            'registros_ultimos_7_dias': registros_ultimos_7_dias,
            'registros_ultimos_30_dias': registros_ultimos_30_dias
        })
    except Exception as e:
        logger.error(f"Error al obtener estadísticas del dashboard: {e}")
        return jsonify({'error': str(e)}), 500

@app.route('/api/dashboard/chart-data')
def api_dashboard_chart_data():
    try:
        registros = obtener_registros()
        if not registros:
            return jsonify({
                'registros_por_fecha': [],
                'peso_por_edad': [],
                'altura_por_genero': {},
                'ejercicios_por_mes': []
            })
        
        df = pd.DataFrame(registros)
        
        # Verificar que las columnas necesarias existan
        columnas_requeridas = ['fecha_hora', 'edad', 'peso_corporal', 'altura', 'genero', 'tipo_ejercicio']
        columnas_faltantes = [col for col in columnas_requeridas if col not in df.columns]
        
        if columnas_faltantes:
            logger.warning(f"Columnas faltantes en los datos: {columnas_faltantes}")
            # En lugar de fallar, devolver datos por defecto
            return jsonify({
                'registros_por_fecha': [],
                'peso_por_edad': [],
                'altura_por_genero': {},
                'ejercicios_por_mes': []
            })
        
        try:
            df['fecha_hora'] = pd.to_datetime(df['fecha_hora'])
            df['fecha'] = df['fecha_hora'].dt.date
            df['mes'] = df['fecha_hora'].dt.to_period('M')
        except Exception as e:
            logger.warning(f"Error al procesar fechas: {e}")
            return jsonify({
                'registros_por_fecha': [],
                'peso_por_edad': [],
                'altura_por_genero': {},
                'ejercicios_por_mes': []
            })
        
        # Registros por fecha (últimos 30 días)
        fecha_actual = datetime.now().date()
        fecha_inicio = fecha_actual - timedelta(days=30)
        
        registros_por_fecha = df[df['fecha'] >= fecha_inicio].groupby('fecha').size().reset_index()
        registros_por_fecha.columns = ['fecha', 'cantidad']
        registros_por_fecha['fecha'] = registros_por_fecha['fecha'].astype(str)
        
        # Peso por edad (scatter plot)
        peso_por_edad = df[['edad', 'peso_corporal']].dropna().to_dict('records')
        
        # Altura por género
        altura_por_genero = df.groupby('genero')['altura'].mean().to_dict()
        
        # Ejercicios por mes
        ejercicios_por_mes = df.groupby(['mes', 'tipo_ejercicio']).size().reset_index()
        ejercicios_por_mes.columns = ['mes', 'ejercicio', 'cantidad']
        ejercicios_por_mes['mes'] = ejercicios_por_mes['mes'].astype(str)
        
        return jsonify({
            'registros_por_fecha': registros_por_fecha.to_dict('records'),
            'peso_por_edad': peso_por_edad,
            'altura_por_genero': altura_por_genero,
            'ejercicios_por_mes': ejercicios_por_mes.to_dict('records')
        })
    except Exception as e:
        logger.error(f"Error al obtener datos de gráficos: {e}")
        return jsonify({'error': str(e)}), 500

@app.route('/api/dashboard/recent-registros')
def api_recent_registros():
    try:
        registros = obtener_registros()
        if not registros:
            return jsonify([])
        
        df = pd.DataFrame(registros)
        
        # Verificar que las columnas necesarias existan
        columnas_requeridas = ['id', 'fecha_hora', 'nombre_completo', 'edad', 'genero', 'tipo_ejercicio', 'nivel_riesgo']
        columnas_faltantes = [col for col in columnas_requeridas if col not in df.columns]
        
        if columnas_faltantes:
            logger.warning(f"Columnas faltantes en los datos: {columnas_faltantes}")
            # En lugar de fallar, devolver lista vacía
            return jsonify([])
        
        try:
            df['fecha_hora'] = pd.to_datetime(df['fecha_hora'])
            
            # Obtener los 10 registros más recientes
            registros_recientes = df.nlargest(10, 'fecha_hora')[columnas_requeridas]
            registros_recientes['fecha_hora'] = registros_recientes['fecha_hora'].dt.strftime('%d/%m/%Y %H:%M')
            
            return jsonify(registros_recientes.to_dict('records'))
        except Exception as e:
            logger.warning(f"Error al procesar fechas: {e}")
            return jsonify([])
    except Exception as e:
        logger.error(f"Error al obtener registros recientes: {e}")
        return jsonify([])

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