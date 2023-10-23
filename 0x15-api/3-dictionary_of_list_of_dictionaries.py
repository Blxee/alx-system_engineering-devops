#!/usr/bin/python3
''' 3. Dictionary of list of dictionaries '''
import json
from urllib import request

if __name__ == '__main__':
    url = 'https://jsonplaceholder.typicode.com/users/'

    with request.urlopen(url) as response:
        users = json.load(response)
        json_dict = {}
        for user in users:
            user_id = str(user.get('id'))
            user_name = user.get('username')
            with request.urlopen(url + user_id + '/todos/') as response:
                todos = json.load(response)
                json_dict[user_id] = [
                    {
                        "username": user_name,
                        "task": todo.get('title'),
                        "completed": todo.get('completed'),
                    }
                    for todo in todos
                ]

    with open('todo_all_employees.json', 'w') as file:
        json.dump(json_dict, file)
