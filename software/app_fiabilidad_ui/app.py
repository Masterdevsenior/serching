import streamlit as st
import sys
import os

# Agregar el directorio raíz al path para importar módulos
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

# Configurar logging
from config.logging_config import setup_logging
setup_logging(level="INFO")

from dotenv import load_dotenv
load_dotenv()

from presentation_layer.streamlit_app import main

if __name__ == "__main__":
    try:
        main()
    except Exception as e:
        st.error(f"❌ Error crítico en la aplicación: {e}")
        st.info("💡 Verifica que todas las dependencias estén instaladas correctamente") 