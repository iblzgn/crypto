import time
import base64
import hashlib
import hmac
import requests
import sys, json
api_key="619aa5917aaf940001e51f83"
api_secret = "23016d3c-e756-461d-9873-fda1cbb0dbc7"
api_passphrase = "hDxZExkrL1xTLpTrMHjDCPNhVnDeuszQ"
url = 'https://api.kucoin.com/api/v1/accounts'
now = int(time.time() * 1000)
str_to_sign = str(now) + 'GET' + '/api/v1/accounts'
signature = base64.b64encode(
hmac.new(api_secret.encode('utf-8'), str_to_sign.encode('utf-8'), hashlib.sha256).digest())
passphrase = base64.b64encode(hmac.new(api_secret.encode('utf-8'), api_passphrase.encode('utf-8'), hashlib.sha256).digest())
headers = {
"KC-API-SIGN": signature,
"KC-API-TIMESTAMP": str(now),
"KC-API-KEY": api_key,
"KC-API-PASSPHRASE": passphrase,
"KC-API-KEY-VERSION": "2"
}
response = requests.request('get', url, headers=headers)
#print(response.status_code)
print(response.json())
result=(response.json())
with open('personal.json', 'w') as json_file:
    json.dump(result, json_file)