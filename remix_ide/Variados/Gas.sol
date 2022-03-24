//SPDX-License-Identifier: GLP-3.0

pragma solidity > 0.7.9 <0.9.0;

contract Gas {
   
   // ver variable transaction cost
   uint public numero;

   function asignarNumero(uint entrada) public {
       numero = entrada;
   }

}
