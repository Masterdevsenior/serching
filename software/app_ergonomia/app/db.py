from sqlalchemy import create_engine, Table, Column, String, JSON, MetaData
import os
from dotenv import load_dotenv

load_dotenv()

DB_HOST = os.getenv('DB_HOST', 'localhost')
DB_PORT = os.getenv('DB_PORT', '5432')
DB_NAME = os.getenv('DB_NAME', 'tesla_ergonomia')
DB_USER = os.getenv('DB_USER', 'postgres')
DB_PASSWORD = os.getenv('DB_PASSWORD', '')


def get_engine():
    try:
        # Conexión a PostgreSQL usando variables de entorno
        url = f"postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
        return create_engine(url)
    except Exception as e:
        print(f"Error conectando a PostgreSQL: {e}")
        # Fallback a SQLite
        try:
            os.makedirs("../data", exist_ok=True)
            return create_engine("sqlite:///../data/resultados.db")
        except Exception as e:
            print(f"Error creando engine SQLite: {e}")
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
except Exception as e:
    print(f"Error creando tablas: {e}")

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
        print(f"Error guardando resultado: {e}")
        return False
