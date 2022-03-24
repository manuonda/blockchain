//SPDX-License-Identifier: GLP-3.0

pragma solidity > 0.7.9 <0.9.0;

import "./ISuma.sol";

contract Polimorfismo {

    uint public resultado;

    function sumarDesdeContrato(uint numero1 , uint numero2, address direccionContrato) public returns(uint) {
        ISuma iSuma =  ISuma(direccionContrato);
        resultado = iSuma.sumar(numero1, numero2);
        return resultado;
    }

}