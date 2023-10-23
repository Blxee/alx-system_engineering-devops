#!/usr/bin/python3
''' 0. Gather data from an API '''
from urllib import request
from sys import argv
import json

emp_id = argv[1]
url = 'https://jsonplaceholder.typicode.com/users/' + emp_id

with request.urlopen(url) as response:
    emp_name = json.load(response)['name']

with request.urlopen(url + '/todos/') as response:
    todos = json.load(response)

tasks_done = len(list(filter(lambda t: t['completed'], todos)))

print(f'Employee {emp_name} is done with tasks({tasks_done}/{len(todos)}):')
for todo in todos:
    if todo['completed']:
        print('\t', todo['title'])
