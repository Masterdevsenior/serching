import pandas as pd
from presentation_layer.streamlit_app import get_resultados_icc

def test_export_creates_csv(tmp_path):
    results = {
        "results": {
            "resultados_icc": [
                {"variable": "var1", "correlacion": 0.95, "sujetos": 10},
                {"variable": "var2", "correlacion": 0.85, "sujetos": 10}
            ],
            "estadisticas": {"correlacion_minima_alto_icc": 0.9}
        },
        "data_info": {"total_registros": 4, "columnas_numericas": 2},
        "file_path": "fake.csv"
    }
    class DummyService:
        def get_variable_descriptions(self, names):
            return {n: f"desc_{n}" for n in names}
    df = get_resultados_icc(results, DummyService())
    export_path = tmp_path / "export.csv"
    df.to_csv(export_path, index=False)
    assert export_path.exists()
    df2 = pd.read_csv(export_path)
    assert "descripcion" in df2.columns 