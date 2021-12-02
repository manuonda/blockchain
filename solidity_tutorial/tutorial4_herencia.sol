// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract Ownable {
  
}

contract MyContract{
  
  address public owner;
  string secret;

  modifier onlyOnwer {
      require(msg.sender == owner, "must be owner");
      _;
  }

  constructor(string memory _secret) public{
    owner = msg.sender; 
    secret = _secret;
  }

  
  function getSecret() public view onlyOnwer returns(string memory) {
      return secret;
  }
  

}