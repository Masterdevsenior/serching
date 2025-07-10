import pandas as pd
from domain_layer.icc_analyzer import ICCAnalyzer

def test_calculate_icc_for_variables():
    analyzer = ICCAnalyzer()
    df = pd.DataFrame({
        "subject": [1,1,2,2],
        "repetition": [1,2,1,2],
        "score": [10,12,11,13],
        "variable": ["var1","var1","var1","var1"]
    })
    result = analyzer.calculate_icc_for_variables(df)
    assert isinstance(result, list)
    assert "variable" in result[0]
    assert "correlacion" in result[0] 