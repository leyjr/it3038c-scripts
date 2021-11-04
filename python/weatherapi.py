import requests
import json

r = requests.get('https://api.openweathermap.org/data/2.5/weather?zip=45230,us&appid=845f24712e51dd5724005ee5668841b9')
data = r.json()

print (type(data['weather'][0]))
print(data['weather'][0])

