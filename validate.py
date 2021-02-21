import requests, sys
instanceName = sys.argv[1]
url = 'http://{0}'.format(instanceName)

def validateUrl(url):
    myResponse = requests.get(url)
    if (myResponse.ok):
        print('The wensite is responding')
    else:
        raise Exception('The wensite is not responding')
validateUrl(url)