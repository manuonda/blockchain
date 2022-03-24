//SPDX-License-Identifier: GLP-3.0

pragma solidity > 0.7.9 <0.9.0;

contract Almacenamiento {
   
    // de tipo de storage
    string private nombre;
    
    constructor(string memory palabra) {
       nombre = palabra;
    }

}
