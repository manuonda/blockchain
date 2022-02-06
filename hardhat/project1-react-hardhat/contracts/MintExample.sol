//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import '@openzeppelin/contracts/access/Ownable.sol';
import '@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol';
import '@openzeppelin/contracts/utils/math/SafeMath.sol';


contract MintExample is ERC721Enumerable, Ownable {
    
    mapping( address => uint256) public balance;


    constructor(
        string memory name,
        string memory symbol
    )ERC721(name, symbol) {}
    

    function mint(uint256 numberOfMints) public payable{
        // totalSupply : 
        // Returns a token ID at a given index of all the tokens stored by the contract.
        // Use along with totalSupply to enumerate all tokens.
        uint256 supply = totalSupply();
        for( uint256 i; i < numberOfMints; i++) {
            _safeMint(msg.sender, supply + 1 );
            balance[msg.sender]++;
        }
    }
}
