import requests

def requestUser(url, token):
    headers = {
        'Content-Type': "application/json",
        'Authorization': "Bearer " + token
    }
    return requests.request("GET", url, headers=headers)
