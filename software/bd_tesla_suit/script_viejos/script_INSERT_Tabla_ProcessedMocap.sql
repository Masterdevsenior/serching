-- 2. Insertar metadatos para cada columna
INSERT INTO
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
VALUES
	(
		'processedmocap',
		'ScapulaProtrRetrR.angular_acc',
		'angular acceleration',
		'aceleración angular',
-- 7. Insertar metadatos para cada columna
INSERT INTO
	PROCESSEDMOCAP_METADATA (
		TABLE_NAME,
		COLUMN_NAME,
		MEANING_EN,
		TRANSLATION_ES,
		DESCRIPTION
	)
VALUES
	(
		'processedmocap',
		'frame_number',
		'frame number',
		'número de fotograma',
		'Contador incremental que identifica el orden de cada fotograma procesado.'
	)
ON CONFLICT DO NOTHING;

INSERT INTO
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