from fpdf import FPDF
from datetime import datetime
from io import BytesIO

def generar_pdf(fisio, biomecanica):
    pdf = FPDF()
    pdf.add_page()
    
    # Título
    pdf.set_font("Arial", "B", 16)
    pdf.cell(200, 10, "Reporte de Evaluacion Ergonomia", ln=True, align="C")
    pdf.cell(200, 10, f"Fecha: {datetime.now().strftime('%d/%m/%Y %H:%M')}", ln=True, align="C")
    pdf.ln(10)

    # Sección fisiológica
    pdf.set_font("Arial", "B", 14)
    pdf.cell(200, 10, "Parametros fisiologicos:", ln=True)
    pdf.set_font("Arial", "", 12)
    
    for k, v in fisio.items():
        if isinstance(v, (int, float)):
            pdf.cell(200, 8, f"{k}: {v}", ln=True)
        else:
            pdf.cell(200, 8, f"{k}: {v}", ln=True)

    pdf.ln(10)
    
    # Sección biomecánica
    pdf.set_font("Arial", "B", 14)
    pdf.cell(200, 10, "Parametros biomecanicos:", ln=True)
    pdf.set_font("Arial", "", 12)
    
    # Ángulos principales
    angulos_principales = [
        "KneeFlexExtR.angle", "KneeFlexExtL.angle", 
        "HipFlexExtR.angle", "HipFlexExtL.angle",
        "TrunkFlexExt.angle", "PelvisTilt.angle"
    ]
    
    for k in angulos_principales:
        valor = biomecanica.get(k, 'NA')
        pdf.cell(200, 8, f"{k}: {valor} grados", ln=True)
    
    pdf.ln(10)
    
    # Análisis de riesgo
    pdf.set_font("Arial", "B", 14)
    pdf.cell(200, 10, "Analisis de riesgo ergonomico:", ln=True)
    pdf.set_font("Arial", "", 12)
    
    riesgos = []
    if biomecanica.get('KneeFlexExtR.angle', 0) > 60:
        riesgos.append("Flexion excesiva de rodilla derecha")
    if biomecanica.get('KneeFlexExtL.angle', 0) > 60:
        riesgos.append("Flexion excesiva de rodilla izquierda")
    if biomecanica.get('TrunkFlexExt.angle', 0) > 30:
        riesgos.append("Flexion excesiva del tronco")
    if biomecanica.get('PelvisTilt.angle', 0) > 15:
        riesgos.append("Inclinacion excesiva de la pelvis")
    
    if riesgos:
        for riesgo in riesgos:
            pdf.cell(200, 8, f"Riesgo: {riesgo}", ln=True)
    else:
        pdf.cell(200, 8, "No se detectaron riesgos ergonomicos significativos", ln=True)

    pdf.ln(10)
    
    # Recomendaciones
    pdf.set_font("Arial", "B", 14)
    pdf.cell(200, 10, "Recomendaciones generales:", ln=True)
    pdf.set_font("Arial", "", 12)
    pdf.cell(200, 8, "• Mantener la espalda recta durante el levantamiento", ln=True)
    pdf.cell(200, 8, "• Doblar las rodillas, no la cintura", ln=True)
    pdf.cell(200, 8, "• Mantener la carga cerca del cuerpo", ln=True)
    pdf.cell(200, 8, "• Realizar pausas regulares", ln=True)

    pdf.output("reporte_ergonomia.pdf")

def generar_pdf_batch(sujeto, ejercicio, n_reg, fisio, biomecanica, informe_ia):
    pdf = FPDF()
    pdf.add_page()
    # Título
    pdf.set_font("Arial", "B", 16)
    pdf.cell(200, 10, "Reporte de Ergonomía", ln=True, align="C")
    pdf.cell(200, 10, f"Fecha: {datetime.now().strftime('%d/%m/%Y %H:%M')}", ln=True, align="C")
    pdf.ln(5)
    pdf.set_font("Arial", "", 12)
    pdf.cell(200, 8, f"Sujeto: {sujeto}", ln=True)
    pdf.cell(200, 8, f"Ejercicio: {ejercicio}", ln=True)
    pdf.cell(200, 8, f"Registros procesados: {n_reg}", ln=True)
    pdf.ln(5)
    # Sección fisiológica
    pdf.set_font("Arial", "B", 14)
    pdf.cell(200, 10, "Parámetros fisiológicos:", ln=True)
    pdf.set_font("Arial", "", 12)
    for k, v in fisio.items():
        pdf.cell(200, 8, f"{k}: {v}", ln=True)
    pdf.ln(5)
    # Sección biomecánica
    pdf.set_font("Arial", "B", 14)
    pdf.cell(200, 10, "Parámetros biomecánicos:", ln=True)
    pdf.set_font("Arial", "", 12)
    for k, v in biomecanica.items():
        pdf.cell(200, 8, f"{k}: {v}", ln=True)
    pdf.ln(5)
    # Informe IA
    if informe_ia:
        pdf.set_font("Arial", "B", 14)
        pdf.cell(200, 10, "Informe de Análisis Ergonómico:", ln=True)
        pdf.set_font("Arial", "", 12)
        for linea in informe_ia.split('\n'):
            pdf.multi_cell(0, 8, linea)
        pdf.ln(5)
    # Devolver como bytes para descarga en Streamlit
    pdf_bytes = pdf.output(dest='S').encode('latin1')
    return pdf_bytes
