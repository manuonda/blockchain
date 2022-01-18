
// https://api.nasa.gov/neo/rest/v1/feed?start_date=START_DATE&end_date=END_DATE&api_key=API_KEY 

// SPDX-License-Identifier: GPL-3.0


pragma solidity >=0.7.0 <0.9.0;

contract Oracle {

    //Direccion 
    address owner;

    // Numero de asteroids
    uint public  numberAsteroids;

    //Evento que recibe datos del oraculo
    event __calbackNewData();

     //modifier only owner
     modifier onlyOnwer() {
      require(msg.sender == owner , "Only Owner");
      _;
     }
    
    // Constructor
    constructor () {
        owner = msg.sender;
    }

    // Recibe datos del oraculo
    function update() public onlyOnwer {
        emit __calbackNewData();
    }

    // Funcion de configuracion manual del numero de asteroides 
    function setNumberAsteroids(uint _num) public onlyOnwer {
        numberAsteroids = _num;
    }




}