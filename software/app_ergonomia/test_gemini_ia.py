import time
from app.utils.gemini_client import obtener_respuesta_ia

prompt = "Eres un sistema experto en ergonomía laboral. Analiza estos datos: frecuencia cardíaca promedio: 85, HRV_rmssd: 45, flexión rodilla derecha: 60. ¿Qué riesgos ves y qué recomendarías?"

print("Enviando prompt de prueba a Google Gemini (modelo gemini-2.5-pro)...")
start = time.time()
respuesta = obtener_respuesta_ia(prompt, timeout=10)
end = time.time()
print(f"\nRespuesta de la IA (tiempo transcurrido: {end-start:.2f} segundos):")
print(respuesta) 