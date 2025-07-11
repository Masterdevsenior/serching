from sqlalchemy import create_engine, Table, Column, String, JSON, MetaData
import os
from dotenv import load_dotenv
from infrastructure.logger import logger

load_dotenv()

DB_HOST = os.getenv('DB_HOST', 'localhost')
DB_PORT = os.getenv('DB_PORT', '5432')
DB_NAME = os.getenv('DB_NAME', 'tesla_ergonomia')
DB_USER = os.getenv('DB_USER', 'postgres')
DB_PASSWORD = os.getenv('DB_PASSWORD', '1126254560')

logger.info(f"Intentando conectar a PostgreSQL con: host={DB_HOST}, port={DB_PORT}, db={DB_NAME}, user={DB_USER}")

def get_engine():
    try:
        url = f"postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
        logger.info(f"URL de conexión PostgreSQL: {url}")
        return create_engine(url)
    except Exception as e:
        logger.error(f"Error conectando a PostgreSQL: {e}")
        # Fallback a SQLite
        try:
            os.makedirs("../data", exist_ok=True)
            logger.info("Intentando fallback a SQLite en ../data/resultados.db")
            return create_engine("sqlite:///../data/resultados.db")
        except Exception as e:
            logger.error(f"Error creando engine SQLite: {e}")
            logger.info("Intentando fallback a SQLite en resultados.db (local)")
            return create_engine("sqlite:///resultados.db")

engine = get_engine()
metadata = MetaData()

resultados = Table("resultados", metadata,
    Column("id", String, primary_key=True),
    Column("sujeto", String),
    Column("simulacion", String),
    Column("data", JSON)
)

try:
    metadata.create_all(engine)
    logger.info("Tablas creadas/verificadas correctamente.")
except Exception as e:
    logger.error(f"Error creando tablas: {e}")

def guardar_resultado(sujeto, simulacion, data):
    try:
        with engine.connect() as conn:
            conn.execute(resultados.insert().values(
                id=f"{sujeto}_{simulacion}",
                sujeto=sujeto,
                simulacion=simulacion,
                data=data
            ))
            conn.commit()
        return True
    except Exception as e:
        logger.error(f"Error guardando resultado: {e}")
        return False

def obtener_descripcion_variable(nombre_variable):
    """Obtiene la descripción de una variable desde la base de datos (tabla 'descripciones')."""
    try:
        with engine.connect() as conn:
            result = conn.execute(
                "SELECT descripcion FROM descripciones WHERE variable = ? OR variable = ? LIMIT 1",
                (nombre_variable, nombre_variable.lower())
            )
            row = result.fetchone()
            if row:
                return row[0]
    except Exception as e:
        logger.error(f"Error obteniendo descripción de variable '{nombre_variable}': {e}")
    return "-"
