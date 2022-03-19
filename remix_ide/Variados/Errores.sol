//SPDX-License-Identifier: GLP-3.0

pragma solidity > 0.7.9 <0.9.0;

contract Errores {

    address private owner;
    
    modifier onlyOnwer(){
      require( msg.sender ==  owner ,"Only Owner");
      _;
    }

    constructor(){
        owner = msg.sender;
    }

    function Suma(uint numero1 , uint numero2 ) public view onlyOnwer() returns(uint)  {
        return numero1  + numero2;
    }
}
