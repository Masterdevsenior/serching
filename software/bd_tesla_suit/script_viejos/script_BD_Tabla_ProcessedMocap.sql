-- Script de base de datos para Teslasuit en PostgreSQL: processedmocap y metadatos

-- 1. Crear esquema si no existe
CREATE SCHEMA IF NOT EXISTS teslasuit;

-- 2. Establecer el esquema por defecto
SET search_path TO teslasuit;

-- 3. Crear tabla general de información de tablas, si no existe
CREATE TABLE IF NOT EXISTS table_info (
    table_name VARCHAR(100) PRIMARY KEY,
    table_description TEXT NOT NULL
);

-- 4. Registrar la descripción de la tabla processedmocap
INSERT INTO
    table_info (table_name, table_description)
VALUES (
        'processedmocap',
        'Tabla que almacena los datos de captura de movimiento procesados, incluyendo posiciones y rotaciones de las articulaciones.'
    ) ON CONFLICT DO NOTHING;

-- 5. Crear tabla principal processedmocap
CREATE TABLE processedmocap (
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

-- 6. Crear índices para optimizar búsquedas
CREATE INDEX idx_processedmocap_frame ON processedmocap (frame_number);

-- 7. Articulaciones
CREATE TABLE processedmocap_joint (
    joint_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Index para buscar por nombre de articulacion
CREATE INDEX idx_processedmocap_joint_name ON processedmocap_joint (name);

-- 8. Posición de cada articulacion en cada fotograma
CREATE TABLE processedmocap_joint_position (
    frame_number INTEGER NOT NULL,
    frame_timestamp TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    joint_id INTEGER NOT NULL,
    pos_x REAL NOT NULL,
    pos_y REAL NOT NULL,
    pos_z REAL NOT NULL,
    PRIMARY KEY (
        frame_number,
        frame_timestamp,
        joint_id
    ),
    FOREIGN KEY (frame_number, frame_timestamp) REFERENCES processedmocap (frame_number, frame_timestamp),
    FOREIGN KEY (joint_id) REFERENCES processedmocap_joint (joint_id)
);

-- Index para buscar posiciones por articulacion
CREATE INDEX idx_processedmocap_joint_position ON processedmocap_joint_position (
    joint_id,
    frame_number,
    frame_timestamp
);

-- 9. Rotaciones de cada articulacion en cada fotograma
CREATE TABLE processedmocap_joint_rotation (
    frame_number INTEGER NOT NULL,
    frame_timestamp TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    joint_id INTEGER NOT NULL,
    rot_w REAL NOT NULL,
    rot_x REAL NOT NULL,
    rot_y REAL NOT NULL,
    rot_z REAL NOT NULL,
    PRIMARY KEY (
        frame_number,
        frame_timestamp,
        joint_id
    ),
    FOREIGN KEY (frame_number, frame_timestamp) REFERENCES processedmocap (frame_number, frame_timestamp),
    FOREIGN KEY (joint_id) REFERENCES processedmocap_joint (joint_id)
);

-- Index para buscar rotaciones por articulacion
CREATE INDEX idx_processedmocap_joint_rotation ON processedmocap_joint_rotation (
    joint_id,
    frame_number,
    frame_timestamp
);

-- 10. Grados de libertad de cada articulacion en cada fotograma
CREATE TABLE processedmocap_joint_freedom (
    frame_number INTEGER NOT NULL,
    frame_timestamp TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    joint_id INTEGER NOT NULL,
    angle REAL NOT NULL,
    angular_v REAL NOT NULL,
    angular_acc REAL NOT NULL,
    PRIMARY KEY (
        frame_number,
        frame_timestamp,
        joint_id
    ),
    FOREIGN KEY (frame_number, frame_timestamp) REFERENCES processedmocap (frame_number, frame_timestamp),
    FOREIGN KEY (joint_id) REFERENCES processedmocap_joint (joint_id)
);

-- Index para buscar grados de libertad por articulacion
CREATE INDEX idx_processedmocap_joint_freedom ON processedmocap_joint_freedom (
    joint_id,
    frame_number,
    frame_timestamp
);

-- 11. Tabla de metadatos para processedmocap
CREATE TABLE IF NOT EXISTS processedmocap_metadata (
    table_name VARCHAR(50) NOT NULL,
    column_name VARCHAR(100) NOT NULL,
    meaning_en VARCHAR(100),
    translation_es VARCHAR(100),
    description TEXT,
    CONSTRAINT processedmocap_metadata_pkey PRIMARY KEY (table_name, column_name),
    CONSTRAINT processedmocap_metadata_table_info_fk FOREIGN KEY (table_name) REFERENCES table_info (table_name) ON DELETE CASCADE
);