const Web3  = require('web3')
const EthereumTx = require('ethereumjs-tx').Transaction
const fetch = require('fetch');

// Llamada a los archivos .json
const contractJson = require('../build/contracts/Oracle.json');
const { toHex } = require('web3-utils');

// Instancia de Web3
// Instancia de web3
const web3 = new Web3('ws://127.0.0.1:7545');

// Informacion de direcciones de Ganache 
const addressContract =  '0xE6fcA9a5D59D2fe19179B6a515DaA1FC03be94Ce';
const contractInstance = new web3.eth.Contract(contractJson.abi , addressContract);
const privateKey = Buffer.from('d7b62faefc3c93bb0eee8f28ab2a1940aacc3ded8bec588c0548660075a92259','hex');
const address = '0x0acB5B4F27b4E1F7466a01BA0fc3DBF931a7c48f';



// Obtener el número de bloque
web3.eth.getBlockNumber()
    .then(n => listenEvent(n - 1))

// Función: listenEvent()
function listenEvent(lastBlock) {
    contractInstance.events.__calbackNewData({}, { fromBlock: lastBlock, toBlock: 'latest' }, (err, event) => {
        event ? updateData() : null
        err ? console.log(err) : null
    })
}


function updateData() {
    console.log("update data");
    //start_date 
    let start_date = '2015-09-10';
    let end_date   = '2015-09-13';

    const url = `https://api.nasa.gov/neo/rest/v1/feed?start_date=${start_date}&end_date=${end_date}&api_key=API_KEY`;
    console.log(url);
    // fetch(url)
    //     .then(response  => response.json())
    //     .then(json => setDataContract(json_element_count));
    setDataContract(23);
}


function setDataContract(_value) {
     web3.eth.getTransactionCount(address, (error, txNum) => {
        contractInstance.methods.setNumberAsteroids(_value).estimateGas({}, function(error, gasAmount) {
                
                const txtObject = {
                    nonce: web3.utils.toHex(txNum),
                    gasPrice: web3.utils.toHex(web3.utils.toWei('1.4', 'gwei')),
                    gasLimit: web3.utils.toHex(gasAmount),
                    to: addressContract,
                    value:'0x00',
                    data: contractInstance.methods.setNumberAsteroids(_value).encodeABI()
                   } ;

                 
                   const tx = new EthereumTx(txtObject, { chain: 'mainnet', hardfork: 'petersburg' })
tx.sign(privateKey)
const serializedTx = tx.serialize()
                  
                 //   Firma de la transaction
                 //const tx =  Tx(txtObject);
                //  tx.sign(privateKey);
                //  const serializedTx = tx.seralize();
                 const raw = '0x' + serializedTx.toString('hex');
                 web3.eth.sendTransaction(raw, function(error, result) {
                     
                 });
            })
    });
}