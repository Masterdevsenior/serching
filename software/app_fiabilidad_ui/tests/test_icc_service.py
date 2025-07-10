from application_layer.icc_service import ICCService

def test_run_icc_analysis_csv(tmp_path):
    file = tmp_path / "test.csv"
    file.write_text("Sujeto,Sesion,Tiempo,var1,var2\n1,1,1,10,20\n1,1,2,12,22\n2,1,1,11,21\n2,1,2,13,23")
    service = ICCService()
    results = service.run_icc_analysis(str(file), 0.9)
    assert results["success"]
    assert "results" in results
    assert "resultados_icc" in results["results"] 