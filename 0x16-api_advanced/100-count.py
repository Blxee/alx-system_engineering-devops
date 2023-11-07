#!/usr/bin/python3
""" 3. Count it! """
import requests


def count_words(subreddit, hot_list=[], after=None):
    """ returns list of all hottest posts of a subreddit or None """
    limit = 25
    response = requests.get(
        f'https://www.reddit.com/r/{subreddit}/hot.json?',
        params={'limit': limit, 'after': after},
        headers={'User-Agent': 'Bruh'},
        allow_redirects=False,
    )
    if response.status_code == 200:
        data = response.json()['data']
        posts = data['children']
        for post in posts:
            hot_list.append(post['data']['title'])
        if len(posts) < limit:
            return hot_list
        count_words(subreddit, after=data['after'])
    elif not hot_list:
        return None
    return hot_list
