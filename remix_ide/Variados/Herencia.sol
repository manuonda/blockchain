//SPDX-License-Identifier: GLP-3.0

pragma solidity > 0.7.9 <0.9.0;


import "./Suma.sol";
import "./Modificadores.sol";

contract Herencia is Suma , Modificadores{
   
   constructor(string memory nombreNuevo) Modificadores(nombreNuevo) {
       
   }

   function sumar(uint numero1, uint numero2) public onlyOnwer() view override returns(uint) {
       return numero1+numero2; 
   }



}