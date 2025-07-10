@echo off
REM Script de arranque para la aplicación ICC

REM Instalar dependencias
pip install -r requirements.txt

REM Ejecutar la aplicación Streamlit
echo Iniciando la aplicación...
streamlit run app.py 