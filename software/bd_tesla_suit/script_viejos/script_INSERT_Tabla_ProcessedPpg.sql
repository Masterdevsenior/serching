-- 3. Insertar metadatos de columnas de ProcessedPpg
INSERT INTO
    processedppg_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedppg',
        'frame_number',
        'frame number',
        'número de fotograma',
        'Contador incremental que identifica el orden de cada medición de señal PPG procesada, usado para sincronizar con otros eventos o sensores.'
    ),
    (
        'processedppg',
        'frame_timestamp',
        'frame timestamp',
        'marca de tiempo del fotograma',
        'Fecha y hora exactas (con milisegundos) en que se registró la señal PPG procesada, para alinear con vídeo o telemetría.'
    ),
    (
        'processedppg',
        'node0.is_heartrate_valid',
        'is heart rate valid',
        '¿es válida la frecuencia cardíaca?',
        'Indicador (0/1) que señala si la medición de frecuencia cardíaca en este fotograma es fiable y libre de artefactos.'
    ),
    (
        'processedppg',
        'node0.is_spo2_valid',
        'is SpO₂ valid',
        '¿es válida la saturación de oxígeno?',
        'Indicador (0/1) que indica si la lectura de saturación de oxígeno es confiable en el fotograma actual.'
    ),
    (
        'processedppg',
        'node0.heartrate',
        'heart rate',
        'frecuencia cardíaca',
        'Número de latidos por minuto (BPM) calculado a partir de la señal PPG procesada; válido solo si is_heartrate_valid = 1.'
    ),
    (
        'processedppg',
        'node0.spo2',
        'SpO₂ (Peripheral capillary oxygen saturation)',
        'saturación periférica de oxígeno',
        'Porcentaje de hemoglobina saturada de oxígeno medido no invasivamente; útil para evaluar la oxigenación corporal, válido solo si is_spo2_valid = 1.'
    ) ON CONFLICT DO NOTHING;

-- 7. Consultas de verificación
SELECT * FROM table_info;

SELECT * FROM processedppg_metadata;