const fs = require('fs')
const crypto = require('crypto-js') // Standard JavaScript cryptography library
const WebSocket = require('ws') // Websocket library for Node
//const Client  = require('pg')

const apiKey = 'nbkLPMBn2aOZ5gTECL9U3X8Jkxd7orislDr2nMcShsE' // Users API credentials are defined here
const apiSecret = 'uJklsElaC1UwAp4r4EUPdMLaXqxSkZERlgqTlDvnpn7'

const authNonce = Date.now() * 1000 // Generate an ever increasing, single use value. (a timestamp satisfies this criteria)
const authPayload = 'AUTH' + authNonce // Compile the authentication payload, this is simply the string 'AUTH' prepended to the nonce value
const authSig = crypto.HmacSHA384(authPayload, apiSecret).toString(crypto.enc.Hex) // The authentication payload is hashed using the private key, the resulting hash is output as a hexadecimal string

const payload = {
  apiKey, //API key
  authSig, //Authentication Sig
  authNonce, 
  authPayload,
  event: 'auth', // The connection event, will always equal 'auth'
  filter: [
    'balance' // balance (tradable balance, ...)
  ]
}

const wss = new WebSocket('wss://api.bitfinex.com/ws/2') // Create new Websocket

wss.on('open', () => wss.send(JSON.stringify(payload)))

wss.on('message', (msg) => {     // The 'message' event is called whenever the ws recieves ANY message
  let response = JSON.parse(msg)

const response2 = Array.from(response).includes('bu');

console.log(response2);

if (response2  === true)
 {

const new1 = response.toString()
//console.log (new1)
const regex = /[^,]+(?=,[^,]*$)/g;
//const regex = /[^,]+(?=,[^,]*$)/g;
const response3 = new1.match(regex);
//console.log(response3);
const new2 = response3.toString()
//console.log(new2);

var new3 = parseFloat(new2).toFixed(2)

console.log(new3)

//postgres
const { Pool } = require("pg");
const pool = new Pool({
    host: '10.0.0.4',
    user: 'bitfinexuser',
    database: 'bitfinex',
    password: 'Jbdyg&,bdv^dhjT',
    port: 5432,
});

//const td = "2022-01-01 18:18:18"
//const t = new Date(Date.now()).toISOString();
//console.log(t);

var date = new Date(); // Or the date you'd like converted.
var t = new Date(date.getTime() - (date.getTimezoneOffset() * 60000)).toISOString();
//console.log(isoDateTime);


pool.query(
  "INSERT INTO bitfinex(timedate, balance)VALUES($1, $2)",
[t, new3],
  (err, res) => {
    console.log(err, res);
    pool.end();
  }
);

fs.writeFile('./helloworld.json', new3, err => {
  if (err) {
    console.error(err)
    return
  }
    })
//console.log(str);

}

//fs.writeFile('./helloworld.json', response, err => {
  //if (err) {
    //console.error(err)
    //return
  //}
    //})
//    console.log(response)


//    fs.writeFile('helloworld.json', JSON.stringify(response, null, 4));
  //console.log(response)
})

