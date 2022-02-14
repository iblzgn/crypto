#!/bin/bash

#Req to Poloniex
td=$(date +%s00000)
API_SECRET=d6af9f3527eb09ddfdf94eb83e231176a1d2021018545ff1233d47c92615b5087e3d96a101c67fb949a82bf524e05f4c846485eca1839d2aa255e4b1a1997207

reqcommand=("command=returnAvailableAccountBalances&nonce=$td")
reqcrypt=$(echo -n $reqcommand | openssl sha512 -hmac $API_SECRET | sed 's/^.* //')
#echo $reqcommand
#echo $reqcrypt

reqbpoloniex=$(curl -X POST -d "$reqcommand" -H "Key: 5U0EDUXN-0FIIHGH7-03I816G7-0R8RYX4T" -H "Sign: $reqcrypt" https://poloniex.com/tradingApi)
#echo $reqbpoloniex

#1st prepare
reqbpoloniex2=$(echo $reqbpoloniex | jq '.[]')

#2st prepare Array
unset aa
declare -A aa
aacontent=$(jq -r '. | to_entries | .[] | "[\"" + .key + "\"]=" + (.value | @sh)' <<< "$reqbpoloniex2")
#echo $aacontent

aadef="aa=($aacontent)"
eval "$aadef"
#echo "${aa[BTC]}"

#Req for crypto currency
##BTC
btccc=$(curl "https://poloniex.com/public?command=returnTicker" | jq '.USDT_BTC.last' | cut -d'"' -f 2)
#echo $btccc
##BTT
bttcc=$(curl "https://poloniex.com/public?command=returnTicker" | jq '.USDT_BTT.last' | cut -d'"' -f 2)
##DAI
daicc=$(curl "https://poloniex.com/public?command=returnTicker" | jq '.USDT_DAI.last' | cut -d'"' -f 2)
#echo $daicc
##NFT
nftcc=$(curl "https://poloniex.com/public?command=returnTicker" | jq '.USDT_NFT.last' | cut -d'"' -f 2)
##TRX
trxcc=$(curl "https://poloniex.com/public?command=returnTicker" | jq '.USDT_TRX.last' | cut -d'"' -f 2)
#echo $trxcc

usdtbtc=$(bc<<<"scale=3;${aa[BTC]}*$btccc")
usdtbtt=$(bc<<<"scale=3;${aa[BTT]}*$bttcc")
usdtdai=$(bc<<<"scale=3;${aa[DAI]}*$daicc")
usdtnft=$(bc<<<"scale=3;${aa[NFT]}*$nftcc")
usdttrx=$(bc<<<"scale=3;${aa[TRX]}*$trxcc")

summa=$(bc<<<"scale=3;$usdtbtc+$usdtbtt+$usdtdai+usdtnft+usdttrx+${aa[USDT]}")

#echo $summa
summafinal=$(echo $summa | awk '{printf("%.2f \n",$1)}')
echo $summafinal

time=$(date +"%Y-%m-%d %H:%M:%S")
export PGPASSWORD='Jbdyg&,bdv^dhjT'; psql -d "bitfinex" -h "10.0.0.4" -U "bitfinexuser" -c "INSERT INTO poloniex(timedate, balance)VALUES('$time', $summafinal);"



