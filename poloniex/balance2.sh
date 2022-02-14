#!/bin/bash

td=$(date +%s00000)
API_SECRET=d6af9f3527eb09ddfdf94eb83e231176a1d2021018545ff1233d47c92615b5087e3d96a101c67fb949a82bf524e05f4c846485eca1839d2aa255e4b1a1997207

reqcommand=("command=returnAvailableAccountBalances&nonce=$td")
reqcrypt=$(echo -n $reqcommand | openssl sha512 -hmac $API_SECRET | sed 's/^.* //')
#echo $reqcommand
#echo $reqcrypt

##btcbal=$(curl -X POST -d "$reqcommand" -H "Key: 5U0EDUXN-0FIIHGH7-03I816G7-0R8RYX4T" -H "Sign: $reqcrypt" https://poloniex.com/tradingApi) #| jq '.[].BTC' | cut -d'"' -f 2)
#echo $btcbal > balance.json
testbtcbal=

#btccur=$(curl "https://poloniex.com/public?command=returnTicker" | jq '.USDT_BTC.last' | cut -d'"' -f 2)
#echo $btc

#balance=$(bc<<<"scale=3;$btcbal*$btccur")

#echo "$balance"