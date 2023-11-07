#!/usr/bin/python3
""" 0. How many subs? """
import requests


def top_ten(subreddit):
    """ Prints 10 hottest posts of a subreddit or None """
    response = requests.get(
        f'https://www.reddit.com/r/{subreddit}/hot.json?limit=10',
        headers={'User-Agent': 'Bruh'},
        allow_redirects=False,
    )
    if response.status_code == 200:
        posts = response.json()['data']['children']
        for post in posts:
            print(post['data']['title'])
    else:
        print(None)
