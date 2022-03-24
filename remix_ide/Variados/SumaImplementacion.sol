//SPDX-License-Identifier: GLP-3.0

pragma solidity > 0.7.9 <0.9.0;

import "./ISuma.sol";

contract SumaImplementacion is ISuma {

      function sumar(uint numero1, uint numero2) public override pure returns(uint) {
         return numero1 + numero2;
      }
}