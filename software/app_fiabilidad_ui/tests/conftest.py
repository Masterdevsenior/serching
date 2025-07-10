import pytest

@pytest.fixture
def dummy_service():
    class DummyService:
        def get_variable_descriptions(self, names):
            return {n: f"desc_{n}" for n in names}
    return DummyService() 