// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract Ownable {
   address public owner;

   
  modifier onlyOnwer {
      require(msg.sender == owner, "must be owner");
      _;
  } 
   constructor() public {
     owner = msg.sender;
   }

      

}

contract MyContract is Ownable{
  
  string secret;


  constructor(string memory _secret) public{
    secret = _secret;
    super;
  }

  
  function getSecret() public view onlyOnwer returns(string memory) {
      return secret;
  }
 
}