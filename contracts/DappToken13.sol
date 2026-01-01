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

    mapping (address => uint256) public balanceOf;

    function DappToken13 (uint256 _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply; 
        
        totalSupply = _initialSupply;

    }

    //transfer function
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        Transfer(msg.sender, _to, _value);
        return true;
    }


}