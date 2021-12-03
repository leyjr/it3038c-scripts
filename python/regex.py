import requests, re

data = "Hello, my email is leyjr@mail.uc.edu.  Get at me"
email = re.compile(/[A-Za-z0-9_.%-]+@+[A-z0-9.]+\.[A-z0-9]{2,})
print(email.search(data).group())

