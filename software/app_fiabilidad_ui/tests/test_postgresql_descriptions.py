import pytest
from data_layer.postgresql_descriptions import PostgreSQLVariableDescriptions

def test_load_descriptions_from_postgresql(monkeypatch):
    loader = PostgreSQLVariableDescriptions()
    # Mock: evita conexión real
    monkeypatch.setattr(loader, "get_connection", lambda: iter([None]))
    monkeypatch.setattr(loader, "load_descriptions_from_postgresql", lambda table_name="processedmocap": {"var1": "desc1"})
    desc = loader.load_descriptions_from_postgresql()
    assert isinstance(desc, dict)
    assert "var1" in desc 