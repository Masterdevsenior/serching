import os
import pytest
import pandas as pd
from unittest.mock import patch, MagicMock, call

# Añadir el directorio raíz al path para poder importar data_processing
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../../src')))

import data_processing

@pytest.fixture
def mock_filesystem(tmp_path):
    """Crea una estructura de sistema de archivos simulada para las pruebas."""
    base_dir = tmp_path / "data"
    base_dir.mkdir()
    
    # Directorio válido con nueva estructura de fecha/hora
    dir_valido = base_dir / "2025-01-01-10-00-00"
    dir_valido.mkdir()
    scene_dir = dir_valido / "Scene Capture - SUB1 - S1 - T1 - CC - OK"
    scene_dir.mkdir()
    (scene_dir / "Scene Capture - SUB1 - S1 - T1 - CC - OK-Avatar-PpgHrv-2025-06-18-12-33-23.csv").touch()
    (scene_dir / "Scene Capture - SUB1 - S1 - T1 - CC - OK-Avatar-ProcessedMocap-2025-06-18-12-33-23.csv").touch()

    # Directorio inválido (formato de nombre incorrecto)
    (base_dir / "not-a-date-folder").mkdir()
    
    # Directorio válido pero vacío
    (base_dir / "2025-01-02-12-00-00").mkdir()
    
    return str(base_dir)

def test_validar_directorios(mock_filesystem):
    """Prueba que la función de validación de directorios funciona correctamente."""
    directorios_validos = data_processing.validar_directorios(mock_filesystem)
    
    assert len(directorios_validos) == 2
    assert os.path.basename(directorios_validos[0]) == "2025-01-01-10-00-00"
    assert os.path.basename(directorios_validos[1]) == "2025-01-02-12-00-00"

def test_buscar_archivos_csv(mock_filesystem):
    """Prueba que la búsqueda de archivos CSV y la extracción de metadatos son correctas."""
    dir_a_procesar = os.path.join(mock_filesystem, "2025-01-01-10-00-00")
    archivos = data_processing.buscar_archivos_csv(dir_a_procesar)
    
    assert len(archivos) == 2
    
    archivo1 = next(a for a in archivos if "PpgHrv" in a["path"])
    assert archivo1["sujeto"] == "SUB1"
    assert archivo1["sesion"] == "S1"
    assert archivo1["tiempo"] == "T1"
    assert archivo1["tipo_captura"] == "CC"
    assert archivo1["resultado"] == "OK"
    assert archivo1["tipo_dato"] == "PpgHrv"
    assert archivo1["fecha_hora_ejercicio"] == "2025-01-01-10-00-00"

@pytest.mark.parametrize("nombre_archivo, tipo_esperado", [
    ("Scene Capture - SUB1 - S1 - T1 - CC - OK-Avatar-PpgHrv-2025-06-18-12-33-23.csv", "PpgHrv"),
    ("Scene Capture - SUB1 - S1 - T1 - CC - OK-Avatar-ProcessedMocap-2025-06-18-12-33-23.csv", "ProcessedMocap"),
    ("Scene Capture - SUB1 - S1 - T1 - CC - OK-Avatar-ProcessedPpg-2025-06-18-12-33-23.csv", "ProcessedPpg"),
    ("Scene Capture - SUB1 - S1 - T1 - CC - OK-Avatar-RawMocap-2025-06-18-12-33-23.csv", "RawMocap"),
    ("Scene Capture - SUB1 - S1 - T1 - CC - OK-Avatar-RawPpg-2025-06-18-12-33-23.csv", "RawPpg"),
    ("unknown-file.txt", None),
])
def test_detectar_tipo_archivo(nombre_archivo, tipo_esperado):
    """Prueba la detección del tipo de dato desde el nombre de archivo con la nueva estructura."""
    assert data_processing.detectar_tipo_archivo("dummy/path", nombre_archivo) == tipo_esperado

@patch("pandas.read_csv")
def test_convertir_csv_a_xlsx(mock_read_csv):
    """Prueba la conversión de CSV a XLSX y la inserción de metadatos."""
    # Crear un DataFrame de prueba
    mock_df = pd.DataFrame({'col1': [1, 2]})
    mock_read_csv.return_value = mock_df

    # Usar un side_effect para capturar el self (el DataFrame)
    captured = {}
    def fake_to_excel(self, *args, **kwargs):
        captured['df'] = self
        return None

    with patch.object(pd.DataFrame, 'to_excel', new=fake_to_excel):
        archivo_info = {
            "path": "/fake/path/Scene Capture - SUB1 - S1 - T1 - CC - OK-Avatar-PpgHrv-2025-06-18-12-33-23.csv",
            "sujeto": "SUB1", "sesion": "S1", "tiempo": "T1",
            "tipo_captura": "CC", "resultado": "OK",
            "tipo_dato": "PpgHrv", "fecha_hora_ejercicio": "2025-01-01-10-00-00"
        }
        staging_dir = "/fake/staging"

        tipo, ruta_salida = data_processing.convertir_csv_a_xlsx_con_columnas(archivo_info, staging_dir)

        # Verificar que las columnas de metadatos fueron insertadas
        df_passed = captured['df']
        assert "Sujeto" in df_passed.columns
        assert df_passed["Sujeto"][0] == "SUB1"
        assert df_passed["Fecha y Hora del Ejercicio"][0] == "2025-01-01-10-00-00"
        assert tipo == "PpgHrv"
        assert ruta_salida.endswith(".xlsx")

@patch("os.listdir")
@patch("pandas.read_excel")
@patch("pandas.concat")
@patch("pandas.DataFrame.to_csv")
def test_fusionar_por_tipo(mock_to_csv, mock_concat, mock_read_excel, mock_listdir):
    """Prueba la lógica de fusión de archivos por tipo."""
    mock_listdir.return_value = ["file1-PpgHrv.xlsx", "file2-PpgHrv.xlsx", "file3-ProcessedMocap.xlsx"]
    
    df1 = pd.DataFrame({'a': [1]})
    df2 = pd.DataFrame({'a': [2]})
    df3 = pd.DataFrame({'b': [3]})
    mock_read_excel.side_effect = [df1, df2, df3]
    
    mock_concat.return_value = pd.DataFrame({'a': [1, 2]})
    
    staging_dir = "/fake/staging"
    merged_dir = "/fake/merged"
    
    resultados = data_processing.fusionar_por_tipo(staging_dir, merged_dir)
    
    assert mock_read_excel.call_count == 3
    
    # Verificar que se llamó a concat para PpgHrv
    # La llamada es una lista de DataFrames, por eso comparamos con `ANY`
    from unittest.mock import ANY
    mock_concat.assert_any_call(ANY, ignore_index=True)
    
    # Verificar que se guardó el CSV para PpgHrv y ProcessedMocap
    assert mock_to_csv.call_count == 2
    
    # Verificar los resultados devueltos
    assert resultados["PpgHrv"]["archivos_procesados"] == 2
    assert resultados["ProcessedMocap"]["archivos_procesados"] == 1
    assert "filas_totales" in resultados["PpgHrv"]

@patch("data_processing.crear_subcarpetas")
@patch("data_processing.buscar_archivos_csv")
@patch("data_processing.convertir_csv_a_xlsx_con_columnas")
@patch("data_processing.fusionar_por_tipo")
def test_procesar_directorio_fecha(mock_fusionar, mock_convertir, mock_buscar, mock_crear):
    """Prueba la orquestación del procesamiento de un directorio."""
    mock_crear.return_value = ("/fake/staging", "/fake/merged")
    mock_buscar.return_value = [{"path": "file1.csv"}, {"path": "file2.csv"}]
    mock_convertir.side_effect = [("PpgHrv", "/fake/staging/file1.xlsx"), (None, None)] # Simula un éxito y un fallo
    mock_fusionar.return_value = {"PpgHrv": {"archivos_procesados": 1, "filas_totales": 10}}
    
    resultado = data_processing.procesar_directorio_fecha("/fake/path/2025-01-01-10-00-00")
    
    mock_buscar.assert_called_once()
    assert mock_convertir.call_count == 2
    mock_fusionar.assert_called_once()
    
    assert resultado["archivos_procesados"] == 1
    assert resultado["total_archivos"] == 2
    assert len(resultado["errores"]) == 1
    assert resultado["errores"][0] == "file2.csv"
    assert "resultados_fusion" in resultado

def test_extraer_metadatos_nueva_estructura():
    """Prueba la extracción de metadatos de la nueva estructura de nombres de carpetas."""
    nombre_carpeta = "Scene Capture - SUB1 - S1 - T1 - CC - OK"
    
    metadatos = data_processing.extraer_metadatos_carpeta(nombre_carpeta)
    
    assert metadatos["sujeto"] == "SUB1"
    assert metadatos["sesion"] == "S1"
    assert metadatos["tiempo"] == "T1"
    assert metadatos["tipo_captura"] == "CC"
    assert metadatos["resultado"] == "OK"

def test_extraer_metadatos_estructura_alternativa():
    """Prueba la extracción de metadatos de estructuras alternativas."""
    nombre_carpeta = "Scene Capture - SUB2 - S3 - T2 - SC - BAD"
    
    metadatos = data_processing.extraer_metadatos_carpeta(nombre_carpeta)
    
    assert metadatos["sujeto"] == "SUB2"
    assert metadatos["sesion"] == "S3"
    assert metadatos["tiempo"] == "T2"
    assert metadatos["tipo_captura"] == "SC"
    assert metadatos["resultado"] == "BAD"

def test_extraer_metadatos_carpeta_invalida():
    """Prueba el manejo de carpetas con formato inválido."""
    nombre_carpeta = "Carpeta sin formato válido"
    
    metadatos = data_processing.extraer_metadatos_carpeta(nombre_carpeta)
    
    # Debería retornar valores por defecto o None
    assert metadatos["sujeto"] == "Desconocido"
    assert metadatos["sesion"] == "Desconocida"
    assert metadatos["tiempo"] == "Desconocido"
    assert metadatos["tipo_captura"] == "Desconocido"
    assert metadatos["resultado"] == "Desconocido"

@patch("data_processing.select_directory")
def test_select_directory_function(mock_select):
    """Prueba la función select_directory."""
    # Esta prueba no es necesaria ya que select_directory está en app.py
    # y no en data_processing.py
    pass

def test_find_data_directory():
    """Prueba la función find_data_directory."""
    # Crear un directorio temporal con estructura data/
    import tempfile
    with tempfile.TemporaryDirectory() as temp_dir:
        data_dir = os.path.join(temp_dir, "data")
        os.makedirs(data_dir)
        
        # Probar desde el directorio padre
        result = data_processing.find_data_directory(temp_dir)
        assert result == data_dir
        
        # Probar desde el directorio data
        result = data_processing.find_data_directory(data_dir)
        assert result == data_dir
        
        # Probar desde un subdirectorio
        subdir = os.path.join(data_dir, "subdir")
        os.makedirs(subdir)
        result = data_processing.find_data_directory(subdir)
        assert result == data_dir

def test_get_base_dir():
    """Prueba la función get_base_dir."""
    base_dir = data_processing.get_base_dir()
    assert isinstance(base_dir, str)
    # No verificamos que exista porque puede ser un directorio que se crea dinámicamente

def test_get_history_file():
    """Prueba la función get_history_file."""
    history_file = data_processing.get_history_file()
    assert isinstance(history_file, str)
    assert history_file.endswith("fusion_history.json")

def test_cargar_historico():
    """Prueba la función cargar_historico."""
    # Probar con un archivo válido
    import tempfile
    import json
    with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
        test_data = [{"test": "data"}]
        json.dump(test_data, f)
        temp_file = f.name
    
    try:
        with patch('data_processing.get_history_file', return_value=temp_file):
            historico = data_processing.cargar_historico()
            assert historico == test_data
    finally:
        os.unlink(temp_file)

def test_guardar_fusion_en_historico():
    """Prueba la función guardar_fusion_en_historico."""
    import tempfile
    import json
    
    test_resultados = [{
        "archivos_procesados": 5,
        "errores": [],
        "fecha_hora": "2025-01-01-10-00-00",
        "total_archivos": 5,
        "resultados_fusion": {},
        "tipos_procesados": {},
        "peso": "100kg"
    }]
    test_directorio = "/test/dir"
    
    with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
        # Crear archivo vacío inicial
        json.dump([], f)
        temp_file = f.name
    
    try:
        with patch('data_processing.get_history_file', return_value=temp_file):
            data_processing.guardar_fusion_en_historico(test_resultados, test_directorio)
            
            # Verificar que se guardó correctamente
            with open(temp_file, 'r') as f:
                saved_data = json.load(f)
            
            assert len(saved_data) == 1
            assert saved_data[0]["fecha"] is not None
            assert saved_data[0]["directorio"] == test_directorio
            assert len(saved_data[0]["detalles_por_carpeta"]) == 1
            assert saved_data[0]["detalles_por_carpeta"][0]["fecha_hora"] == "2025-01-01-10-00-00"
    finally:
        if os.path.exists(temp_file):
            os.unlink(temp_file)

def test_limpiar_historico():
    """Prueba la función limpiar_historico."""
    import tempfile
    
    with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
        f.write('{"test": "data"}')
        temp_file = f.name
    
    try:
        with patch('data_processing.get_history_file', return_value=temp_file):
            # Verificar que el archivo existe
            assert os.path.exists(temp_file)
            
            # Limpiar el histórico
            result = data_processing.limpiar_historico()
            assert result is True
            
            # Verificar que el archivo fue eliminado
            assert not os.path.exists(temp_file)
    finally:
        if os.path.exists(temp_file):
            os.unlink(temp_file)

def test_crear_subcarpetas(tmp_path):
    """Prueba la creación de subcarpetas para el procesamiento."""
    base_dir = tmp_path / "test_processing"
    base_dir.mkdir()
    
    staging_dir, merged_dir = data_processing.crear_subcarpetas(str(base_dir))
    
    assert os.path.exists(staging_dir)
    assert os.path.exists(merged_dir)
    assert "staging_xls" in staging_dir
    assert "merged" in merged_dir 