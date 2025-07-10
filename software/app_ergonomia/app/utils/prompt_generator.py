# ergonomia_app/utils/prompt_generator.py
def generar_prompt_evaluacion(resumen):
    fisiologico = resumen['resumen_fisiologico']
    biomecanico = resumen['resumen_biomecanico']

    prompt = f"""
Eres un sistema experto en ergonomía laboral y salud ocupacional.

Se ha realizado una simulación de levantamiento de carga dividida en dos tiempos:
- T1: bajar a recoger la caja.
- T2: subir la caja hasta la cintura.

Para cada tiempo se capturaron datos fisiológicos y biomecánicos usando un traje háptico (Tesla Suit).
Tu tarea es:
1. Evaluar el esfuerzo físico y los riesgos ergonómicos.
2. Predecir posibles lesiones o tensiones musculoesqueléticas.
3. Prescribir recomendaciones para mejorar la postura, técnica o prevenir riesgos laborales.

---

🔎 Fisiología:
{fisiologico}

🦾 Biomecánica:
{biomecanico}

---

💡 Por favor, genera una evaluación clara, predicción de riesgos y una prescripción ergonómica basada en los datos.
"""
    return prompt.strip()
