// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract MasterSolidity {
    uint[] public uintArray = [1,2,3];
    string[] public stringArray = ["apple","banana","carrot"];
    string[] public values;
    uint[][] public array2D = [ [1,2,3],[4,5,6]];

    
    // Mappings 
    mapping(uint256 => string) public names;
    mapping(uint => Book) public books;

    struct Book{
        string title;
        string author;
    }



    constructor(){
        names[1] ="Adam";
        names[2] ="Bruce";
        names[3] ="Leia";
    }

    function addBook(uint _id, string memory _title, string memory _author) public {
       books[_id] = Book(_title, _author);
    }


    function addValue(string memory _value) public{
        values.push(_value);
    }

    function valueCount() public view returns (uint) {
        return values.length;
    }

}
