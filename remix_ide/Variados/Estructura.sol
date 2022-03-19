//SPDX-License-Identifier: GLP-3.0

pragma solidity >0.7.0 < 0.9.0;

contract Estructura {

    uint[] public numeros;
    string public resultado;
    
    constructor(bool condicion) {
      if (condicion) {
          resultado =  "Condicion true";
      } else {
          resultado ="Condicion False";
      }

      for(uint iterator = 0 ; iterator < 10 ; iterator ++ ){
          numeros.push(iterator*2);
      }
    }


}