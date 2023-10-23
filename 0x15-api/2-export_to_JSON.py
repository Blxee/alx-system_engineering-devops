#!/usr/bin/python3
''' 0. Gather data from an API '''
import json
from sys import argv
from urllib import request

if __name__ == '__main__':
    emp_id = argv[1]
    url = 'https://jsonplaceholder.typicode.com/users/' + emp_id

    with request.urlopen(url) as response:
        user = json.load(response)

    with request.urlopen(url + '/todos/') as response:
        todos = json.load(response)

    done = len(list(filter(lambda t: t.get('completed'), todos)))

    with open(f'{emp_id}.json', 'w') as file:
        todo_list = [
            {
                "task": todo.get('title'),
                "completed": todo.get('completed'),
                "username": user.get('username'),
            }
            for todo in todos
        ]
        json.dump({str(emp_id): todo_list}, file)
