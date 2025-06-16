-- 5. Insertar metadatos de columnas de RawPpg
INSERT INTO
    teslasuit.rawppg_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawppg',
        'frame_number',
        'frame number',
        'número de fotograma',
        'Contador incremental que identifica el orden de cada medición cruda de PPG; permite sincronizar la señal con otros datos de la sesión.'
    ),
    (
        'rawppg',
        'frame_timestamp',
        'frame timestamp',
        'marca de tiempo del fotograma',
        'Registro de fecha y hora exactas (ms) de cada muestra cruda de PPG; esencial para alinear señales con vídeo y telemetría.'
    ),
    (
        'rawppg',
        'node0.proximity',
        'proximity',
        'proximidad',
        'Distancia o intensidad de reflexión entre el sensor y la piel del usuario medida en cuentas digitales; garantiza la calidad de la captación de la señal.'
    ),
    (
        'rawppg',
        'node0.ambient_light_COFV',
        'ambient light CoFV',
        'coeficiente de variación de la luz ambiental',
        'Variabilidad relativa de la luz ambiental medida como desviación estándar sobre la media; detecta cambios de iluminación que pueden contaminar la señal PPG.'
    ),
    (
        'rawppg',
        'node0.red_data',
        'red data',
        'datos de luz roja',
        'Valor entero crudo de la luz roja reflejada por la piel; aporta información sobre el flujo sanguíneo en capas superficiales y es clave para cálculos de SpO₂ y HRV.'
    ),
    (
        'rawppg',
        'node0.ir_data',
        'IR data',
        'datos de infrarrojo',
        'Lectura cruda de luz infrarroja reflejada por la piel; penetra capas más profundas y, combinada con luz roja, permite estimar la saturación de oxígeno.'
    ),
    (
        'rawppg',
        'node0.green_data',
        'green data',
        'datos de luz verde',
        'Valor crudo de la luz verde reflejada; ofrece buena relación señal‑ruido en condiciones de movimiento y se usa para estimar ritmo cardíaco.'
    ),
    (
        'rawppg',
        'node0.blue_data',
        'blue data',
        'datos de luz azul',
        'Lectura cruda de luz azul reflejada; utilizada en algoritmos avanzados para mejorar detección de pulso y estimaciones de oxigenación.'
    ) ON CONFLICT DO NOTHING;

-- 7. Consultas de verificación
SELECT * FROM teslasuit.table_info;

SELECT * FROM teslasuit.rawppg_metadata;