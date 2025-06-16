import psycopg2
from psycopg2 import Error
from flask import request
from datetime import datetime
import os
from dotenv import load_dotenv
import logging

# Configurar logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

load_dotenv()

DB_HOST = os.getenv('DB_HOST', 'localhost')
DB_PORT = os.getenv('DB_PORT', '5432')
DB_NAME = os.getenv('DB_NAME', 'formulario_protocolo_tesla')
DB_USER = os.getenv('DB_USER', 'postgres')
DB_PASSWORD = os.getenv('DB_PASSWORD', 'postgres')


def get_db_connection():
    try:
        logger.info(f"Intentando conectar a la base de datos: {DB_NAME} en {DB_HOST}:{DB_PORT}")
        conn = psycopg2.connect(
            dbname=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD,
            host=DB_HOST,
            port=DB_PORT,
            client_encoding='UTF8',
            options='-c client_encoding=UTF8'
        )
        logger.info("Conexión exitosa a la base de datos")
        return conn
    except Error as e:
        logger.error(f"Error al conectar a la base de datos: {e}")
        logger.error(f"Detalles de conexión: host={DB_HOST}, port={DB_PORT}, dbname={DB_NAME}, user={DB_USER}")
        return None


def eliminar_tabla():
    conn = get_db_connection()
    c = conn.cursor()
    try:
        c.execute('DROP TABLE IF EXISTS protocolo_medicion')
        conn.commit()
    except Exception as e:
        conn.rollback()
        raise e
    finally:
        c.close()
        conn.close()


def crear_tabla():
    conn = None
    cursor = None
    try:
        logger.info("=== INICIO DE CREACIÓN DE TABLA ===")
        
        # Primero intentamos conectar a postgres
        logger.info("Conectando a la base de datos postgres...")
        conn = psycopg2.connect(
            dbname="postgres",
            user=DB_USER,
            password=DB_PASSWORD,
            host=DB_HOST,
            port=DB_PORT
        )
        conn.autocommit = True  # Importante para crear la base de datos
        cursor = conn.cursor()
        
        # Verificar si la base de datos existe
        cursor.execute("SELECT 1 FROM pg_database WHERE datname = %s", (DB_NAME,))
        if not cursor.fetchone():
            logger.info(f"Creando base de datos {DB_NAME}...")
            cursor.execute(f"CREATE DATABASE {DB_NAME} WITH ENCODING 'UTF8'")
            logger.info(f"Base de datos {DB_NAME} creada exitosamente")
        
        cursor.close()
        conn.close()
        
        # Ahora conectamos a la base de datos específica
        logger.info(f"Conectando a la base de datos {DB_NAME}...")
        conn = psycopg2.connect(
            dbname=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD,
            host=DB_HOST,
            port=DB_PORT,
            client_encoding='UTF8'
        )
        cursor = conn.cursor()
        
        # Verificar si la tabla existe
        cursor.execute("""
            SELECT EXISTS (
                SELECT FROM information_schema.tables 
                WHERE table_schema = 'public' 
                AND table_name = 'protocolo_medicion'
            )
        """)
        tabla_existe = cursor.fetchone()[0]
        
        if tabla_existe:
            logger.info("La tabla protocolo_medicion ya existe")
            return True
        
        # Crear la tabla
        logger.info("Creando tabla protocolo_medicion...")
        cursor.execute("""
            CREATE TABLE protocolo_medicion (
                id SERIAL PRIMARY KEY,
                fecha_hora TIMESTAMP NOT NULL,
                nombre_completo VARCHAR(100) NOT NULL,
                edad INTEGER CHECK (edad > 0 AND edad <= 120),
                genero VARCHAR(20) NOT NULL,
                peso_corporal DECIMAL(5,2) CHECK (peso_corporal > 0),
                altura DECIMAL(5,2) CHECK (altura > 0),
                longitud_brazo DECIMAL(5,2) CHECK (longitud_brazo > 0),
                longitud_pierna DECIMAL(5,2) CHECK (longitud_pierna > 0),
                longitud_torso DECIMAL(5,2) CHECK (longitud_torso > 0),
                antecedentes_lesiones BOOLEAN,
                limitaciones_movilidad BOOLEAN,
                experiencia_levantamiento BOOLEAN,
                sin_contraindicaciones BOOLEAN,
                ajuste_traje BOOLEAN,
                calibracion_sincronizada BOOLEAN,
                sensores_posicion BOOLEAN,
                tipo_ejercicio VARCHAR(50) NOT NULL,
                nivel_riesgo VARCHAR(20) NOT NULL,
                peso_carga DECIMAL(5,2) CHECK (peso_carga > 0),
                duracion_minutos INTEGER CHECK (duracion_minutos > 0),
                num_repeticiones INTEGER CHECK (num_repeticiones > 0),
                forma_objeto VARCHAR(50),
                velocidad_movimiento VARCHAR(50),
                tipo_superficie VARCHAR(50)
            )
        """)
        
        conn.commit()
        
        # Verificar que la tabla se haya creado
        cursor.execute("""
            SELECT EXISTS (
                SELECT FROM information_schema.tables 
                WHERE table_schema = 'public' 
                AND table_name = 'protocolo_medicion'
            )
        """)
        if cursor.fetchone()[0]:
            logger.info("Tabla protocolo_medicion creada y verificada exitosamente")
            logger.info("=== FIN DE CREACIÓN DE TABLA ===")
            return True
        else:
            logger.error("La tabla no se creó correctamente")
            return False
            
    except Error as e:
        logger.error(f"Error al crear la tabla: {e}")
        if conn:
            conn.rollback()
        return False
    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()


def guardar_datos(datos_form):
    conn = None
    cursor = None
    try:
        # Log de los datos recibidos
        logger.info("=== INICIO DE GUARDADO DE DATOS ===")
        logger.info(f"Datos recibidos del formulario: {datos_form}")
        
        # Validación inicial de datos requeridos
        campos_requeridos = [
            'fecha_hora', 'nombre_completo', 'edad', 'genero', 
            'peso_corporal', 'altura', 'longitud_brazo', 'longitud_pierna',
            'longitud_torso', 'tipo_ejercicio', 'nivel_riesgo', 'peso_carga',
            'duracion_minutos', 'num_repeticiones'
        ]
        
        # Verificar campos faltantes
        campos_faltantes = [campo for campo in campos_requeridos if campo not in datos_form]
        if campos_faltantes:
            logger.error(f"Campos requeridos faltantes: {campos_faltantes}")
            return False

        conn = get_db_connection()
        if conn is None:
            logger.error("No se pudo establecer conexión con la base de datos")
            return False
        
        cursor = conn.cursor()
        
        # Convertir los datos del formulario a un diccionario mutable
        datos = dict(datos_form)
        logger.info(f"Datos a guardar: {datos}")
        
        # Validación y conversión de datos
        try:
            # Validar y convertir fecha_hora
            datos['fecha_hora'] = datetime.strptime(datos['fecha_hora'], '%Y-%m-%dT%H:%M')
            logger.info(f"Fecha convertida: {datos['fecha_hora']}")
            
            # Validar y convertir valores numéricos
            datos['edad'] = int(datos['edad'])
            if not (0 < datos['edad'] <= 120):
                logger.error("La edad debe estar entre 1 y 120 años")
                return False
                
            datos['peso_corporal'] = float(datos['peso_corporal'])
            if datos['peso_corporal'] <= 0:
                logger.error("El peso corporal debe ser mayor a 0")
                return False
                
            datos['altura'] = float(datos['altura'])
            if datos['altura'] <= 0:
                logger.error("La altura debe ser mayor a 0")
                return False

            datos['longitud_brazo'] = float(datos['longitud_brazo'])
            if datos['longitud_brazo'] <= 0:
                logger.error("La longitud del brazo debe ser mayor a 0")
                return False

            datos['longitud_pierna'] = float(datos['longitud_pierna'])
            if datos['longitud_pierna'] <= 0:
                logger.error("La longitud de la pierna debe ser mayor a 0")
                return False

            datos['longitud_torso'] = float(datos['longitud_torso'])
            if datos['longitud_torso'] <= 0:
                logger.error("La longitud del torso debe ser mayor a 0")
                return False
                
            datos['peso_carga'] = float(datos['peso_carga'])
            if datos['peso_carga'] <= 0:
                logger.error("El peso de carga debe ser mayor a 0")
                return False
                
            datos['duracion_minutos'] = int(datos['duracion_minutos'])
            if datos['duracion_minutos'] <= 0:
                logger.error("La duración debe ser mayor a 0")
                return False
                
            datos['num_repeticiones'] = int(datos['num_repeticiones'])
            if datos['num_repeticiones'] <= 0:
                logger.error("El número de repeticiones debe ser mayor a 0")
                return False

            # Validar tipo_ejercicio
            if 'tipo_ejercicio' not in datos or not datos['tipo_ejercicio']:
                logger.error("El tipo de ejercicio es requerido")
                return False
            logger.info(f"Tipo de ejercicio recibido: {datos['tipo_ejercicio']}")
                
        except ValueError as e:
            logger.error(f"Error en la conversión de datos: {e}")
            return False
        
        # Convertir campos booleanos
        campos_booleanos = [
            'antecedentes_lesiones',
            'limitaciones_movilidad',
            'experiencia_levantamiento',
            'sin_contraindicaciones',
            'ajuste_traje',
            'calibracion_sincronizada',
            'sensores_posicion'
        ]
        
        for campo in campos_booleanos:
            # Verificar si el campo existe y tiene un valor
            if campo in datos:
                # Convertir a booleano considerando diferentes valores posibles
                valor = datos[campo]
                if isinstance(valor, str):
                    datos[campo] = valor.lower() in ['true', '1', 'yes', 'on', 'si', 'sí']
                else:
                    datos[campo] = bool(valor)
                logger.info(f"Campo {campo} valor original: {valor}, convertido a: {datos[campo]}")
            else:
                # Si el campo no existe, establecer como False
                datos[campo] = False
                logger.info(f"Campo {campo} no encontrado, establecido como: {datos[campo]}")
        
        # Asegurar que los campos de texto tengan valores por defecto si no están presentes
        campos_texto = ['forma_objeto', 'velocidad_movimiento', 'tipo_superficie']
        for campo in campos_texto:
            if campo not in datos or not datos[campo]:
                datos[campo] = ''
            logger.info(f"Campo {campo} valor: {datos[campo]}")
        
        # Preparar la consulta SQL
        query = """
            INSERT INTO protocolo_medicion (
                fecha_hora, nombre_completo, edad, genero, peso_corporal,
                altura, longitud_brazo, longitud_pierna, longitud_torso,
                antecedentes_lesiones, limitaciones_movilidad, experiencia_levantamiento,
                sin_contraindicaciones, ajuste_traje, calibracion_sincronizada,
                sensores_posicion, tipo_ejercicio, nivel_riesgo, peso_carga,
                duracion_minutos, num_repeticiones, forma_objeto,
                velocidad_movimiento, tipo_superficie
            ) VALUES (
                %(fecha_hora)s, %(nombre_completo)s, %(edad)s, %(genero)s,
                %(peso_corporal)s, %(altura)s, %(longitud_brazo)s, %(longitud_pierna)s,
                %(longitud_torso)s, %(antecedentes_lesiones)s, %(limitaciones_movilidad)s,
                %(experiencia_levantamiento)s, %(sin_contraindicaciones)s, %(ajuste_traje)s,
                %(calibracion_sincronizada)s, %(sensores_posicion)s, %(tipo_ejercicio)s,
                %(nivel_riesgo)s, %(peso_carga)s, %(duracion_minutos)s,
                %(num_repeticiones)s, %(forma_objeto)s, %(velocidad_movimiento)s,
                %(tipo_superficie)s
            )
        """
        logger.info(f"Query SQL: {query}")
        logger.info(f"Parámetros: {datos}")
        
        cursor.execute(query, datos)
        conn.commit()
        logger.info("Datos guardados exitosamente")
        logger.info("=== FIN DE GUARDADO DE DATOS ===")
        return True
    except Error as e:
        logger.error(f"Error al guardar los datos: {e}")
        if conn:
            conn.rollback()
        return False
    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()


def obtener_registros():
    conn = None
    cursor = None
    try:
        conn = get_db_connection()
        if conn is None:
            return []
        
        cursor = conn.cursor()
        cursor.execute("""
            SELECT * FROM protocolo_medicion 
            ORDER BY fecha_hora DESC
        """)
        
        columnas = [desc[0] for desc in cursor.description]
        registros = []
        
        for row in cursor.fetchall():
            registro = dict(zip(columnas, row))
            # Convertir datetime a string para serialización
            if 'fecha_hora' in registro and isinstance(registro['fecha_hora'], datetime):
                registro['fecha_hora'] = registro['fecha_hora'].strftime('%Y-%m-%d %H:%M:%S')
            registros.append(registro)
        
        return registros
    except Error as e:
        logger.error(f"Error al obtener registros: {e}")
        return []
    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()


def eliminar_registro(id):
    conn = None
    cursor = None
    try:
        conn = get_db_connection()
        if conn is None:
            return False
        
        cursor = conn.cursor()
        cursor.execute("DELETE FROM protocolo_medicion WHERE id = %s", (id,))
        
        if cursor.rowcount == 0:
            return False
        
        conn.commit()
        return True
    except Error as e:
        print(f"Error al eliminar el registro: {e}")
        if conn:
            conn.rollback()
        return False
    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()


def obtener_fechas_disponibles():
    conn = None
    cursor = None
    try:
        conn = get_db_connection()
        if conn is None:
            return []
        
        cursor = conn.cursor()
        cursor.execute("""
            SELECT DISTINCT DATE(fecha_hora) as fecha
            FROM protocolo_medicion
            ORDER BY fecha DESC
        """)
        
        fechas = [row[0] for row in cursor.fetchall()]
        return fechas
    except Error as e:
        print(f"Error al obtener fechas disponibles: {e}")
        return []
    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()


def obtener_registros_por_fecha(fecha):
    conn = None
    cursor = None
    try:
        conn = get_db_connection()
        if conn is None:
            return []
        
        cursor = conn.cursor()
        cursor.execute("""
            SELECT * FROM protocolo_medicion 
            WHERE DATE(fecha_hora) = %s
            ORDER BY fecha_hora DESC
        """, (fecha,))
        
        columnas = [desc[0] for desc in cursor.description]
        registros = []
        
        for row in cursor.fetchall():
            registro = dict(zip(columnas, row))
            registros.append(registro)
        
        return registros
    except Error as e:
        logger.error(f"Error al obtener registros por fecha: {e}")
        return []
    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()


