-- 1. Insertar metadatos por cada columna de PpgHrv
INSERT INTO
    teslasuit.ppghrv_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'ppghrv',
        'frame_number',
        'frame number',
        'número de fotograma',
        'Cada fotograma corresponde a una medición puntual de la señal PPG. Este campo es un contador incremental que indica el orden de las mediciones, útil para sincronizar con otros sistemas.'
    ),
    (
        'ppghrv',
        'frame_timestamp',
        'frame timestamp',
        'marca de tiempo del fotograma',
        'Instante real (hora, minuto, segundo y fracción) en que se capturó cada fotograma de PPG, basado en el reloj interno del Teslasuit, para correlacionar eventos y sincronizar datos.'
    ),
    (
        'ppghrv',
        'mean_rr',
        'mean RR interval',
        'intervalo R‑R medio',
        'Duración promedio en milisegundos de los intervalos R‑R (tiempo entre dos latidos consecutivos), asociado al balance entre sistemas simpático y parasimpático.'
    ),
    (
        'ppghrv',
        'sdnn',
        'standard deviation of normal‑to‑normal intervals',
        'desviación estándar de los intervalos normales R‑R',
        'Variabilidad global de la frecuencia cardíaca calculada como la desviación estándar de todos los intervalos R‑R en una ventana de tiempo.'
    ),
    (
        'ppghrv',
        'sdsd',
        'standard deviation of successive differences',
        'desviación estándar de las diferencias sucesivas de intervalos R‑R',
        'Variabilidad a muy corto plazo medida como la desviación estándar de las diferencias entre intervalos R‑R consecutivos.'
    ),
    (
        'ppghrv',
        'rmssd',
        'root mean square of successive differences',
        'raíz cuadrada de la media de los cuadrados de las diferencias sucesivas de intervalos R‑R',
        'Indicador de la actividad parasimpática calculado como la raíz cuadrática media de las diferencias sucesivas de intervalos R‑R.'
    ),
    (
        'ppghrv',
        'sd1',
        'Poincaré plot SD1',
        'desviación estándar perpendicular al eje de identidad en el diagrama de Poincaré',
        'Métrica de variabilidad instantánea obtenida de la dispersión perpendicular en el diagrama de Poincaré de intervalos R‑R.'
    ),
    (
        'ppghrv',
        'sd2',
        'Poincaré plot SD2',
        'desviación estándar a lo largo del eje de identidad en el diagrama de Poincaré',
        'Métrica de variabilidad a largo plazo obtenida de la dispersión a lo largo del eje de identidad en el diagrama de Poincaré.'
    ),
    (
        'ppghrv',
        'lf_hf',
        'low‑frequency to high‑frequency ratio',
        'cociente de baja frecuencia con alta frecuencia',
        'Balance simpático‑parasimpático calculado como el cociente de la potencia espectral en bandas de baja y alta frecuencia.'
    ) ON CONFLICT DO NOTHING;

-- 2. Insertar metadatos de columnas de ProcessedPpg
INSERT INTO
    teslasuit.processedppg_metadata (
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

-- 3. Insertar metadatos de columnas de RawPpg
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

-- 4. Insertar metadatos de columnas de processedmocap
INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'frame_number',
        'frame number',
        'número de fotograma',
        'Contador incremental que identifica el orden de cada fotograma procesado.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'frame_timestamp',
        'frame timestamp',
        'marca de tiempo del fotograma',
        'Fecha y hora exactas de captura de cada frame.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_leg.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

-- 1. Insertar metadatos por cada columna de PpgHrv
INSERT INTO
    teslasuit.ppghrv_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'ppghrv',
        'frame_number',
        'frame number',
        'número de fotograma',
        'Cada fotograma corresponde a una medición puntual de la señal PPG. Este campo es un contador incremental que indica el orden de las mediciones, útil para sincronizar con otros sistemas.'
    ),
    (
        'ppghrv',
        'frame_timestamp',
        'frame timestamp',
        'marca de tiempo del fotograma',
        'Instante real (hora, minuto, segundo y fracción) en que se capturó cada fotograma de PPG, basado en el reloj interno del Teslasuit, para correlacionar eventos y sincronizar datos.'
    ),
    (
        'ppghrv',
        'mean_rr',
        'mean RR interval',
        'intervalo R‑R medio',
        'Duración promedio en milisegundos de los intervalos R‑R (tiempo entre dos latidos consecutivos), asociado al balance entre sistemas simpático y parasimpático.'
    ),
    (
        'ppghrv',
        'sdnn',
        'standard deviation of normal‑to‑normal intervals',
        'desviación estándar de los intervalos normales R‑R',
        'Variabilidad global de la frecuencia cardíaca calculada como la desviación estándar de todos los intervalos R‑R en una ventana de tiempo.'
    ),
    (
        'ppghrv',
        'sdsd',
        'standard deviation of successive differences',
        'desviación estándar de las diferencias sucesivas de intervalos R‑R',
        'Variabilidad a muy corto plazo medida como la desviación estándar de las diferencias entre intervalos R‑R consecutivos.'
    ),
    (
        'ppghrv',
        'rmssd',
        'root mean square of successive differences',
        'raíz cuadrada de la media de los cuadrados de las diferencias sucesivas de intervalos R‑R',
        'Indicador de la actividad parasimpática calculado como la raíz cuadrática media de las diferencias sucesivas de intervalos R‑R.'
    ),
    (
        'ppghrv',
        'sd1',
        'Poincaré plot SD1',
        'desviación estándar perpendicular al eje de identidad en el diagrama de Poincaré',
        'Métrica de variabilidad instantánea obtenida de la dispersión perpendicular en el diagrama de Poincaré de intervalos R‑R.'
    ),
    (
        'ppghrv',
        'sd2',
        'Poincaré plot SD2',
        'desviación estándar a lo largo del eje de identidad en el diagrama de Poincaré',
        'Métrica de variabilidad a largo plazo obtenida de la dispersión a lo largo del eje de identidad en el diagrama de Poincaré.'
    ),
    (
        'ppghrv',
        'lf_hf',
        'low‑frequency to high‑frequency ratio',
        'cociente de baja frecuencia con alta frecuencia',
        'Balance simpático‑parasimpático calculado como el cociente de la potencia espectral en bandas de baja y alta frecuencia.'
    ) ON CONFLICT DO NOTHING;

-- 2. Insertar metadatos de columnas de ProcessedPpg
INSERT INTO
    teslasuit.processedppg_metadata (
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

-- 3. Insertar metadatos de columnas de RawPpg
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

-- 4. Insertar metadatos de columnas de processedmocap
INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'frame_number',
        'frame number',
        'número de fotograma',
        'Contador incremental que identifica el orden de cada fotograma procesado.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'frame_timestamp',
        'frame timestamp',
        'marca de tiempo del fotograma',
        'Fecha y hora exactas de captura de cada frame.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_leg.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_leg.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_leg.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_leg.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_leg.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_foot.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_foot.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_foot.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_foot.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_foot.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_foot.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_foot.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_foot.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_foot.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_foot.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_foot.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_foot.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_foot.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_foot.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'spine.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'spine.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'spine.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'spine.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'spine.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'spine.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'spine.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'upper_spine.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'upper_spine.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'upper_spine.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'upper_spine.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'upper_spine.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'upper_spine.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'upper_spine.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'neck.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'neck.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'neck.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'neck.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'neck.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'neck.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'neck.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'head.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'head.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'head.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'head.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'head.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'head.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'head.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_shoulder.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_shoulder.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_shoulder.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_shoulder.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_shoulder.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_shoulder.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_shoulder.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_shoulder.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_shoulder.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_shoulder.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_shoulder.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_shoulder.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_shoulder.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_shoulder.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_arm.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_arm.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_arm.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_arm.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_arm.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_arm.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_arm.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_arm.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_arm.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_arm.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_arm.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_arm.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_arm.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_arm.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_arm.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_arm.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_arm.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_arm.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_arm.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_arm.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_arm.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_arm.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_arm.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_arm.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_arm.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_arm.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_arm.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_arm.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_hand.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_hand.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_hand.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_hand.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_hand.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_hand.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_hand.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_hand.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_hand.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_hand.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_hand.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_hand.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_hand.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_hand.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'mass_center.x',
        'unknown',
        'desconocido',
        'Descripción no definida; revisa.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'mass_center.y',
        'unknown',
        'desconocido',
        'Descripción no definida; revisa.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'mass_center.z',
        'unknown',
        'desconocido',
        'Descripción no definida; revisa.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'PelvisTilt.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'PelvisTilt.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'PelvisTilt.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'PelvisList.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'PelvisList.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'PelvisList.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'PelvisRotation.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'PelvisRotation.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'PelvisRotation.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipFlexExtR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipFlexExtR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipFlexExtR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipAddAbdR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipAddAbdR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipAddAbdR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipRotR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipRotR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipRotR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'KneeFlexExtR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'KneeFlexExtR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'KneeFlexExtR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'AnkleFlexExtR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'AnkleFlexExtR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'AnkleFlexExtR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'AnkleProSupR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'AnkleProSupR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'AnkleProSupR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipFlexExtL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipFlexExtL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipFlexExtL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipAddAbdL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipAddAbdL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipAddAbdL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipRotL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipRotL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipRotL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'KneeFlexExtL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'KneeFlexExtL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'KneeFlexExtL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'AnkleFlexExtL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'AnkleFlexExtL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'AnkleFlexExtL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'AnkleProSupL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'AnkleProSupL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'AnkleProSupL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ElbowFlexExtR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ElbowFlexExtR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ElbowFlexExtR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ForearmProSupR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ForearmProSupR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ForearmProSupR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'WristFlexExtR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'WristFlexExtR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'WristFlexExtR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'WristDeviationR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'WristDeviationR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'WristDeviationR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ElbowFlexExtL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ElbowFlexExtL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ElbowFlexExtL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ForearmProSupL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ForearmProSupL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ForearmProSupL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'WristFlexExtL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'WristFlexExtL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'WristFlexExtL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'WristDeviationL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'WristDeviationL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'WristDeviationL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LumbarLatFlex.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LumbarLatFlex.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LumbarLatFlex.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LumbarRot.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LumbarRot.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LumbarRot.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LumbarFlexExt.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LumbarFlexExt.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LumbarFlexExt.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LowerThoraxLatFlex.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LowerThoraxLatFlex.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LowerThoraxLatFlex.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LowerThoraxRot.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LowerThoraxRot.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LowerThoraxRot.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LowerThoraxFlexExt.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LowerThoraxFlexExt.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LowerThoraxFlexExt.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'UpperThoraxLatFlex.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'UpperThoraxLatFlex.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'UpperThoraxLatFlex.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'UpperThoraxRot.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'UpperThoraxRot.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'UpperThoraxRot.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'UpperThoraxFlexExt.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'UpperThoraxFlexExt.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'UpperThoraxFlexExt.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ScapulaDeprElevR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ScapulaDeprElevR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ScapulaDeprElevR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ScapulaProtrRetrR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ScapulaProtrRetrR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ScapulaProtrRetrR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración angular en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

-- 7. Insertar metadatos para cada columna
INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'frame_number',
        'frame number',
        'número de fotograma',
        'Contador incremental que identifica el orden de cada fotograma procesado.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'frame_timestamp',
        'frame timestamp',
        'marca de tiempo del fotograma',
        'Fecha y hora exactas de captura de cada frame.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_leg.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_leg.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_leg.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_leg.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_leg.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_foot.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_foot.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_foot.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_foot.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_foot.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_foot.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_foot.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_foot.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_foot.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_foot.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_foot.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_foot.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_foot.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_foot.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_toes.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_toes.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_toes.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_toes.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_toes.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_toes.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_toes.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_toes.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_toes.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_toes.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_toes.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_toes.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_toes.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_toes.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_hand.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_hand.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_hand.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_hand.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_hand.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_hand.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_hand.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_hand.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_hand.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_hand.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_hand.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_hand.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_hand.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_hand.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_thumb.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_thumb.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_thumb.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_thumb.rotation.w',
        'rotation W',
        'rotación W',
-- 1. Insertar metadatos por cada columna de PpgHrv
INSERT INTO
    teslasuit.ppghrv_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'ppghrv',
        'frame_number',
        'frame number',
        'número de fotograma',
        'Cada fotograma corresponde a una medición puntual de la señal PPG. Este campo es un contador incremental que indica el orden de las mediciones, útil para sincronizar con otros sistemas.'
    ),
    (
        'ppghrv',
        'frame_timestamp',
        'frame timestamp',
        'marca de tiempo del fotograma',
        'Instante real (hora, minuto, segundo y fracción) en que se capturó cada fotograma de PPG, basado en el reloj interno del Teslasuit, para correlacionar eventos y sincronizar datos.'
    ),
    (
        'ppghrv',
        'mean_rr',
        'mean RR interval',
        'intervalo R‑R medio',
        'Duración promedio en milisegundos de los intervalos R‑R (tiempo entre dos latidos consecutivos), asociado al balance entre sistemas simpático y parasimpático.'
    ),
    (
        'ppghrv',
        'sdnn',
        'standard deviation of normal‑to‑normal intervals',
        'desviación estándar de los intervalos normales R‑R',
        'Variabilidad global de la frecuencia cardíaca calculada como la desviación estándar de todos los intervalos R‑R en una ventana de tiempo.'
    ),
    (
        'ppghrv',
        'sdsd',
        'standard deviation of successive differences',
        'desviación estándar de las diferencias sucesivas de intervalos R‑R',
        'Variabilidad a muy corto plazo medida como la desviación estándar de las diferencias entre intervalos R‑R consecutivos.'
    ),
    (
        'ppghrv',
        'rmssd',
        'root mean square of successive differences',
        'raíz cuadrada de la media de los cuadrados de las diferencias sucesivas de intervalos R‑R',
        'Indicador de la actividad parasimpática calculado como la raíz cuadrática media de las diferencias sucesivas de intervalos R‑R.'
    ),
    (
        'ppghrv',
        'sd1',
        'Poincaré plot SD1',
        'desviación estándar perpendicular al eje de identidad en el diagrama de Poincaré',
        'Métrica de variabilidad instantánea obtenida de la dispersión perpendicular en el diagrama de Poincaré de intervalos R‑R.'
    ),
    (
        'ppghrv',
        'sd2',
        'Poincaré plot SD2',
        'desviación estándar a lo largo del eje de identidad en el diagrama de Poincaré',
        'Métrica de variabilidad a largo plazo obtenida de la dispersión a lo largo del eje de identidad en el diagrama de Poincaré.'
    ),
    (
        'ppghrv',
        'lf_hf',
        'low‑frequency to high‑frequency ratio',
        'cociente de baja frecuencia con alta frecuencia',
        'Balance simpático‑parasimpático calculado como el cociente de la potencia espectral en bandas de baja y alta frecuencia.'
    ) ON CONFLICT DO NOTHING;

-- 2. Insertar metadatos de columnas de ProcessedPpg
INSERT INTO
    teslasuit.processedppg_metadata (
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

-- 3. Insertar metadatos de columnas de RawPpg
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

-- 4. Insertar metadatos de columnas de processedmocap
INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'frame_number',
        'frame number',
        'número de fotograma',
        'Contador incremental que identifica el orden de cada fotograma procesado.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'frame_timestamp',
        'frame timestamp',
        'marca de tiempo del fotograma',
        'Fecha y hora exactas de captura de cada frame.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
-- 1. Insertar metadatos por cada columna de PpgHrv
INSERT INTO
    teslasuit.ppghrv_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'ppghrv',
        'frame_number',
        'frame number',
        'número de fotograma',
        'Cada fotograma corresponde a una medición puntual de la señal PPG. Este campo es un contador incremental que indica el orden de las mediciones, útil para sincronizar con otros sistemas.'
    ),
    (
        'ppghrv',
        'frame_timestamp',
        'frame timestamp',
        'marca de tiempo del fotograma',
        'Instante real (hora, minuto, segundo y fracción) en que se capturó cada fotograma de PPG, basado en el reloj interno del Teslasuit, para correlacionar eventos y sincronizar datos.'
    ),
    (
        'ppghrv',
        'mean_rr',
        'mean RR interval',
        'intervalo R‑R medio',
        'Duración promedio en milisegundos de los intervalos R‑R (tiempo entre dos latidos consecutivos), asociado al balance entre sistemas simpático y parasimpático.'
    ),
    (
        'ppghrv',
        'sdnn',
        'standard deviation of normal‑to‑normal intervals',
        'desviación estándar de los intervalos normales R‑R',
        'Variabilidad global de la frecuencia cardíaca calculada como la desviación estándar de todos los intervalos R‑R en una ventana de tiempo.'
    ),
    (
        'ppghrv',
        'sdsd',
        'standard deviation of successive differences',
        'desviación estándar de las diferencias sucesivas de intervalos R‑R',
        'Variabilidad a muy corto plazo medida como la desviación estándar de las diferencias entre intervalos R‑R consecutivos.'
    ),
    (
        'ppghrv',
        'rmssd',
        'root mean square of successive differences',
        'raíz cuadrada de la media de los cuadrados de las diferencias sucesivas de intervalos R‑R',
        'Indicador de la actividad parasimpática calculado como la raíz cuadrática media de las diferencias sucesivas de intervalos R‑R.'
    ),
    (
        'ppghrv',
        'sd1',
        'Poincaré plot SD1',
        'desviación estándar perpendicular al eje de identidad en el diagrama de Poincaré',
        'Métrica de variabilidad instantánea obtenida de la dispersión perpendicular en el diagrama de Poincaré de intervalos R‑R.'
    ),
    (
        'ppghrv',
        'sd2',
        'Poincaré plot SD2',
        'desviación estándar a lo largo del eje de identidad en el diagrama de Poincaré',
        'Métrica de variabilidad a largo plazo obtenida de la dispersión a lo largo del eje de identidad en el diagrama de Poincaré.'
    ),
    (
        'ppghrv',
        'lf_hf',
        'low‑frequency to high‑frequency ratio',
        'cociente de baja frecuencia con alta frecuencia',
        'Balance simpático‑parasimpático calculado como el cociente de la potencia espectral en bandas de baja y alta frecuencia.'
    ) ON CONFLICT DO NOTHING;

-- 2. Insertar metadatos de columnas de ProcessedPpg
INSERT INTO
    teslasuit.processedppg_metadata (
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

-- 3. Insertar metadatos de columnas de RawPpg
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

-- 4. Insertar metadatos de columnas de processedmocap
INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'frame_number',
        'frame number',
        'número de fotograma',
        'Contador incremental que identifica el orden de cada fotograma procesado.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'frame_timestamp',
        'frame timestamp',
        'marca de tiempo del fotograma',
        'Fecha y hora exactas de captura de cada frame.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'root.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'hips.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_leg.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_leg.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_leg.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_leg.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_leg.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_leg.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_leg.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_leg.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_foot.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_foot.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_foot.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_foot.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_foot.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_foot.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_foot.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_foot.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_foot.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_foot.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_foot.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_foot.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_foot.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_foot.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'spine.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'spine.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'spine.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'spine.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'spine.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'spine.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'spine.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'upper_spine.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'upper_spine.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'upper_spine.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'upper_spine.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'upper_spine.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'upper_spine.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'upper_spine.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'neck.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'neck.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'neck.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'neck.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'neck.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'neck.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'neck.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'head.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'head.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'head.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'head.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'head.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'head.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'head.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_shoulder.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_shoulder.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_shoulder.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_shoulder.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_shoulder.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_shoulder.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_shoulder.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_shoulder.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_shoulder.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_shoulder.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_shoulder.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_shoulder.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_shoulder.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_shoulder.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_arm.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_arm.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_arm.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_arm.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_arm.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_arm.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_upper_arm.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_arm.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_arm.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_arm.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_arm.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_arm.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_arm.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_upper_arm.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_arm.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_arm.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_arm.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_arm.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_arm.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_arm.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_lower_arm.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_arm.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_arm.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_arm.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_arm.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_arm.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_arm.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_lower_arm.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_hand.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_hand.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_hand.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_hand.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_hand.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_hand.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'left_hand.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_hand.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_hand.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_hand.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_hand.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_hand.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_hand.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'right_hand.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'mass_center.x',
        'unknown',
        'desconocido',
        'Descripción no definida; revisa.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'mass_center.y',
        'unknown',
        'desconocido',
        'Descripción no definida; revisa.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'mass_center.z',
        'unknown',
        'desconocido',
        'Descripción no definida; revisa.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'PelvisTilt.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'PelvisTilt.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'PelvisTilt.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'PelvisList.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'PelvisList.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'PelvisList.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'PelvisRotation.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'PelvisRotation.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'PelvisRotation.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipFlexExtR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipFlexExtR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipFlexExtR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipAddAbdR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipAddAbdR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipAddAbdR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipRotR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipRotR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipRotR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'KneeFlexExtR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'KneeFlexExtR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'KneeFlexExtR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'AnkleFlexExtR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'AnkleFlexExtR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'AnkleFlexExtR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'AnkleProSupR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'AnkleProSupR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'AnkleProSupR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipFlexExtL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipFlexExtL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipFlexExtL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipAddAbdL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipAddAbdL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipAddAbdL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipRotL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipRotL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'HipRotL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'KneeFlexExtL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'KneeFlexExtL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'KneeFlexExtL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'AnkleFlexExtL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'AnkleFlexExtL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'AnkleFlexExtL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'AnkleProSupL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'AnkleProSupL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'AnkleProSupL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ElbowFlexExtR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ElbowFlexExtR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ElbowFlexExtR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ForearmProSupR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ForearmProSupR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ForearmProSupR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'WristFlexExtR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'WristFlexExtR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'WristFlexExtR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'WristDeviationR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'WristDeviationR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'WristDeviationR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ElbowFlexExtL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ElbowFlexExtL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ElbowFlexExtL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ForearmProSupL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ForearmProSupL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ForearmProSupL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'WristFlexExtL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'WristFlexExtL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'WristFlexExtL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'WristDeviationL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'WristDeviationL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'WristDeviationL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LumbarLatFlex.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LumbarLatFlex.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LumbarLatFlex.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LumbarRot.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LumbarRot.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LumbarRot.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LumbarFlexExt.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LumbarFlexExt.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LumbarFlexExt.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LowerThoraxLatFlex.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LowerThoraxLatFlex.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LowerThoraxLatFlex.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LowerThoraxRot.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LowerThoraxRot.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LowerThoraxRot.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LowerThoraxFlexExt.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LowerThoraxFlexExt.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'LowerThoraxFlexExt.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'UpperThoraxLatFlex.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'UpperThoraxLatFlex.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'UpperThoraxLatFlex.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'UpperThoraxRot.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'UpperThoraxRot.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'UpperThoraxRot.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'UpperThoraxFlexExt.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'UpperThoraxFlexExt.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'UpperThoraxFlexExt.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ScapulaDeprElevR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ScapulaDeprElevR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ScapulaDeprElevR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ScapulaProtrRetrR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ScapulaProtrRetrR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'processedmocap',
        'ScapulaProtrRetrR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración angular en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

-- 7. Insertar metadatos para cada columna
INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'frame_number',
        'frame number',
        'número de fotograma',
        'Contador incremental que identifica el orden de cada fotograma procesado.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'frame_timestamp',
        'frame timestamp',
        'marca de tiempo del fotograma',
        'Fecha y hora exactas de captura de cada frame.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'root.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'root.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'root.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'root.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'root.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'root.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'root.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'hips.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'hips.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'hips.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'hips.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'hips.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'hips.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'hips.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_upper_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_upper_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_upper_leg.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_upper_leg.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_upper_leg.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_upper_leg.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_upper_leg.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_upper_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_upper_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_upper_leg.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_upper_leg.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_upper_leg.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_upper_leg.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_upper_leg.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_lower_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_lower_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_lower_leg.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_lower_leg.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_lower_leg.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_lower_leg.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_lower_leg.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_lower_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_lower_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_lower_leg.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_lower_leg.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_lower_leg.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_lower_leg.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_lower_leg.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_foot.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_foot.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_foot.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_foot.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_foot.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_foot.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_foot.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_foot.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_foot.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_foot.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_foot.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_foot.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_foot.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_foot.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'spine.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'spine.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'spine.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'spine.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'spine.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'spine.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'spine.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'upper_spine.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'upper_spine.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'upper_spine.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'upper_spine.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'upper_spine.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'upper_spine.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'upper_spine.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'neck.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'neck.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'neck.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'neck.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'neck.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'neck.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'neck.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'head.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'head.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'head.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'head.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'head.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'head.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'head.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_shoulder.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_shoulder.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_shoulder.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_shoulder.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_shoulder.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_shoulder.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_shoulder.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_shoulder.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_shoulder.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_shoulder.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_shoulder.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_shoulder.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_shoulder.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_shoulder.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_upper_arm.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_upper_arm.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_upper_arm.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_upper_arm.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_upper_arm.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_upper_arm.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_upper_arm.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_upper_arm.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_upper_arm.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_upper_arm.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_upper_arm.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_upper_arm.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_upper_arm.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_upper_arm.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_lower_arm.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_lower_arm.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_lower_arm.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_lower_arm.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_lower_arm.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_lower_arm.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_lower_arm.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_lower_arm.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_lower_arm.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_lower_arm.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_lower_arm.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_lower_arm.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_lower_arm.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_lower_arm.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_hand.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_hand.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_hand.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_hand.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_hand.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_hand.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_hand.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_hand.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_hand.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_hand.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_hand.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_hand.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_hand.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_hand.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'mass_center.x',
        'unknown',
        'desconocido',
        'Descripción no definida; revisa.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'mass_center.y',
        'unknown',
        'desconocido',
        'Descripción no definida; revisa.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'mass_center.z',
        'unknown',
        'desconocido',
        'Descripción no definida; revisa.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'PelvisTilt.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'PelvisTilt.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'PelvisTilt.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'PelvisList.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'PelvisList.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'PelvisList.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'PelvisRotation.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'PelvisRotation.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'PelvisRotation.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'HipFlexExtR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'HipFlexExtR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'HipFlexExtR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'HipAddAbdR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'HipAddAbdR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'HipAddAbdR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'HipRotR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'HipRotR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'HipRotR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'KneeFlexExtR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'KneeFlexExtR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'KneeFlexExtR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'AnkleFlexExtR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'AnkleFlexExtR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'AnkleFlexExtR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'AnkleProSupR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'AnkleProSupR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'AnkleProSupR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'HipFlexExtL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'HipFlexExtL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'HipFlexExtL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'HipAddAbdL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'HipAddAbdL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'HipAddAbdL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'HipRotL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'HipRotL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'HipRotL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'KneeFlexExtL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'KneeFlexExtL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'KneeFlexExtL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'AnkleFlexExtL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'AnkleFlexExtL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'AnkleFlexExtL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'AnkleProSupL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'AnkleProSupL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'AnkleProSupL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ElbowFlexExtR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ElbowFlexExtR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ElbowFlexExtR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ForearmProSupR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ForearmProSupR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ForearmProSupR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'WristFlexExtR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'WristFlexExtR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'WristFlexExtR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'WristDeviationR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'WristDeviationR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'WristDeviationR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ElbowFlexExtL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ElbowFlexExtL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ElbowFlexExtL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ForearmProSupL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ForearmProSupL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ForearmProSupL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'WristFlexExtL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'WristFlexExtL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'WristFlexExtL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'WristDeviationL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'WristDeviationL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'WristDeviationL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'LumbarLatFlex.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'LumbarLatFlex.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'LumbarLatFlex.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'LumbarRot.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'LumbarRot.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'LumbarRot.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'LumbarFlexExt.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'LumbarFlexExt.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'LumbarFlexExt.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'LowerThoraxLatFlex.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'LowerThoraxLatFlex.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'LowerThoraxLatFlex.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'LowerThoraxRot.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'LowerThoraxRot.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'LowerThoraxRot.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'LowerThoraxFlexExt.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'LowerThoraxFlexExt.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'LowerThoraxFlexExt.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'UpperThoraxLatFlex.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'UpperThoraxLatFlex.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'UpperThoraxLatFlex.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'UpperThoraxRot.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'UpperThoraxRot.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'UpperThoraxRot.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'UpperThoraxFlexExt.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'UpperThoraxFlexExt.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'UpperThoraxFlexExt.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ScapulaDeprElevR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ScapulaDeprElevR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ScapulaDeprElevR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ScapulaProtrRetrR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ScapulaProtrRetrR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ScapulaProtrRetrR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ScapulaDeprElevL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ScapulaDeprElevL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ScapulaDeprElevL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ScapulaProtrRetrL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ScapulaProtrRetrL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ScapulaProtrRetrL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ShoulderAddAbdR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ShoulderAddAbdR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ShoulderAddAbdR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ShoulderRotR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ShoulderRotR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ShoulderRotR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ShoulderFlexExtR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ShoulderFlexExtR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ShoulderFlexExtR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ShoulderAddAbdL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ShoulderAddAbdL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ShoulderAddAbdL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ShoulderRotL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ShoulderRotL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ShoulderRotL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ShoulderFlexExtL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ShoulderFlexExtL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'ShoulderFlexExtL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'left_foot.contact',
        'contact',
        'contacto',
        'Indicador (0/1) de si la parte está en contacto con el suelo.'
    ) ON CONFLICT DO NOTHING;

INSERT INTO
    PROCESSEDMOCAP_METADATA (
        TABLE_NAME,
        COLUMN_NAME,
        MEANING_EN,
        TRANSLATION_ES,
        DESCRIPTION
    )
VALUES (
        'processedmocap',
        'right_foot.contact',
        'contact',
        'contacto',
        'Indicador (0/1) de si la parte está en contacto con el suelo.'
    ) ON CONFLICT DO NOTHING;

-- 4. Insertar metadatos de columnas de RawMocap

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '4.0.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '4.0.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '4.0.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '4.0.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '4.0.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '4.0.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '4.0.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '4.0.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '4.0.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '4.0.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '4.0.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '4.0.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '4.0.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '4.0.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '4.0.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '4.0.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '4.0.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '4.0.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '4.0.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '4.0.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '4.0.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '4.0.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.0.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.0.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.0.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.0.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.0.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.0.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.0.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.0.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.0.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.0.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.0.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.0.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.0.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.0.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.0.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.0.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.0.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.0.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.0.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.0.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.0.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.0.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.1.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.1.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.1.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.1.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.1.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.1.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.1.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.1.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.1.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.1.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.1.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.1.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.1.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.1.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.1.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.1.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.1.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.1.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.1.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.1.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.1.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.1.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.2.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.2.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.2.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.2.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.2.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.2.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.2.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.2.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.2.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.2.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.2.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.2.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.2.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.2.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.2.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.2.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.2.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.2.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.2.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.2.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.2.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.2.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '0.2.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.0.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.0.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.0.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.0.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.0.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.0.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.0.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.0.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.0.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.0.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.0.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.0.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.0.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.0.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.0.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.0.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.0.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.0.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.0.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.0.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.0.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.0.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.1.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.1.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.1.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.1.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.1.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.1.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.1.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.1.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.1.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.1.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.1.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.1.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.1.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.1.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.1.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.1.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.1.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.1.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.1.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.1.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.1.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.1.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.2.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.2.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.2.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.2.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.2.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.2.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.2.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.2.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.2.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.2.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.2.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.2.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.2.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.2.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.2.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.2.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.2.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.2.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.2.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.2.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.2.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '1.2.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.0.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.0.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.0.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.0.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.0.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.0.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.0.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.0.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.0.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.0.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.0.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.0.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.0.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.0.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.0.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.0.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.0.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.0.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.0.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.0.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.0.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.0.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.0.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.1.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.1.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.1.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.1.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.1.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.1.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.1.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.1.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.1.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.1.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.1.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.1.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.1.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.1.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.1.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.1.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.1.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.1.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.1.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.1.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.1.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.1.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.2.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.2.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.2.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.2.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.2.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.2.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.2.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.2.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.2.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.2.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.2.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.2.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.2.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.2.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.2.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.2.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.2.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.2.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.2.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.2.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.2.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.2.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.3.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.3.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.3.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.3.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.3.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.3.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.3.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.3.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.3.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.3.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.3.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.3.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.3.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.3.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.3.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.3.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.3.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.3.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.3.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.3.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.3.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '6.3.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.0.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.0.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.0.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.0.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.0.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.0.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.0.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.0.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.0.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.0.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.0.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.0.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.0.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.0.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.0.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.0.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.0.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.0.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.0.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.0.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.0.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.0.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.1.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.1.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.1.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.1.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.1.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.1.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.1.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.1.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.1.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.1.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.1.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.1.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.1.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.1.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.1.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.1.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.1.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.1.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.1.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.1.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.1.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.1.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.2.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.2.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.2.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.2.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.2.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.2.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.2.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.2.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.2.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.2.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.2.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.2.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.2.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.2.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.2.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.2.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.2.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.2.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.2.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.2.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.2.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    );

INSERT INTO
    teslasuit.rawmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'rawmocap',
        '7.2.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    );

-- Consultas de verificación
SELECT * FROM teslasuit.table_info;

SELECT * FROM teslasuit.ppghrv_metadata;

SELECT * FROM teslasuit.table_info;

SELECT * FROM teslasuit.processedppg_metadata;

SELECT * FROM teslasuit.table_info;

SELECT * FROM teslasuit.rawppg_metadata;

SELECT * FROM teslasuit.table_info;

SELECT * FROM teslasuit.processedmocap_metadata;

SELECT * FROM teslasuit.table_info;

SELECT * FROM teslasuit.rawmocap_metadata;