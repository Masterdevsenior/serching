-- Script de base de datos para Teslasuit en PostgreSQL: RawPpg normalizado

-- 1. (Opcional) Crear la base de datos y conectarse
-- Ejecutar una sola vez:
-- CREATE DATABASE bd_tesla_suit;

-- 2. Crear tabla general de información de tablas, si no existe
CREATE TABLE IF NOT EXISTS teslasuit.table_info (
    table_name VARCHAR(100) PRIMARY KEY,
    table_description TEXT NOT NULL
);

-- 3. Registrar la descripción de la tabla RawPpg
INSERT INTO
    teslasuit.table_info (table_name, table_description)
VALUES (
        'rawppg',
        'Señal cruda de PPG capturada por el Teslasuit, sin procesamiento, asociada a un avatar durante una sesión'
    ) ON CONFLICT (table_name) DO NOTHING;

-- 4. Crear tabla rawppg para la información de cada fotograma
CREATE TABLE teslasuit.rawppg (
    frame_number INTEGER NOT NULL,
    frame_timestamp TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    node0_proximity INTEGER NOT NULL,
    node0_ambient_light_COFV REAL NOT NULL,
    node0_red_data INTEGER NOT NULL,
    node0_ir_data INTEGER NOT NULL,
    node0_green_data INTEGER NOT NULL,
    node0_blue_data INTEGER NOT NULL,
    PRIMARY KEY (frame_number, frame_timestamp)
);

-- Index para buscar directamente por frame_number
CREATE INDEX idx_rawppg_frame ON teslasuit.rawppg (frame_number);

-- 5. Tabla de metadatos para RawPpg
CREATE TABLE IF NOT EXISTS teslasuit.rawppg_metadata (
    table_name VARCHAR(100) NOT NULL,
    column_name VARCHAR(100) NOT NULL,
    meaning_en VARCHAR(255) NOT NULL,
    translation_es VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    CONSTRAINT rawppg_metadata_pkey PRIMARY KEY (table_name, column_name),
    CONSTRAINT rawppg_metadata_table_info_fk FOREIGN KEY (table_name) REFERENCES teslasuit.table_info (table_name) ON DELETE CASCADE
);