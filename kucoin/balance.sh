#!/bin/bash

sleep 10

cat personal.json | jq '.[]' > personal2.json

#BTC
btcreq=$(jq '.[0] | .balance' personal2.json | cut -d'"' -f 2)
echo $btcreq

btccc=$(curl https://api.kucoin.com/api/v1/market/orderbook/level1?symbol=BTC-USDT | jq '.data.price' | cut -d'"' -f 2)
echo $btccc


#BTC3L
btc3lreq=$(jq '.[1] | .balance' personal2.json | cut -d'"' -f 2)
echo $btc3lreq

btc3lcc=$(curl https://api.kucoin.com/api/v1/market/orderbook/level1?symbol=BTC3L-USDT | jq '.data.price' | cut -d'"' -f 2)
echo $btc3lcc

#USDT
usdtreq=$(jq '.[2] | .balance' personal2.json | cut -d'"' -f 2)

usdtbtc=$(bc<<<"scale=3;$btcreq*$btccc")
usdtbtc3l=$(bc<<<"scale=3;$btc3lreq*$btc3lcc")

summa=$(bc<<<"scale=3;$usdtbtc+$usdtbtc3l+$usdtreq")

echo $summa
summafinal=$(echo $summa | awk '{printf("%.2f \n",$1)}')
echo $summafinal

time=$(date +"%Y-%m-%d %H:%M:%S")
export PGPASSWORD='Jbdyg&,bdv^dhjT'; psql -d "bitfinex" -h "10.0.0.4" -U "bitfinexuser" -c "INSERT INTO kucoin(timedate, balance)VALUES('$time', $summafinal);"



