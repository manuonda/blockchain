//SPDX-License-Identifier: GLP-3.0

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

pragma solidity > 0.7.0 < 0.9.0;

contract TokenNoFungible is ERC721("TokenNoFungible","TNF") {
   
     constructor(){
         // direccion , id nuevo
         _mint(msg.sender, 1);
     }

}