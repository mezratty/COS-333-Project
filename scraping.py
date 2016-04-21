from bs4 import BeautifulSoup
import re
import requests
from firebase import firebase

firebase = firebase.FirebaseApplication('https://blistering-torch-3510.firebaseio.com/', None)

r = requests.get('http://www.goprincetontigers.com/main/Schedule.dbml?&DB_OEM_ID=10600&DB_OEM_ID=10600.htm')
soup = BeautifulSoup(r.content)

teams = soup.find_all("td", attrs={"class": "team"})
opponents = soup.find_all("td", attrs={"class": "opponent"})
dates = soup.find_all("td", attrs={"class": "date"})
times = soup.find_all("td", attrs={"class": "time"})

for i in range(len(teams)):
	data = {'team': teams[i].string, 'opponent': opponents[i].string, 'date': dates[i].string, 'time': times[i].string}
	firebase.post('/games', data)



