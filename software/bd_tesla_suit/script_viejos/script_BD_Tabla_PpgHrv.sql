-- Script de base de datos para Teslasuit en PostgreSQL: bd_tesla_suit

-- 1. Crear la base de datos (ejecutar una sola vez)
-- Ejecutar una sola vez:
-- CREATE DATABASE bd_tesla_suit;

-- 2. Crear tabla de información de tablas (para relacionar metadata)
CREATE TABLE IF NOT EXISTS table_info (
    table_name VARCHAR(100) PRIMARY KEY,
    table_description TEXT NOT NULL
);

-- 3. Insertar información de la tabla PpgHrv
INSERT INTO
    table_info (table_name, table_description)
VALUES (
        'PpgHrv',
        'Tabla que contiene datos biométricos de señal PPG y métricas de HRV para un avatar en sesión de Teslasuit'
    ) ON CONFLICT (table_name) DO NOTHING;

-- 4. Crear la tabla PpgHrv para datos biométricos (PPG y HRV)
CREATE TABLE IF NOT EXISTS PpgHrv (
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

-- 5. Crear tabla para metadatos de columnas PpgHrv y relacionar con table_info
CREATE TABLE IF NOT EXISTS ppghrv_metadata (
    table_name VARCHAR(100) NOT NULL,
    column_name VARCHAR(50) NOT NULL,
    meaning_en VARCHAR(255) NOT NULL,
    translation_es VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    CONSTRAINT ppghrv_metadata_pkey PRIMARY KEY (table_name, column_name),
    CONSTRAINT ppghrv_metadata_table_info_fk FOREIGN KEY (table_name) REFERENCES table_info (table_name) ON DELETE CASCADE
);