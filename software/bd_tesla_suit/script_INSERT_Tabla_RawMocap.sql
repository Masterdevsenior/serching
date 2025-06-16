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
    ),
    (
        'rawmocap',
        '4.0.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '4.0.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '4.0.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '4.0.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '4.0.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '4.0.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '4.0.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '4.0.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '4.0.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '4.0.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '4.0.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '4.0.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '4.0.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '4.0.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '4.0.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '4.0.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '4.0.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '4.0.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '4.0.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '4.0.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    ),
    (
        'rawmocap',
        '4.0.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    ),
    (
        'rawmocap',
        '0.0.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '0.0.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '0.0.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '0.0.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '0.0.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '0.0.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '0.0.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '0.0.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '0.0.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '0.0.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '0.0.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '0.0.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '0.0.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '0.0.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '0.0.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '0.0.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '0.0.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '0.0.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '0.0.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '0.0.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '0.0.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    ),
    (
        'rawmocap',
        '0.0.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    ),
    (
        'rawmocap',
        '0.1.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '0.1.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '0.1.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '0.1.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '0.1.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '0.1.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '0.1.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '0.1.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '0.1.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '0.1.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '0.1.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '0.1.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '0.1.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '0.1.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '0.1.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '0.1.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '0.1.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '0.1.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '0.1.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '0.1.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '0.1.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    ),
    (
        'rawmocap',
        '0.1.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    ),
    (
        'rawmocap',
        '0.2.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '0.2.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '0.2.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '0.2.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '0.2.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '0.2.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '0.2.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '0.2.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '0.2.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '0.2.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '0.2.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '0.2.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '0.2.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '0.2.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '0.2.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '0.2.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '0.2.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '0.2.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '0.2.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '0.2.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '0.2.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    ),
    (
        'rawmocap',
        '0.2.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    ),
    (
        'rawmocap',
        '1.0.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '1.0.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '1.0.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '1.0.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '1.0.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '1.0.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '1.0.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '1.0.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '1.0.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '1.0.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '1.0.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '1.0.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '1.0.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '1.0.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '1.0.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '1.0.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '1.0.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '1.0.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '1.0.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '1.0.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '1.0.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    ),
    (
        'rawmocap',
        '1.0.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    ),
    (
        'rawmocap',
        '1.1.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '1.1.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '1.1.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '1.1.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '1.1.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '1.1.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '1.1.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '1.1.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '1.1.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '1.1.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '1.1.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '1.1.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '1.1.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '1.1.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '1.1.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '1.1.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '1.1.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '1.1.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '1.1.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '1.1.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '1.1.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    ),
    (
        'rawmocap',
        '1.1.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    ),
    (
        'rawmocap',
        '1.2.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '1.2.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '1.2.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '1.2.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '1.2.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '1.2.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '1.2.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '1.2.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '1.2.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '1.2.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '1.2.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '1.2.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '1.2.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '1.2.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '1.2.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '1.2.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '1.2.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '1.2.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '1.2.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '1.2.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '1.2.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    ),
    (
        'rawmocap',
        '1.2.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    ),
    (
        'rawmocap',
        '6.0.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '6.0.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '6.0.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '6.0.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '6.0.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '6.0.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '6.0.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '6.0.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '6.0.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '6.0.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '6.0.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '6.0.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '6.0.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '6.0.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '6.0.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '6.0.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '6.0.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '6.0.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '6.0.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '6.0.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '6.0.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    ),
    (
        'rawmocap',
        '6.0.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    ),
    (
        'rawmocap',
        '6.1.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '6.1.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '6.1.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '6.1.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '6.1.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '6.1.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '6.1.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '6.1.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '6.1.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '6.1.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '6.1.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '6.1.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '6.1.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '6.1.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '6.1.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '6.1.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '6.1.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '6.1.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '6.1.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '6.1.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '6.1.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    ),
    (
        'rawmocap',
        '6.1.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    ),
    (
        'rawmocap',
        '6.2.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '6.2.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '6.2.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '6.2.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '6.2.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '6.2.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '6.2.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '6.2.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '6.2.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '6.2.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '6.2.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '6.2.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '6.2.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '6.2.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '6.2.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '6.2.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '6.2.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '6.2.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '6.2.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '6.2.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '6.2.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    ),
    (
        'rawmocap',
        '6.2.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    ),
    (
        'rawmocap',
        '6.3.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '6.3.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '6.3.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '6.3.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '6.3.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '6.3.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '6.3.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '6.3.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '6.3.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '6.3.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '6.3.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '6.3.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '6.3.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '6.3.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '6.3.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '6.3.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '6.3.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '6.3.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '6.3.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '6.3.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '6.3.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    ),
    (
        'rawmocap',
        '6.3.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    ),
    (
        'rawmocap',
        '7.0.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '7.0.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '7.0.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '7.0.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '7.0.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '7.0.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '7.0.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '7.0.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '7.0.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '7.0.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '7.0.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '7.0.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '7.0.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '7.0.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '7.0.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '7.0.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '7.0.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '7.0.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '7.0.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '7.0.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '7.0.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    ),
    (
        'rawmocap',
        '7.0.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    ),
    (
        'rawmocap',
        '7.1.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '7.1.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '7.1.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '7.1.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '7.1.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '7.1.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '7.1.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '7.1.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '7.1.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '7.1.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '7.1.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '7.1.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '7.1.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '7.1.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '7.1.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '7.1.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '7.1.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '7.1.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '7.1.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '7.1.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '7.1.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    ),
    (
        'rawmocap',
        '7.1.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    ),
    (
        'rawmocap',
        '7.2.acc.x',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '7.2.acc.y',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '7.2.acc.z',
        'Acceleration',
        'Aceleración',
        'Mide la aceleración total del sensor en el eje correspondiente, incluyendo la gravedad, expresada en m/s² o g.'
    ),
    (
        'rawmocap',
        '7.2.gyro.x',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '7.2.gyro.y',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '7.2.gyro.z',
        'Gyroscope (Angular Velocity)',
        'Giroscopio (Velocidad angular)',
        'Mide la velocidad angular alrededor del eje correspondiente, expresada en grados por segundo.'
    ),
    (
        'rawmocap',
        '7.2.mag.x',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '7.2.mag.y',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '7.2.mag.z',
        'Magnetometer (Magnetic Field Strength)',
        'Magnetómetro (Fuerza del campo magnético)',
        'Mide la intensidad del campo magnético local en el eje correspondiente.'
    ),
    (
        'rawmocap',
        '7.2.lin_acc.x',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '7.2.lin_acc.y',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '7.2.lin_acc.z',
        'Linear Acceleration (without gravity)',
        'Aceleración lineal (sin gravedad)',
        'Mide la aceleración lineal del sensor excluyendo la componente de la gravedad.'
    ),
    (
        'rawmocap',
        '7.2.q6.w',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '7.2.q6.x',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '7.2.q6.y',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '7.2.q6.z',
        'Quaternion (6 DOF orientation)',
        'Cuaternión (orientación 6 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 6 grados de libertad.'
    ),
    (
        'rawmocap',
        '7.2.q9.w',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '7.2.q9.x',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '7.2.q9.y',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '7.2.q9.z',
        'Quaternion (9 DOF orientation)',
        'Cuaternión (orientación 9 DOF)',
        'Componente de cuaternión que representa la orientación espacial usando 9 grados de libertad, incluyendo datos de magnetómetro.'
    ),
    (
        'rawmocap',
        '7.2.imu_timestamp',
        'Inertial Measurement Unit Timestamp',
        'Marca de tiempo de la unidad IMU',
        'Marca temporal interna del sensor IMU para la lectura.'
    ),
    (
        'rawmocap',
        '7.2.temp',
        'Temperature',
        'Temperatura',
        'Temperatura interna del sensor IMU, utilizada para calibración.'
    );

-- 4. Consultas de verificación teslasuit.rawmocap_metadata
SELECT * FROM teslasuit.table_info;

SELECT * FROM teslasuit.rawmocap_metadata;