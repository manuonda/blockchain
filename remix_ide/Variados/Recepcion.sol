//SPDX-License-Identifier: GLP-3.0

pragma solidity > 0.7.9 <0.9.0;

contract Recepcion {

      mapping(address =>  uint) balances;
      uint public saldoEnviado;
      uint public montoEnviado;
   
    // funcion que permite recibir saldos , transferencia limpias
    receive() external payable {
         balances[msg.sender] += msg.value; 
    }   


    fallback() external payable {
        
    }

    function recibirSaldo(uint numero) public payable {
        saldoEnviado = msg.value;
        montoEnviado = numero;
    }

    // le podemos enviar saldos al ether desde su creacion
    constructor() payable {
     
    }


}
