// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ERC20Token {
   string public name;
   mapping(address => uint256) public balances;

   function mint() public{
      balances[msg.sender] ++;
   }


}

contract MyContract{

    //mapping(address => uint256) public balances;
    address wallet;
    address token;

    event Purchase(
        address _buyer,
        uint256 _amount
    );

    constructor( address _wallet, address _token) {
       wallet = _wallet;
       token  = _token;
    }

     
    /*function() external payable {
      buyToken();
    }*/

    function buyToken() public payable {
       //balances[msg.sender] +=1;
       //mint();
       ERC20Token _token =  ERC20Token(address(token));
       _token.mint();
       payable(wallet).transfer(msg.value); 
       emit Purchase(msg.sender, 1);
    }
   
}