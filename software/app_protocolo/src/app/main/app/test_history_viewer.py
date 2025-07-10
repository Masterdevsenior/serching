#!/usr/bin/env python3
"""
Visor del historial de pruebas con interfaz web
"""

import json
import os
from datetime import datetime
from pathlib import Path
from flask import Flask, render_template, jsonify, send_file
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
import io
import base64

app = Flask(__name__)

def load_test_history():
    """Cargar historial de pruebas"""
    history_file = Path("test_history.json")
    if history_file.exists():
        try:
            with open(history_file, 'r', encoding='utf-8') as f:
                return json.load(f)
        except:
            return []
    return []

def get_latest_report():
    """Obtener el reporte más reciente"""
    reports_dir = Path("test_reports")
    latest_report = reports_dir / "latest_report.html"
    
    if latest_report.exists():
        return latest_report.read_text(encoding='utf-8')
    return None

def generate_trend_chart():
    """Generar gráfico de tendencias"""
    history = load_test_history()
    
    if not history:
        return None
    
    # Preparar datos
    dates = []
    success_rates = []
    total_tests = []
    durations = []
    
    for entry in history[-20:]:  # Últimas 20 ejecuciones
        try:
            date = datetime.fromisoformat(entry['timestamp'])
            dates.append(date)
            
            # Calcular tasa de éxito general
            total_passed = sum(suite['passed_tests'] for suite in entry['results'].values())
            total_test_count = sum(suite['total_tests'] for suite in entry['results'].values())
            
            if total_test_count > 0:
                success_rate = (total_passed / total_test_count) * 100
            else:
                success_rate = 0
            
            success_rates.append(success_rate)
            total_tests.append(total_test_count)
            durations.append(entry['total_duration'])
        except:
            continue
    
    if not dates:
        return None
    
    # Crear gráfico
    fig, (ax1, ax2, ax3) = plt.subplots(3, 1, figsize=(12, 10))
    
    # Gráfico de tasa de éxito
    ax1.plot(dates, success_rates, 'b-o', linewidth=2, markersize=6)
    ax1.set_ylabel('Tasa de Éxito (%)')
    ax1.set_title('Tendencia de Tasa de Éxito')
    ax1.grid(True, alpha=0.3)
    ax1.set_ylim(0, 100)
    
    # Gráfico de número de pruebas
    ax2.plot(dates, total_tests, 'g-o', linewidth=2, markersize=6)
    ax2.set_ylabel('Número de Pruebas')
    ax2.set_title('Evolución del Número de Pruebas')
    ax2.grid(True, alpha=0.3)
    
    # Gráfico de duración
    ax3.plot(dates, durations, 'r-o', linewidth=2, markersize=6)
    ax3.set_ylabel('Duración (segundos)')
    ax3.set_title('Tiempo de Ejecución')
    ax3.grid(True, alpha=0.3)
    
    # Formatear fechas
    for ax in [ax1, ax2, ax3]:
        ax.xaxis.set_major_formatter(mdates.DateFormatter('%d/%m'))
        ax.xaxis.set_major_locator(mdates.DayLocator(interval=1))
        plt.setp(ax.xaxis.get_majorticklabels(), rotation=45)
    
    plt.tight_layout()
    
    # Convertir a base64
    img_buffer = io.BytesIO()
    plt.savefig(img_buffer, format='png', dpi=300, bbox_inches='tight')
    img_buffer.seek(0)
    img_base64 = base64.b64encode(img_buffer.getvalue()).decode()
    plt.close()
    
    return img_base64

@app.route('/')
def index():
    """Página principal del visor de historial"""
    history = load_test_history()
    latest_report = get_latest_report()
    trend_chart = generate_trend_chart()
    
    # Calcular estadísticas generales
    total_executions = len(history)
    if history:
        latest_execution = history[-1]
        latest_success_rate = sum(suite['success_rate'] for suite in latest_execution['results'].values()) / len(latest_execution['results'])
        latest_duration = latest_execution['total_duration']
    else:
        latest_success_rate = 0
        latest_duration = 0
    
    return render_template('test_history.html',
                         history=history,
                         latest_report=latest_report,
                         trend_chart=trend_chart,
                         total_executions=total_executions,
                         latest_success_rate=latest_success_rate,
                         latest_duration=latest_duration)

@app.route('/api/history')
def api_history():
    """API para obtener historial en formato JSON"""
    history = load_test_history()
    return jsonify(history)

@app.route('/api/stats')
def api_stats():
    """API para obtener estadísticas del historial"""
    history = load_test_history()
    
    if not history:
        return jsonify({
            'total_executions': 0,
            'average_success_rate': 0,
            'average_duration': 0,
            'best_execution': None,
            'worst_execution': None
        })
    
    # Calcular estadísticas
    success_rates = []
    durations = []
    
    for entry in history:
        total_passed = sum(suite['passed_tests'] for suite in entry['results'].values())
        total_test_count = sum(suite['total_tests'] for suite in entry['results'].values())
        
        if total_test_count > 0:
            success_rate = (total_passed / total_test_count) * 100
        else:
            success_rate = 0
        
        success_rates.append(success_rate)
        durations.append(entry['total_duration'])
    
    # Encontrar mejor y peor ejecución
    best_idx = success_rates.index(max(success_rates))
    worst_idx = success_rates.index(min(success_rates))
    
    return jsonify({
        'total_executions': len(history),
        'average_success_rate': sum(success_rates) / len(success_rates),
        'average_duration': sum(durations) / len(durations),
        'best_execution': {
            'timestamp': history[best_idx]['timestamp'],
            'success_rate': success_rates[best_idx],
            'duration': durations[best_idx]
        },
        'worst_execution': {
            'timestamp': history[worst_idx]['timestamp'],
            'success_rate': success_rates[worst_idx],
            'duration': durations[worst_idx]
        }
    })

@app.route('/report/<timestamp>')
def view_report(timestamp):
    """Ver reporte específico"""
    reports_dir = Path("test_reports")
    report_file = reports_dir / f"test_report_{timestamp}.html"
    
    if report_file.exists():
        return send_file(report_file, mimetype='text/html')
    else:
        return "Reporte no encontrado", 404

if __name__ == '__main__':
    app.run(debug=True, port=5001) 