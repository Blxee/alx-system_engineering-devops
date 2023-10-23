#!/usr/bin/python3
''' 1. Export to CSV '''
import csv
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

    with open(f'{emp_id}.csv', 'w') as file:
        csv_writer = csv.writer(file, quoting=csv.QUOTE_ALL, quotechar='"')
        for todo in todos:
            csv_writer.writerow([
                emp_id,
                emp_name,
                todo.get('completed'),
                todo.get('title'),
            ])
