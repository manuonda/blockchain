//SPDX-License-Identifier: GLP-3.0

pragma solidity > 0.7.0 < 0.9.0;

contract Funciones {

    constructor() {

    }

    function Suma(uint valor1, uint valor2) public pure returns(uint) {
        return _sumaInterna(valor1, valor2);
    }

    uint private resultado;

    function ObtenerResultado() public view returns(uint) {
        return resultado;
    }

    function _sumaInterna(uint valor1, uint valor2) private pure  returns(uint) {
        return valor1 + valor2 ; 
    }

}