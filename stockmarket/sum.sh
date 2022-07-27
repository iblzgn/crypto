#!/bin/bash

#sleep 15

export PGPASSWORD='Jbdyg&,bdv^dhjT';


#RSHB
gazprshbcount=20
sgzhrshbcount=200
rubrshb=393.57
#VTB
alrsvtbcount=80
gazpvtbcount=100
kmazvtbcount=1260
lsrgvtbcount=10
lkohvtbcount=5
nvtkvtbcount=6
kzosvtbcount=100
rosnvtbcount=50
mrkzvtbcount=310000
enruvtbcount=15000
rubvtb=$(psql -d "bitfinex" -h "10.0.0.4" -U "bitfinexuser" --quiet -tA -c "select balance from walletstatus where type = 'vtbrubcount';")
#BCS
enrubcscount=9000
afksbcscount=500
belubcscount=4
gazpbcscount=110
kmazbcscount=530
nlmkbcscount=30
ogkbbcscount=10000
sberbcscount=40
rubbcs=2029.96

#echo $rubvtb



gazp=$(curl -s "https://iss.moex.com/iss/engines/stock/markets/shares/boards/TQBR/securities/gazp.json?iss.meta=off&iss.only=marketdata&marketdata.columns=SECID,LAST" | jq .marketdata.data[0][1])
sgzh=$(curl -s "https://iss.moex.com/iss/engines/stock/markets/shares/boards/TQBR/securities/sgzh.json?iss.meta=off&iss.only=marketdata&marketdata.columns=SECID,LAST" | jq .marketdata.data[0][1])
alrs=$(curl -s "https://iss.moex.com/iss/engines/stock/markets/shares/boards/TQBR/securities/alrs.json?iss.meta=off&iss.only=marketdata&marketdata.columns=SECID,LAST" | jq .marketdata.data[0][1])
kmaz=$(curl -s "https://iss.moex.com/iss/engines/stock/markets/shares/boards/TQBR/securities/kmaz.json?iss.meta=off&iss.only=marketdata&marketdata.columns=SECID,LAST" | jq .marketdata.data[0][1])
lsrg=$(curl -s "https://iss.moex.com/iss/engines/stock/markets/shares/boards/TQBR/securities/lsrg.json?iss.meta=off&iss.only=marketdata&marketdata.columns=SECID,LAST" | jq .marketdata.data[0][1])
lkoh=$(curl -s "https://iss.moex.com/iss/engines/stock/markets/shares/boards/TQBR/securities/lkoh.json?iss.meta=off&iss.only=marketdata&marketdata.columns=SECID,LAST" | jq .marketdata.data[0][1])
nvtk=$(curl -s "https://iss.moex.com/iss/engines/stock/markets/shares/boards/TQBR/securities/nvtk.json?iss.meta=off&iss.only=marketdata&marketdata.columns=SECID,LAST" | jq .marketdata.data[0][1])
kzos=$(curl -s "https://iss.moex.com/iss/engines/stock/markets/shares/boards/TQBR/securities/kzos.json?iss.meta=off&iss.only=marketdata&marketdata.columns=SECID,LAST" | jq .marketdata.data[0][1])
rosn=$(curl -s "https://iss.moex.com/iss/engines/stock/markets/shares/boards/TQBR/securities/rosn.json?iss.meta=off&iss.only=marketdata&marketdata.columns=SECID,LAST" | jq .marketdata.data[0][1])
mrkz=$(curl -s "https://iss.moex.com/iss/engines/stock/markets/shares/boards/TQBR/securities/mrkz.json?iss.meta=off&iss.only=marketdata&marketdata.columns=SECID,LAST" | jq .marketdata.data[0][1])
enru=$(curl -s "https://iss.moex.com/iss/engines/stock/markets/shares/boards/TQBR/securities/enru.json?iss.meta=off&iss.only=marketdata&marketdata.columns=SECID,LAST" | jq .marketdata.data[0][1])
afks=$(curl -s "https://iss.moex.com/iss/engines/stock/markets/shares/boards/TQBR/securities/afks.json?iss.meta=off&iss.only=marketdata&marketdata.columns=SECID,LAST" | jq .marketdata.data[0][1])
belu=$(curl -s "https://iss.moex.com/iss/engines/stock/markets/shares/boards/TQBR/securities/belu.json?iss.meta=off&iss.only=marketdata&marketdata.columns=SECID,LAST" | jq .marketdata.data[0][1])
nlmk=$(curl -s "https://iss.moex.com/iss/engines/stock/markets/shares/boards/TQBR/securities/nlmk.json?iss.meta=off&iss.only=marketdata&marketdata.columns=SECID,LAST" | jq .marketdata.data[0][1])
ogkb=$(curl -s "https://iss.moex.com/iss/engines/stock/markets/shares/boards/TQBR/securities/ogkb.json?iss.meta=off&iss.only=marketdata&marketdata.columns=SECID,LAST" | jq .marketdata.data[0][1])
sber=$(curl -s "https://iss.moex.com/iss/engines/stock/markets/shares/boards/TQBR/securities/sber.json?iss.meta=off&iss.only=marketdata&marketdata.columns=SECID,LAST" | jq .marketdata.data[0][1])



gazprshbptotal=$(bc<<<"scale=3;$gazp*$gazprshbcount")
sgzhrshbptotal=$(bc<<<"scale=3;$sgzh*$sgzhrshbcount")


gazpvtbtotal=$(bc<<<"scale=3;$gazp*$gazpvtbcount")
alrsvtbtotal=$(bc<<<"scale=3;$alrs*$alrsvtbcount")
kmazvtbtotal=$(bc<<<"scale=3;$kmaz*$kmazvtbcount")
lsrgvtbtotal=$(bc<<<"scale=3;$lsrg*$lsrgvtbcount")
lkohvtbtotal=$(bc<<<"scale=3;$lkoh*$lkohvtbcount")
nvtkvtbtotal=$(bc<<<"scale=3;$nvtk*$nvtkvtbcount")
kzosvtbtotal=$(bc<<<"scale=3;$kzos*$kzosvtbcount")
rosnvtbtotal=$(bc<<<"scale=3;$rosn*$rosnvtbcount")
mrkzvtbtotal=$(bc<<<"scale=3;$mrkz*$mrkzvtbcount")
enruvtbtotal=$(bc<<<"scale=3;$enru*$enruvtbcount")

enrubcstotal=$(bc<<<"scale=3;$enru*$enrubcscount")
afksbcstotal=$(bc<<<"scale=3;$afks*$afksbcscount")
belubcstotal=$(bc<<<"scale=3;$belu*$belubcscount")
gazpbcstotal=$(bc<<<"scale=3;$gazp*$gazpbcscount")
kmazbcstotal=$(bc<<<"scale=3;$kmaz*$kmazbcscount")
nlmkbcstotal=$(bc<<<"scale=3;$nlmk*$nlmkbcscount")
ogkbbcstotal=$(bc<<<"scale=3;$ogkb*$ogkbbcscount")
sberbcstotal=$(bc<<<"scale=3;$sber*$sberbcscount")


#echo $gazprshbptotal
#echo $sgzhrshbptotal


rshbsummary=$(bc<<<"scale=3;$gazprshbptotal+$sgzhrshbptotal+$rubrshb")

vtbsummary=$(bc<<<"scale=3;$alrsvtbtotal+$kmazvtbtotal+$lsrgvtbtotal+$lkohvtbtotal+$nvtkvtbtotal+$kzosvtbtotal+$rosnvtbtotal+$mrkzvtbtotal+$enruvtbtotal+$gazpvtbtotal+$rubvtb")

bcssummary=$(bc<<<"scale=3;$enrubcstotal+$afksbcstotal+$belubcstotal+$gazpbcstotal+$kmazbcstotal+$nlmkbcstotal+$ogkbbcstotal+$sberbcstotal+$rubbcs")


summa=$(bc<<<"scale=3;$rshbsummary+$vtbsummary+$bcssummary")


#echo $bcssummary


time=$(date +"%Y-%m-%d %H:%M:%S%Z")
export PGPASSWORD='Jbdyg&,bdv^dhjT'; psql -d "bitfinex" -h "10.0.0.4" -U "bitfinexuser" -c "INSERT INTO rshbsummary(timedate, balance)VALUES('$time', $rshbsummary);"

export PGPASSWORD='Jbdyg&,bdv^dhjT'; psql -d "bitfinex" -h "10.0.0.4" -U "bitfinexuser" -c "INSERT INTO vtbsummary(timedate, balance)VALUES('$time', $vtbsummary);"

export PGPASSWORD='Jbdyg&,bdv^dhjT'; psql -d "bitfinex" -h "10.0.0.4" -U "bitfinexuser" -c "INSERT INTO bcssummary(timedate, balance)VALUES('$time', $bcssummary);"

export PGPASSWORD='Jbdyg&,bdv^dhjT'; psql -d "bitfinex" -h "10.0.0.4" -U "bitfinexuser" -c "INSERT INTO stocksummary(timedate, balance)VALUES('$time', $summa);"



