from bs4 import BeautifulSoup
import re
import requests
from firebase import firebase
import json
import sys

firebase = firebase.FirebaseApplication('https://blistering-torch-3510.firebaseio.com/', None)

#r = requests.get('https://tickets.princeton.edu/Online/')
# soup = BeautifulSoup(r.content, 'html5lib')
#soup = BeautifulSoup(r.content)

#script = soup.find_all("script")[18].text
script = sys.stdin.read()
regex =  re.compile('searchResults.:[^`]*searchFilters', re.MULTILINE)
script = re.findall(regex, script)
regex2 = re.compile('\[.*\]', re.MULTILINE)
searchResults = re.findall(regex2, script[0])

dates = []
for i in range(len(searchResults)):
	temp = searchResults[i].split("\", \"")[7]
	temp = temp.partition(':')[0]
	length = len(temp) - 2
	temp = temp[:length]
	dates.append(temp)

dateInts = []
for i in range(len(dates)):
	dateInts.append(0)

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

# get times
times = []
for i in range(len(dates)):
	date = searchResults[i].split("\", \"")[7]
	date = date.split(',')
	date = date[2][6:]
	times.append(date)

# 6 - name of show
# 7 - date and time
# 31 - location
# 5 - group name unless not student group

for i in range(len(searchResults)):
	temp = searchResults[i].split("\", \"")
	data = {'name': temp[6], 'description': temp[5], 'date': dates[i], 'time': times[i], 'dateInt': dateInts[i], 'location': temp[31], 'source': "tickets"}
	firebase.post('/events', data)
#print(data)

#for i in range(len(script)):
# 	# data = {'name': teams[i], 'description': opponents[i], 'date': dates[i], 'time': times[i], 'dateInt': dateInts[i]}
# 	# #data = {'name': teams[i].string, 'description': opponents[i].string, 'date': dates[i].string, 'time': times[i].string}
# 	# #firebase.post('/games', data)
# 	# firebase.post('/events', data)
#	print(i)
# 	print(script[i])



