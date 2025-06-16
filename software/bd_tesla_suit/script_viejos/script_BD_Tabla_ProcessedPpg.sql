-- Script de base de datos para Teslasuit en PostgreSQL: ProcessedPpg y metadatos

-- 1. (Opcional) Crear la base de datos y conectarse
-- Ejecutar una sola vez:
-- CREATE DATABASE bd_tesla_suit;

-- 2. Crear tabla general de información de tablas, si no existe
CREATE TABLE IF NOT EXISTS table_info (
    table_name VARCHAR(100) PRIMARY KEY,
    table_description TEXT NOT NULL
);

-- 3. Registrar la descripción de la tabla ProcessedPpg
INSERT INTO
    table_info (table_name, table_description)
VALUES (
        'processedppg',
        'Tabla que contiene datos fisiológicos procesados de señal PPG para un avatar durante una sesión con Teslasuit'
    ) ON CONFLICT (table_name) DO NOTHING;

-- 4. Crear tabla ProcessedPpg para datos PPG procesados
CREATE TABLE IF NOT EXISTS processedppg (
    frame_number INTEGER NOT NULL,
    frame_timestamp TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    "node0.is_heartrate_valid" INTEGER NOT NULL,
    "node0.is_spo2_valid" INTEGER NOT NULL,
    "node0.heartrate" INTEGER NOT NULL,
    "node0.spo2" INTEGER NOT NULL,
    PRIMARY KEY (frame_number, frame_timestamp)
);

-- 5. Crear tabla de metadatos para cada columna de ProcessedPpg
CREATE TABLE IF NOT EXISTS processedppg_metadata (
    table_name VARCHAR(100) NOT NULL,
    column_name VARCHAR(100) NOT NULL,
    meaning_en VARCHAR(255) NOT NULL,
    translation_es VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    CONSTRAINT processedppg_metadata_pkey PRIMARY KEY (table_name, column_name),
    CONSTRAINT processedppg_metadata_table_info_fk FOREIGN KEY (table_name) REFERENCES table_info (table_name) ON DELETE CASCADE
);