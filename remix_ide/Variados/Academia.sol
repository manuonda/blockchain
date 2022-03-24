//SPDX-License-Identifier: GLP-3.0

pragma solidity > 0.7.9 <0.9.0;

interface IEscuela {

  struct User {
      string name;
      Rol rol;
  }
  enum Rol {
      Teacher,
      Student
  }

  event newUser(address _user, Rol _rol);
  
  function addUser(address _user, string memory _name, Rol _rol) external  returns(bool);
  function changeUserName(address _user, string memory _newName)external returns(bool);
}


contract Academia is IEscuela {
    uint256 public countStudents;
    mapping(address => User) public users;

     
    constructor(){

    }

    function addUser(address _user, string memory _name, Rol _rol) external override returns(bool) {
        users[_user] = User(_name, _rol);
        if ( rol == )

    }

    function changeUserName(address _user , string memory _name) external override returns(bool) {

    }


 
}