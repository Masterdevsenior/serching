-- Script de base de datos para Teslasuit en PostgreSQL: RawMocap normalizado

-- 1. (Opcional) Crear la base de datos y conectarse
-- Ejecutar una sola vez:
-- CREATE DATABASE bd_tesla_suit;

-- 2. Crear tabla general de información de tablas, si no existe
CREATE TABLE IF NOT EXISTS teslasuit.table_info (
    table_name VARCHAR(100) PRIMARY KEY,
    table_description TEXT NOT NULL
);

-- 3. Registrar la descripción de la tabla RawMocap
INSERT INTO
    teslasuit.table_info (table_name, table_description)
VALUES (
        'rawmocap',
        'Señal cruda de mocap capturada por el Teslasuit (sensores IMU), sin procesamiento, asociada a un avatar durante una sesión'
    ) ON CONFLICT (table_name) DO NOTHING;

-- 4. Crear tabla rawmocap para la información de cada fotograma
CREATE TABLE teslasuit.rawmocap (
    frame_number INTEGER NOT NULL,
    frame_timestamp TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    PRIMARY KEY (frame_number, frame_timestamp)
);

-- Index para buscar directamente por frame_number
CREATE INDEX idx_rawmocap_frame ON teslasuit.rawmocap (frame_number);

-- 5. Crear tabla de sensores
CREATE TABLE teslasuit.sensor (
    sensor_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Index para buscar por nombre de sensor
CREATE INDEX idx_sensor_name ON teslasuit.sensor (name);

-- 6. Tabla de datos de sensores para cada fotograma
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
    lin_acc_x REAL NOT NULL,
    lin_acc_y REAL NOT NULL,
    lin_acc_z REAL NOT NULL,
    q6_w REAL NOT NULL,
    q6_x REAL NOT NULL,
    q6_y REAL NOT NULL,
    q6_z REAL NOT NULL,
    q9_w REAL NOT NULL,
    q9_x REAL NOT NULL,
    q9_y REAL NOT NULL,
    q9_z REAL NOT NULL,
    imu_timestamp INTEGER NOT NULL,
    temp INTEGER NOT NULL,
    PRIMARY KEY (
        frame_number,
        frame_timestamp,
        sensor_id
    ),
    FOREIGN KEY (frame_number, frame_timestamp) REFERENCES teslasuit.rawmocap (frame_number, frame_timestamp),
    FOREIGN KEY (sensor_id) REFERENCES teslasuit.sensor (sensor_id)
);

-- Index para buscar lecturas por sensor
CREATE INDEX idx_raw_sensor_data ON teslasuit.raw_sensor_data (
    sensor_id,
    frame_number,
    frame_timestamp
);

-- 7. Tabla de metadatos para RawMocap
CREATE TABLE IF NOT EXISTS teslasuit.rawmocap_metadata (
    table_name VARCHAR(100) NOT NULL,
    column_name VARCHAR(100) NOT NULL,
    meaning_en VARCHAR(255) NOT NULL,
    translation_es VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    CONSTRAINT rawmocap_metadata_pkey PRIMARY KEY (table_name, column_name),
    CONSTRAINT rawmocap_metadata_table_info_fk FOREIGN KEY (table_name) REFERENCES teslasuit.table_info (table_name) ON DELETE CASCADE
);