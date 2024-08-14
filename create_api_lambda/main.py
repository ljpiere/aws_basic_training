import requests


def lambda_handler(event, context):
    BASE_URL = "https://swapi.dev"
    END_POINT = "api/planets/1/"
    resp = requests.get(f"{BASE_URL}/{END_POINT}")
    data = []
    if resp.status_code == 200:
        data = resp.json()

    return {
        "status_code": 200,
        "success": True,
        "message": "Success get starwars data",
        "data": data
    }