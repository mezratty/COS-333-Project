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
locations = soup.find_all("td", attrs={"class": "location"})
dateInts = []
for i in range(len(dates)):
	dateInts.append(0)


# get rid of extra tabs and newlines 
for i in range(len(teams)):
	temp = ""
	for j in range(len(teams[i].string)):
		if (teams[i].string[j] != '\n') and (teams[i].string[j] != '\t'):
			temp += teams[i].string[j]
	teams[i] = temp	

for i in range(len(opponents)):
	temp = ""
	for j in range(len(opponents[i].string)):
		if (opponents[i].string[j] != '\n') and (opponents[i].string[j] != '\t'):
			temp += opponents[i].string[j]
	opponents[i] = temp

for i in range(len(dates)):
	temp = ""
	for j in range(len(str(dates[i].string))):
		if (str(dates[i].string)[j] != '\n') and (str(dates[i].string)[j] != '\t'):
			temp += str(dates[i].string)[j]
	dates[i] = temp

for i in range(len(times)):
	temp = ""
	for j in range(len(times[i].string)):
		if (times[i].string[j] != '\n') and (times[i].string[j] != '\t'):
			temp += times[i].string[j]
	times[i] = temp


for i in range(len(locations)):
    temp = ""
    locationString = locations[i].string
    for j in range(len(locations[i].string)):
        if (locationString[j] != '\n') and (locationString[j] != '\t'):
            temp += locationString[j]
        locations[i] = temp

#convert date format
for i in range(len(dates)):
	day = 0
	if bool(re.search('Jan', dates[i])):
		dateInts[i] = 100
	if bool(re.search('Feb', dates[i])):
		dateInts[i] = 200
	if bool(re.search('Mar', dates[i])):
		dateInts[i] = 300
	if bool(re.search('Apr', dates[i])):
		dateInts[i] = 400
	if bool(re.search('May', dates[i])):
		dateInts[i] = 500
	if bool(re.search('Jun', dates[i])):
		dateInts[i] = 600
	if bool(re.search('Jul', dates[i])):
		dateInts[i] = 700
	if bool(re.search('Aug', dates[i])):
		dateInts[i] = 800
	if bool(re.search('Sep', dates[i])):
		dateInts[i] = 900
	if bool(re.search('Oct', dates[i])):
		dateInts[i] = 1000
	if bool(re.search('Nov', dates[i])):
		dateInts[i] = 1100
	if bool(re.search('Dec', dates[i])):
		dateInts[i] = 1200
	if bool(re.search('[0-9][0-9]?', dates[i])):
		day = re.search('[0-9][0-9]?', dates[i])
		dateInts[i] += int(day.group(0))
	dateInts[i] += 20160000

for i in range(len(teams)):
	data = {'name': teams[i], 'description': opponents[i], 'date': dates[i], 'time': times[i], 'dateInt': dateInts[i], 'location': locations[i], 'source': "athletics"}
	#data = {'name': teams[i].string, 'description': opponents[i].string, 'date': dates[i].string, 'time': times[i].string}
	#firebase.post('/games', data)
	firebase.post('/events', data)



