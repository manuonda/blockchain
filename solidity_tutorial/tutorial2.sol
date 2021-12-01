// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Tutorial2 {
   
   uint[] public numbers = [1,2,3,4,5,6,7,8,9];
   
   address public owner;

   constructor() public {
     owner = msg.sender;
   }

   function isEvenNumber(uint _number) public view returns(bool) {
     // 
     if (_number  % 2 == 0) {
         return true;
     } else {
         return false;
     }
   }

   function countEventNumbers() public view returns(uint) {
       uint count = 0;
       for( uint i = 0 ; i < numbers.length ; i++){
           if ( isEvenNumber(numbers[i])) count++;
       }
       return count;
   }

   function isOwner() public view returns(bool) {
       
       if (msg.sender == owner) {
           return true;
       } else {
           return false;
       }
   }

}