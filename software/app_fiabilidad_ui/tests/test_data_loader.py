import pytest
from data_layer.data_loader import DataLoader

def test_find_data_file_exists(tmp_path):
    file = tmp_path / "test.csv"
    file.write_text("col1,col2\n1,2")
    loader = DataLoader()
    assert loader.find_data_file(str(file)) == str(file)

def test_find_data_file_not_exists():
    loader = DataLoader()
    result = loader.find_data_file("no_existe.csv")
    # Acepta None o la ruta por defecto si existe
    assert result is None or result.endswith("ProcessedMocap.csv") 