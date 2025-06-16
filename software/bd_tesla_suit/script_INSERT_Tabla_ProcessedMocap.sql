-- 2. Insertar metadatos para cada columna
INSERT INTO
    teslasuit.processedmocap_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES 
    (
        'processedmocap',
        'frame_number',
        'frame number',
        'número de fotograma',
        'Contador incremental que identifica el orden de cada fotograma procesado.'
    ),
    (
        'processedmocap',
        'frame_timestamp',
        'frame timestamp',
        'marca de tiempo del fotograma',
        'Fecha y hora exactas de captura de cada frame.'
    ),
    (
        'processedmocap',
        'root.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ),
    (
        'processedmocap',
        'root.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ),
    (
        'processedmocap',
        'root.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ),
    (
        'processedmocap',
        'root.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'root.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'root.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'root.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'hips.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ),
    (
        'processedmocap',
        'hips.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ),
    (
        'processedmocap',
        'hips.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ),
    (
        'processedmocap',
        'hips.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'hips.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'hips.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'hips.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'left_upper_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ),
    (
        'processedmocap',
        'left_upper_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ),
    (
        'processedmocap',
        'left_upper_leg.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ),
    (
        'processedmocap',
        'left_upper_leg.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'left_upper_leg.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'left_upper_leg.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'left_upper_leg.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'right_upper_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ),
    (
        'processedmocap',
        'right_upper_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ),
    (
        'processedmocap',
        'right_upper_leg.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ),
    (
        'processedmocap',
        'right_upper_leg.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'right_upper_leg.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'right_upper_leg.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'right_upper_leg.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'left_lower_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ),
    (
        'processedmocap',
        'left_lower_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ),
    (
        'processedmocap',
        'left_lower_leg.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ),
    (
        'processedmocap',
        'left_lower_leg.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'left_lower_leg.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'left_lower_leg.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'right_lower_leg.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ),
    (
        'processedmocap',
        'right_lower_leg.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ),
    (
        'processedmocap',
        'right_lower_leg.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ),
    (
        'processedmocap',
        'right_lower_leg.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'right_lower_leg.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'right_lower_leg.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'right_lower_leg.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'left_foot.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ),
    (
        'processedmocap',
        'left_foot.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ),
    (
        'processedmocap',
        'left_foot.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ),
    (
        'processedmocap',
        'left_foot.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'left_foot.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'left_foot.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'left_foot.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'right_foot.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ),
    (
        'processedmocap',
        'right_foot.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ),
    (
        'processedmocap',
        'right_foot.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ),
    (
        'processedmocap',
        'right_foot.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'right_foot.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'right_foot.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'right_foot.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'spine.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ),
    (
        'processedmocap',
        'spine.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ),
    (
        'processedmocap',
        'spine.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ),
    (
        'processedmocap',
        'spine.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'spine.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'spine.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'spine.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'upper_spine.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'upper_spine.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'upper_spine.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'upper_spine.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'neck.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ),
    (
        'processedmocap',
        'neck.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ),
    (
        'processedmocap',
        'neck.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ),
    (
        'processedmocap',
        'neck.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'neck.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'neck.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'neck.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'head.position.x',
        'position X',
        'posición X',
        'Coordenada X en metros: izquierda (-) a derecha (+).'
    ),
    (
        'processedmocap',
        'head.position.y',
        'position Y',
        'posición Y',
        'Coordenada Y en metros: abajo (-) a arriba (+).'
    ),
    (
        'processedmocap',
        'head.position.z',
        'position Z',
        'posición Z',
        'Coordenada Z en metros: atrás (-) a adelante (+).'
    ),
    (
        'processedmocap',
        'right_hand.rotation.w',
        'rotation W',
        'rotación W',
        'Componente W (escalar) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'right_hand.rotation.x',
        'rotation X',
        'rotación X',
        'Componente X (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'right_hand.rotation.y',
        'rotation Y',
        'rotación Y',
        'Componente Y (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'right_hand.rotation.z',
        'rotation Z',
        'rotación Z',
        'Componente Z (vectorial) del cuaternión de orientación.'
    ),
    (
        'processedmocap',
        'mass_center.x',
        'unknown',
        'desconocido',
        'Descripción no definida; revisa.'
    ),
    (
        'processedmocap',
        'mass_center.y',
        'unknown',
        'desconocido',
        'Descripción no definida; revisa.'
    ),
    (
        'processedmocap',
        'mass_center.z',
        'unknown',
        'desconocido',
        'Descripción no definida; revisa.'
    ),
    (
        'processedmocap',
        'PelvisTilt.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'PelvisTilt.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'PelvisTilt.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'PelvisList.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'PelvisList.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'PelvisList.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'PelvisRotation.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'PelvisRotation.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'PelvisRotation.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'HipFlexExtR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'HipFlexExtR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'HipFlexExtR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'HipAddAbdR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'HipAddAbdR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'HipAddAbdR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'HipRotR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'HipRotR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'HipRotR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'KneeFlexExtR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'KneeFlexExtR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'KneeFlexExtR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'AnkleFlexExtR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'AnkleFlexExtR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'AnkleFlexExtR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'AnkleProSupR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'AnkleProSupR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'AnkleProSupR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'HipFlexExtL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'HipFlexExtL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'HipFlexExtL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'HipAddAbdL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'HipAddAbdL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'HipAddAbdL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'HipRotL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'HipRotL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'HipRotL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'KneeFlexExtL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'KneeFlexExtL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'KneeFlexExtL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'AnkleFlexExtL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'AnkleFlexExtL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'AnkleFlexExtL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'AnkleProSupL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'AnkleProSupL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'AnkleProSupL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'ElbowFlexExtR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'ElbowFlexExtR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'ElbowFlexExtR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'ForearmProSupR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'ForearmProSupR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'ForearmProSupR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'WristFlexExtR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'WristFlexExtR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'WristFlexExtR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'WristDeviationR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'WristDeviationR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'WristDeviationR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'ElbowFlexExtL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'ElbowFlexExtL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'ElbowFlexExtL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'ForearmProSupL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'ForearmProSupL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'ForearmProSupL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'WristFlexExtL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'WristFlexExtL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'WristFlexExtL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'WristDeviationL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'WristDeviationL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'WristDeviationL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'LumbarLatFlex.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'LumbarLatFlex.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'LumbarLatFlex.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'LumbarRot.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'LumbarRot.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'LumbarRot.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'LumbarFlexExt.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'LumbarFlexExt.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'LumbarFlexExt.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'LowerThoraxLatFlex.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'LowerThoraxLatFlex.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'LowerThoraxLatFlex.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'LowerThoraxRot.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'LowerThoraxRot.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'LowerThoraxRot.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'LowerThoraxFlexExt.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'LowerThoraxFlexExt.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'LowerThoraxFlexExt.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'UpperThoraxLatFlex.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'UpperThoraxLatFlex.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'UpperThoraxLatFlex.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'UpperThoraxRot.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'UpperThoraxRot.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'UpperThoraxRot.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'UpperThoraxFlexExt.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'UpperThoraxFlexExt.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'UpperThoraxFlexExt.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'ScapulaDeprElevR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'ScapulaDeprElevR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'ScapulaDeprElevR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'ScapulaProtrRetrR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'ScapulaProtrRetrR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'ScapulaProtrRetrR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'ScapulaDeprElevL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'ScapulaDeprElevL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'ScapulaDeprElevL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'ScapulaProtrRetrL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'ScapulaProtrRetrL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'ScapulaProtrRetrL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'ShoulderAddAbdR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'ShoulderAddAbdR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'ShoulderAddAbdR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'ShoulderRotR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'ShoulderRotR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'ShoulderRotR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'ShoulderFlexExtR.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'ShoulderFlexExtR.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'ShoulderFlexExtR.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'ShoulderAddAbdL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'ShoulderAddAbdL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'ShoulderAddAbdL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'ShoulderRotL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'ShoulderRotL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'ShoulderRotL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'ShoulderFlexExtL.angle',
        'angle',
        'ángulo',
        'Ángulo articular en grados (°), entre segmentos óseos adyacentes.'
    ),
    (
        'processedmocap',
        'ShoulderFlexExtL.angular_v',
        'angular velocity',
        'velocidad angular',
        'Velocidad de cambio de ángulo en grados por segundo (°/s).'
    ),
    (
        'processedmocap',
        'ShoulderFlexExtL.angular_acc',
        'angular acceleration',
        'aceleración angular',
        'Aceleración del cambio de ángulo en grados por segundo al cuadrado (°/s²).'
    ),
    (
        'processedmocap',
        'left_foot.contact',
        'contact',
        'contacto',
        'Indicador (0/1) de si la parte está en contacto con el suelo.'
    ),
    (
        'processedmocap',
        'right_foot.contact',
        'contact',
        'contacto',
        'Indicador (0/1) de si la parte está en contacto con el suelo.'
    ) ON CONFLICT DO NOTHING;

SELECT * FROM teslasuit.table_info;

SELECT * FROM teslasuit.processedmocap_metadata;