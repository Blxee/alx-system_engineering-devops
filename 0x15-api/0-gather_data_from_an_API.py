#!/usr/bin/python3
''' 0. Gather data from an API '''
import json
from sys import argv
from urllib import request

if __name__ == '__main__':
    emp_id = argv[1]
    url = 'https://jsonplaceholder.typicode.com/users/' + emp_id

    with request.urlopen(url) as response:
        emp_name = json.load(response).get('name')

    with request.urlopen(url + '/todos/') as response:
        todos = json.load(response)

    done = len(list(filter(lambda t: t.get('completed'), todos)))

    print(f'Employee {emp_name} is done with tasks({done}/{len(todos)}):')
    for todo in todos:
        if todo.get('completed'):
            print('\t', todo.get('title'))
