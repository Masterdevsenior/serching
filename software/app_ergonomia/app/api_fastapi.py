# app/api_fastapi.py

from fastapi import FastAPI, Request
from pydantic import BaseModel
from typing import Dict
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

# Opcional: permitir acceso desde frontend (Streamlit)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # O especifica ["http://localhost:8501"]
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class EntradaAnalisis(BaseModel):
    resumen: Dict

@app.post("/analizar")
def analizar(data: EntradaAnalisis):
    resumen = data.resumen
    # Aquí podrías hacer validación, análisis u otras operaciones
    return {"resumen": resumen}
