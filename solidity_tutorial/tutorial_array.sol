// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract MyArray{
    // bool[] myArray;
    uint[] public myArray;

    function foo() external {
      myArray.push(2);
      myArray.push(1);
      myArray.push(4);

      delete myArray[0];

      for( uint i = 0 ; i < myArray.length ; i++ ) {
          myArray[i];
      }
    }

    // 2 - memory arrays
    function bar() pure external {
      uint[] memory newArray = new uint[](10);
      // al definir un array no permite utilizar push()
      newArray[0] = 1;
      newArray[1] = 2;
      newArray[2] = 3;

      delete newArray[1];
    }
   
    // 3 - arrays in functions 
    function fooBar(uint[] memory _myArray) pure external {

    }

   
}