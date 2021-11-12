from bs4 import BeautifulSoup
import requests, re

data = requests.get("https://www.microcenter.com/product/486421/micro-center-256gb-superspeed-usb-31-(gen-1)-flash-drive-purple").content  
soup = BeautifulSoup(data, 'html.parser')  
print(soup)

#span = soup.find("h1", {"class":"product_information_title___2rG9M product_title gl-heading gl-heading--m"})  
#title = span.text 
#span = soup.find("span", {"class":"gl-price__value gl-price__value--sale"})  
#price = span.text 
#print("Item %s has price %s" % (title, price)) 