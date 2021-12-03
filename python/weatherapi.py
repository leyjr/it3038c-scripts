import requests
import json

print('Please enter your zip code: ')cd
zip = input()

r = requests.get('https://api.openweathermap.org/data/2.5/weather?zip=%s,us&appid=845f24712e51dd5724005ee5668841b9' % zip)
data = r.json()

#print (type(data['weather'][0]))
print("The weather in %s is %s" % (zip, data['weather'][0]['description']))

