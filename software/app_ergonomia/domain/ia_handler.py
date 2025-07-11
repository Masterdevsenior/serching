import streamlit as st
from app.utils.gemini_client import obtener_respuesta_ia
from infrastructure.logger import logger

def generar_informe_ia(resumen_fisiologico, resumen_biomecanico):
    """
    Genera el informe de IA usando Gemini y retorna (informe, logs depuración)
    """
    prompt = f"""
Eres un experto en ergonomía y salud ocupacional.
Objetivo: Análisis de información de fisiología y biomecánica para identificar riesgos ergonómicos, prescripción ergonómica y recomendaciones.

Analiza los siguientes resultados grupales:
---
Fisiología (promedio):\n{resumen_fisiologico}
---
Parámetros biomecánicos:\n{resumen_biomecanico}
---
Genera un informe profesional, breve y claro, que incluya:
- Identificación de riesgos ergonómicos
- Prescripción ergonómica
- Recomendaciones prácticas
(No uses formato markdown, responde solo en texto plano para un informe PDF.)
"""
    logger.info("Prompt enviado a Gemini:\n%s", prompt)
    respuesta_ia = None
    error_ia = None
    logs = []
    try:
        respuesta_ia = obtener_respuesta_ia(prompt, timeout=60)
        logger.info("Respuesta de Gemini recibida (longitud %d):\n%s", len(str(respuesta_ia)) if respuesta_ia else 0, repr(respuesta_ia))
    except Exception as e:
        error_ia = str(e)
        logger.error("Excepción capturada en llamada a Gemini: %s", error_ia)
        logs.append(f"❌ Excepción capturada en llamada a Gemini: {error_ia}")
    logs.append(f"Tipo: {type(respuesta_ia)}")
    logs.append(f"Longitud: {len(str(respuesta_ia)) if respuesta_ia else 0}")
    logs.append(f"Contenido: {repr(respuesta_ia)}")
    logger.info("Estado final de informe_ia: %s", 'OK' if respuesta_ia else 'None/Error')
    if error_ia:
        return None, logs
    if respuesta_ia and not str(respuesta_ia).lower().startswith("error"):
        return respuesta_ia, logs
    else:
        logs.append(f"❌ Error en la respuesta de IA: {respuesta_ia}")
        logger.error("Error en la respuesta de IA: %s", respuesta_ia)
        return None, logs 