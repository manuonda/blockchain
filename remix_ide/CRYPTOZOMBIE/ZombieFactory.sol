// SPDX-License-Identifier: MIT


pragma solidity >= 0.7.0 < 0.9.0;

contract ZombieFactory {

    struct Zombie {
        uint dna;
        string name;
    }

    Zombie[] public zombies;
    
    mapping(uint => address) public zombieToOwner;
    mapping(address =>  uint) public OwnerToZombie;
   
    uint dnaDigits =  16;
    uint dnaModulus =  10 ** dnaDigits;
   
   event NewZombie(uint id, string  _name, uint _dna);

    function _generateRandomDna(string  memory _str) private view returns (uint) {
         uint rand = uint(keccak256(abi.encodePacked(_str)));
         return rand % dnaModulus;
    }


    function _createZombie(uint dna, string memory _name) private {
         zombies.push(Zombie(dna, _name)) ;
         uint id  = zombies.length;
        zombieToOwner[id] = msg.sender;
        OwnerToZombie[msg.sender]++;
        emit NewZombie(id, _name, dna );
    }

    function createRandomZombie(string memory  _name) public {
        require(OwnerToZombie[msg.sender] == 0 );
        uint randDna =  _generateRandomDna(_name);
        _createZombie(randDna, _name);
    }
}