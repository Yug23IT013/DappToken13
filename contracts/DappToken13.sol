pragma solidity ^0.4.24;

contract DappToken13 {
    //name
    string public name = "DappToken13";
    //symbol
    string public symbol = "DAPP13";
    //standard
    string public standard = "DappToken13 v1.0";
    uint256 public totalSupply;

    //events
    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    mapping (address => uint256) public balanceOf;
    mapping (address => mapping(address => uint256)) public allowance;

    function DappToken13 (uint256 _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply; 
        
        totalSupply = _initialSupply;

    }

    //transfer function
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        //transfer event
        Transfer(msg.sender, _to, _value);
        return true;
    }

    //approve
    function approve(address _sender, uint256 _value) public returns(bool success){
        //allowance 
        allowance[msg.sender][_sender] = _value;

        //approval event
        Approval(msg.sender, _sender, _value);
        
        return true;
    }

    //transferFrom
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        allowance[_from][msg.sender] -= _value;
        
        //transfer event
        Transfer(_from, _to, _value);

        return true;
    }

}