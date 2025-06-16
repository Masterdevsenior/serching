-- Script de base de datos para Teslasuit en PostgreSQL
-- Primero, eliminar esquemas existentes si los hay
DROP SCHEMA IF EXISTS teslasuit CASCADE;

DROP SCHEMA IF EXISTS public CASCADE;

-- 1. Crear esquema teslasuit
CREATE SCHEMA teslasuit;

-- 2. Establecer el esquema por defecto
SET search_path TO teslasuit;

-- 3. Crear tabla general de información de tablas
CREATE TABLE teslasuit.table_info (
    table_name VARCHAR(100) PRIMARY KEY,
    table_description TEXT NOT NULL
);

-- 4. Registrar información de todas las tablas
INSERT INTO
    teslasuit.table_info (table_name, table_description)
VALUES (
        'ppghrv',
        'Tabla que contiene datos biométricos de señal PPG y métricas de HRV para un avatar en sesión de Teslasuit'
    ),
    (
        'processedppg',
        'Tabla que contiene datos fisiológicos procesados de señal PPG para un avatar durante una sesión con Teslasuit'
    ),
    (
        'rawppg',
        'Tabla que contiene la señal PPG cruda capturada por el Teslasuit, sin procesamiento, asociada a un avatar durante una sesión'
    ),
    (
        'processedmocap',
        'Tabla que almacena los datos de captura de movimiento procesados, incluyendo posiciones y rotaciones de las articulaciones'
    ),
    (
        'rawmocap',
        'Tabla que almacena los datos de captura de movimiento sin procesar, incluyendo datos de sensores y posiciones'
    ) ON CONFLICT (table_name) DO NOTHING;

-- 5. Crear tabla PpgHrv
CREATE TABLE teslasuit.ppghrv (
    frame_number INTEGER NOT NULL,
    frame_timestamp TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    mean_rr REAL NOT NULL,
    sdnn REAL NOT NULL,
    sdsd REAL NOT NULL,
    rmssd REAL NOT NULL,
    sd1 REAL NOT NULL,
    sd2 REAL NOT NULL,
    lf_hf REAL NOT NULL,
    PRIMARY KEY (frame_number, frame_timestamp)
);

-- 6. Crear tabla ProcessedPpg
CREATE TABLE teslasuit.processedppg (
    frame_number INTEGER NOT NULL,
    frame_timestamp TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    "node0.is_heartrate_valid" INTEGER NOT NULL,
    "node0.is_spo2_valid" INTEGER NOT NULL,
    "node0.heartrate" INTEGER NOT NULL,
    "node0.spo2" INTEGER NOT NULL,
    PRIMARY KEY (frame_number, frame_timestamp)
);

-- 7. Crear tabla RawPpg
CREATE TABLE teslasuit.rawppg (
    frame_number INTEGER NOT NULL,
    frame_timestamp TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    "node0.proximity" INTEGER NOT NULL,
    "node0.ambient_light_COFV" INTEGER NOT NULL,
    "node0.red_data" INTEGER NOT NULL,
    "node0.ir_data" INTEGER NOT NULL,
    "node0.green_data" INTEGER NOT NULL,
    "node0.blue_data" INTEGER NOT NULL,
    PRIMARY KEY (frame_number, frame_timestamp)
);

-- 8. Crear tabla ProcessedMocap
CREATE TABLE teslasuit.processedmocap (
    frame_number INTEGER NOT NULL,
    frame_timestamp TIMESTAMP NOT NULL,
    root_position_x FLOAT,
    root_position_y FLOAT,
    root_position_z FLOAT,
    root_rotation_w FLOAT,
    root_rotation_x FLOAT,
    root_rotation_y FLOAT,
    root_rotation_z FLOAT,
    mass_center_x REAL NOT NULL,
    mass_center_y REAL NOT NULL,
    mass_center_z REAL NOT NULL,
    left_foot_contact REAL NOT NULL,
    right_foot_contact REAL NOT NULL,
    CONSTRAINT processedmocap_pkey PRIMARY KEY (frame_number, frame_timestamp)
);

-- 9. Crear tabla RawMocap
CREATE TABLE teslasuit.rawmocap (
    frame_number INTEGER NOT NULL,
    frame_timestamp TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    CONSTRAINT rawmocap_pkey PRIMARY KEY (frame_number, frame_timestamp)
);

-- 10. Crear tabla Sensor
CREATE TABLE teslasuit.sensor (
    sensor_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- 11. Crear tabla RawSensorData
CREATE TABLE teslasuit.raw_sensor_data (
    frame_number INTEGER NOT NULL,
    frame_timestamp TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    sensor_id INTEGER NOT NULL,
    acc_x REAL NOT NULL,
    acc_y REAL NOT NULL,
    acc_z REAL NOT NULL,
    gyro_x REAL NOT NULL,
    gyro_y REAL NOT NULL,
    gyro_z REAL NOT NULL,
    mag_x REAL NOT NULL,
    mag_y REAL NOT NULL,
    mag_z REAL NOT NULL,
    quat_w REAL NOT NULL,
    quat_x REAL NOT NULL,
    quat_y REAL NOT NULL,
    quat_z REAL NOT NULL,
    euler_x REAL NOT NULL,
    euler_y REAL NOT NULL,
    euler_z REAL NOT NULL,
    PRIMARY KEY (
        frame_number,
        frame_timestamp,
        sensor_id
    ),
    FOREIGN KEY (frame_number, frame_timestamp) REFERENCES teslasuit.rawmocap (frame_number, frame_timestamp),
    FOREIGN KEY (sensor_id) REFERENCES teslasuit.sensor (sensor_id)
);

-- 12. Crear tablas de metadatos
CREATE TABLE teslasuit.ppghrv_metadata (
    table_name VARCHAR(100) NOT NULL,
    column_name VARCHAR(50) NOT NULL,
    meaning_en VARCHAR(255) NOT NULL,
    translation_es VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    CONSTRAINT ppghrv_metadata_pkey PRIMARY KEY (table_name, column_name),
    CONSTRAINT ppghrv_metadata_table_info_fk FOREIGN KEY (table_name) REFERENCES teslasuit.table_info (table_name) ON DELETE CASCADE
);

CREATE TABLE teslasuit.processedppg_metadata (
    table_name VARCHAR(100) NOT NULL,
    column_name VARCHAR(100) NOT NULL,
    meaning_en VARCHAR(255) NOT NULL,
    translation_es VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    CONSTRAINT processedppg_metadata_pkey PRIMARY KEY (table_name, column_name),
    CONSTRAINT processedppg_metadata_table_info_fk FOREIGN KEY (table_name) REFERENCES teslasuit.table_info (table_name) ON DELETE CASCADE
);

CREATE TABLE teslasuit.rawppg_metadata (
    table_name VARCHAR(100) NOT NULL,
    column_name VARCHAR(100) NOT NULL,
    meaning_en VARCHAR(255) NOT NULL,
    translation_es VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    CONSTRAINT rawppg_metadata_pkey PRIMARY KEY (table_name, column_name),
    CONSTRAINT rawppg_metadata_table_info_fk FOREIGN KEY (table_name) REFERENCES teslasuit.table_info (table_name) ON DELETE CASCADE
);

CREATE TABLE teslasuit.processedmocap_metadata (
    table_name VARCHAR(100) NOT NULL,
    column_name VARCHAR(100) NOT NULL,
    meaning_en VARCHAR(255) NOT NULL,
    translation_es VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    CONSTRAINT processedmocap_metadata_pkey PRIMARY KEY (table_name, column_name),
    CONSTRAINT processedmocap_metadata_table_info_fk FOREIGN KEY (table_name) REFERENCES teslasuit.table_info (table_name) ON DELETE CASCADE
);

CREATE TABLE teslasuit.rawmocap_metadata (
    table_name VARCHAR(100) NOT NULL,
    column_name VARCHAR(100) NOT NULL,
    meaning_en VARCHAR(255) NOT NULL,
    translation_es VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    CONSTRAINT rawmocap_metadata_pkey PRIMARY KEY (table_name, column_name),
    CONSTRAINT rawmocap_metadata_table_info_fk FOREIGN KEY (table_name) REFERENCES teslasuit.table_info (table_name) ON DELETE CASCADE
);

-- 13. Crear índices
CREATE INDEX idx_ppghrv_frame ON teslasuit.ppghrv (frame_number);

CREATE INDEX idx_processedppg_frame ON teslasuit.processedppg (frame_number);

CREATE INDEX idx_rawppg_frame ON teslasuit.rawppg (frame_number);

CREATE INDEX idx_processedmocap_frame ON teslasuit.processedmocap (frame_number);

CREATE INDEX idx_rawmocap_frame ON teslasuit.rawmocap (frame_number);

CREATE INDEX idx_sensor_name ON teslasuit.sensor (name);

CREATE INDEX idx_raw_sensor_data ON teslasuit.raw_sensor_data (
    sensor_id,
    frame_number,
    frame_timestamp
);