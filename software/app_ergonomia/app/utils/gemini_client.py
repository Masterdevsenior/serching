# ergonomia_app/utils/gemini_client.py
import requests
import time

def obtener_respuesta_ia(prompt, timeout=30):
    """
    Obtener respuesta de Gemini con timeout y mejor manejo de errores
    """
    try:
        API_KEY = "AIzaSyCVm43BHsLAfuL7FuMI_pe-RAgchaog4Vw"
        url = f"https://generativelanguage.googleapis.com/v1/models/gemini-1.5-flash:generateContent?key={API_KEY}"


        headers = {"Content-Type": "application/json"}
        data = {
            "contents": [
                {
                    "parts": [
                        {"text": prompt}
                    ]
                }
            ]
        }

        # Agregar timeout para evitar que la app se cuelgue
        response = requests.post(url, headers=headers, json=data, timeout=timeout)
        
        if response.status_code == 200:
            try:
                result = response.json()
                if 'candidates' in result and len(result['candidates']) > 0:
                    return result['candidates'][0]['content']['parts'][0]['text']
                else:
                    return "No se pudo obtener una respuesta válida del modelo."
            except Exception as e:
                return f"Error procesando respuesta: {str(e)}"
        else:
            return f"Error {response.status_code}: {response.text}"
            
    except requests.exceptions.Timeout:
        return "Error: Timeout - La solicitud tardó demasiado en responder."
    except requests.exceptions.ConnectionError:
        return "Error: No se pudo conectar con el servicio de IA."
    except Exception as e:
        return f"Error inesperado: {str(e)}"
