import json
import requests

response = requests.get('http://35.171.23.161/')
print(response)
print(response.status_code)
response2 = requests.get('http://35.171.23.161/')