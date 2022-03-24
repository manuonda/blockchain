//SPDX-License-Identifier: GLP-3.0

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

pragma solidity > 0.7.0 < 0.9.0;

contract TokenFungible is ERC20("TokenFungible","TF") {

    constructor(){
        // emite los tokens 
        // ver implementacion de mint en ERC20
        _mint(msg.sender, 1000);
    }
}