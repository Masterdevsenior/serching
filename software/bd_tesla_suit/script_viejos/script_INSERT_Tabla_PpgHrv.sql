-- 1. Insertar metadatos por cada columna de PpgHrv
INSERT INTO
    ppghrv_metadata (
        table_name,
        column_name,
        meaning_en,
        translation_es,
        description
    )
VALUES (
        'PpgHrv',
        'frame_number',
        'frame number',
        'número de fotograma',
        'Cada fotograma corresponde a una medición puntual de la señal PPG. Este campo es un contador incremental que indica el orden de las mediciones, útil para sincronizar con otros sistemas.'
    ),
    (
        'PpgHrv',
        'frame_timestamp',
        'frame timestamp',
        'marca de tiempo del fotograma',
        'Instante real (hora, minuto, segundo y fracción) en que se capturó cada fotograma de PPG, basado en el reloj interno del Teslasuit, para correlacionar eventos y sincronizar datos.'
    ),
    (
        'PpgHrv',
        'mean_rr',
        'mean RR interval',
        'intervalo R‑R medio',
        'Duración promedio en milisegundos de los intervalos R‑R (tiempo entre dos latidos consecutivos), asociado al balance entre sistemas simpático y parasimpático.'
    ),
    (
        'PpgHrv',
        'sdnn',
        'standard deviation of normal‑to‑normal intervals',
        'desviación estándar de los intervalos normales R‑R',
        'Variabilidad global de la frecuencia cardíaca calculada como la desviación estándar de todos los intervalos R‑R en una ventana de tiempo.'
    ),
    (
        'PpgHrv',
        'sdsd',
        'standard deviation of successive differences',
        'desviación estándar de las diferencias sucesivas de intervalos R‑R',
        'Variabilidad a muy corto plazo medida como la desviación estándar de las diferencias entre intervalos R‑R consecutivos.'
    ),
    (
        'PpgHrv',
        'rmssd',
        'root mean square of successive differences',
        'raíz cuadrada de la media de los cuadrados de las diferencias sucesivas de intervalos R‑R',
        'Indicador de la actividad parasimpática calculado como la raíz cuadrática media de las diferencias sucesivas de intervalos R‑R.'
    ),
    (
        'PpgHrv',
        'sd1',
        'Poincaré plot SD1',
        'desviación estándar perpendicular al eje de identidad en el diagrama de Poincaré',
        'Métrica de variabilidad instantánea obtenida de la dispersión perpendicular en el diagrama de Poincaré de intervalos R‑R.'
    ),
    (
        'PpgHrv',
        'sd2',
        'Poincaré plot SD2',
        'desviación estándar a lo largo del eje de identidad en el diagrama de Poincaré',
        'Métrica de variabilidad a largo plazo obtenida de la dispersión a lo largo del eje de identidad en el diagrama de Poincaré.'
    ),
    (
        'PpgHrv',
        'lf_hf',
        'low‑frequency to high‑frequency ratio',
        'cociente de baja frecuencia con alta frecuencia',
        'Balance simpático‑parasimpático calculado como el cociente de la potencia espectral en bandas de baja y alta frecuencia.'
    ) ON CONFLICT DO NOTHING;

-- 7. Consultas de verificación
SELECT * FROM table_info;

SELECT * FROM ppghrv_metadata;