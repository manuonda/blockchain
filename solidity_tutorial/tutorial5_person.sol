pragma solidity>0.7.0 <0.9.0;

/** Contract direccion solidity
 */
contract MyContract{
    
    uint256 public peopleCount;
    mapping(uint => Person) public people;

    uint256 openingTime;

    struct Person{
      uint _id;
      string _firstName;
      string _lastName;

    }

    address public owner;

     
    modifier onlyOnwer() {
        require(msg.sender == owner ,"Only owner");
        _;
    }

    
    constructor() public{
      owner = msg.sender;
    }

    function addPerson( string memory  _firstName, string memory _lastName) external onlyOnwer {
       incrementCount();
       people[peopleCount] = Person(peopleCount, _firstName , _lastName);
    }

    function incrementCount() internal {
       peopleCount++;  
    }


}