#!/usr/bin/python3
""" 0. How many subs? """
import requests


def number_of_subscribers(subreddit):
    """ Returns the number of subscribers a subreddit has or 0 """
    response = requests.get(
        f'https://www.reddit.com/r/{subreddit}/about.json',
        headers={'User-Agent': 'Bruh'},
        allow_redirects=False,
    )
    if response.status_code == 200:
        return response.json()['subscribers']
    else:
        return 0
