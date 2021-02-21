import requests, sys
instanceName = sys.argv[1]
url = f'http://{instanceName}'

def validateUrl(url):
    myResponse = requests.get(url)
    if (myResponse.ok):
        print('The wensite is responding')
    else:
        raise Exception('The wensite is not responding')


validateUrl(url)