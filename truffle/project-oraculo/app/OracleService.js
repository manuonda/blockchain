const Web3  = require('web3')
const Tx = require('ethereumjs-tx')
const fetch = require('fetch');

// Llamada a los archivos .json
const contractJson = require('../build/contracts/Oracle.json');

// Instancia de Web3
const web3 =new Web3();

// Informacion de direcciones de Ganache 
const addressContract =  '...';
const contractInstance = new web3.eth.Contract(contractJson.abi , addressContract);
const privateKey = Buffer.from('d7b62faefc3c93bb0eee8f28ab2a1940aacc3ded8bec588c0548660075a92259','hex');
const address = '0x0acB5B4F27b4E1F7466a01BA0fc3DBF931a7c48f';


// Obtener el numero de bloque
web3.eth.getBlockNumber().then( n => listenEvent(n-1));


//Funcion listenEvent 
function listenEvent(){
   contractInstance.events.__callbackNewData({},{fromBlock: lastBlock, toBlock = 'latest'})
}

function updateData() {
    //start_date 
    let start_date = '2015-09-10';
    let end_date   = '2015-09-13';

    const url = `https://api.nasa.gov/neo/rest/v1/feed?start_date=${start_date}&end_date=${end_date}&api_key=API_KEY`;
    console.log(url);
    fetch(url)
        .then(response  => response.json())
        .then(json => setDataContract(json_element_count));
}