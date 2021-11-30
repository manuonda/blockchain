pragma solidity > 0.7.0.0 && 


contract MyCoin {

    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;

    mapping(address => mapping(address => uint256)) public allowance;
    
    constructor() {

    }

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);


    function transfer(address _to, uint256 _value) public  returns(bool success) {
        // verifica que la direccion su valor >= que el valor nuevo
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.value] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;

    }

    function approve(address _spender, uint256 _value) public return (bool success) {
       // array bidireccional de direction , asignamos la direccion y el value
       allowance[msg.sender][_spender] = _value;
       // spender: persona autorizada
       emit Approval(msg.sender, _spender, _value);
       return true;
    }

    function trasnferForm(address _from , address _to, uint256 _value) public returns (bool success) {
        
    }


}