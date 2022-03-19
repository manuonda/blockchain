//SPDX-License-Identifier: GLP-3.0

pragma solidity > 0.7.0 <0.9.0;

contract Eventos {

    uint[] public numeros;
    string public resultado;

    event NotificacionCondicion(bool condicion, address owner);
    
    constructor(bool condicion) {
      if (condicion) {
          resultado =  "Condicion true";
      } else {
          resultado ="Condicion False";
      }

      for(uint iterator = 0 ; iterator < 10 ; iterator ++ ){
          numeros.push(iterator*2);
      }

      emit NotificacionCondicion(condicion, msg.sender);
    }

    function 

}