#!/bin/bash

sleep 15

req2psqlbitfinex=$(export PGPASSWORD='Jbdyg&,bdv^dhjT'; psql -qtAX -d "bitfinex" -h "10.0.0.4" -U "bitfinexuser" -c "SELECT balance FROM public.bitfinex WHERE timedate = (SELECT MAX(timedate) FROM public.bitfinex)")
#echo $req2psqlbitfinex

req2psqlpolo=$(export PGPASSWORD='Jbdyg&,bdv^dhjT'; psql -qtAX -d "bitfinex" -h "10.0.0.4" -U "bitfinexuser" -c "SELECT balance FROM public.poloniex WHERE timedate = (SELECT MAX(timedate) FROM public.poloniex)")
#echo $req2psqlpolo

req2psqlkucoin=$(export PGPASSWORD='Jbdyg&,bdv^dhjT'; psql -qtAX -d "bitfinex" -h "10.0.0.4" -U "bitfinexuser" -c "SELECT balance FROM public.kucoin WHERE timedate = (SELECT MAX(timedate) FROM public.kucoin)")
#echo $req2psqlkucoin

summausd=$(bc<<<"scale=3;$req2psqlbitfinex+$req2psqlpolo+$req2psqlkucoin")
#echo USD $summausd

rubprice=$(curl https://query1.finance.yahoo.com/v10/finance/quoteSummary/RUB=X?modules=price | jq '.quoteSummary.result[0].price.regularMarketPrice.raw'| awk '{printf("%.2f \n",$1)}')
#echo $rubprice

summarub2=$(bc<<<"scale=3;$summausd*$rubprice")
summarub=$(echo $summarub2 | awk '{printf("%.2f \n",$1)}')
#echo RUR $summarub

time=$(date +"%Y-%m-%d %H:%M:%S")
export PGPASSWORD='Jbdyg&,bdv^dhjT'; psql -d "bitfinex" -h "10.0.0.4" -U "bitfinexuser" -c "INSERT INTO summaryusd(timedate, balance)VALUES('$time', $summausd);"

export PGPASSWORD='Jbdyg&,bdv^dhjT'; psql -d "bitfinex" -h "10.0.0.4" -U "bitfinexuser" -c "INSERT INTO summaryrub(timedate, balance)VALUES('$time', $summarub);"



