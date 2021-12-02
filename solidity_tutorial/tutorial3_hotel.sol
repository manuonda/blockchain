// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract HotelRoom {
 
    address  public owner;

    enum Statuses {  Vacant, Occupied }
    Statuses currentStatus;

    modifier onlyWhiteVacant {
        require(currentStatus == Statuses.Vacant, "Currently Occuped");
        _;
    }

    modifier costs (uint _amount) {
      require(msg.value >= _amount, "Not enough Ehter provided");
        _;
    }


    constructor(){
      owner = msg.sender; // 'msg.sender' is sender of current call, contract deployer for a constructor
      currentStatus = Statuses.Vacant;
    }

    function book() payable public onlyWhiteVacant costs(2 ether) {
       require(msg.value >= 2 ether, "Not enough Ether provided");
       currentStatus =  Statuses.Occupied;
       payable(owner).transfer(msg.value);
       //owner.transfer(msg.value);
    }
    

}