import requests
import os
from dotenv import load_dotenv

load_dotenv()

API_URL = os.getenv("API_URL")

def enviar_a_api(datos_json):
    try:
        # Si no hay API_URL configurada, simular respuesta
        if not API_URL:
            return {
                "resumen": {
                    "resumen_fisiologico": datos_json.get("resumen_fisiologico", {}),
                    "resumen_biomecanico": datos_json.get("resumen_biomecanico", {})
                }
            }
        
        response = requests.post(API_URL, json=datos_json)
        return response.json()
    except Exception as e:
        # Fallback: devolver los datos de entrada como respuesta simulada
        return {
            "resumen": {
                "resumen_fisiologico": datos_json.get("resumen_fisiologico", {}),
                "resumen_biomecanico": datos_json.get("resumen_biomecanico", {})
            }
        }
