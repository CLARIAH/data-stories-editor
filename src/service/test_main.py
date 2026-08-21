from fastapi.testclient import TestClient
from main import app  # Import your FastAPI instance

client = TestClient(app)

def test_read_datastories():
    # Calling client.get("/") tells the extension where this request goes
    response = client.get("/get_data_stories")
    assert response.status_code == 200
    # assert response.json() == {"message": "Hello World"}

def test_read_item():
    response = client.get("/get_item/ds=66081fa0-b4c2-4c16-a708-c02510ccebb3")
    assert response.status_code == 200