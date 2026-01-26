pragma solidity ^0.4.24;
import "./DappToken13.sol";

contract DappToken13Sale{
    address admin;
    DappToken13 public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokensSold;

    event Sell(address _buyer, uint256 _amount);
    //Token contract
    function DappToken13Sale(DappToken13 _tokenContract, uint256 _tokenPrice) public{
        // Assign and admin
        admin = msg.sender;
        //Token Contract
        tokenContract = _tokenContract;
        //Token Price
        tokenPrice = _tokenPrice;
    }

    //multiply
    function multiply(uint x, uint y) internal pure returns (uint z){
        require(y == 0 || (z = x * y) / y == x);
    }

    //Buy Tokens
    function buyTokens(uint256 _numberOfTokens) public payable{
        //require that value is equal to token
        require(msg.value == multiply(_numberOfTokens, tokenPrice));
        //require that the contract has enough tokens
        require(tokenContract.balanceOf(this) >= _numberOfTokens);
        //require that a transfer is successful
        require(tokenContract.transfer(msg.sender, _numberOfTokens));
        //keep track of number of tokens sold
        tokensSold += _numberOfTokens;
        //trigger sell event
        Sell(msg.sender, _numberOfTokens);
    }

    //ending token sale
    function endSale() public{
        //require admin
        require(msg.sender == admin);
        // transfer remaining dapp tokens to admin
        require(tokenContract.transfer(admin, tokenContract.balanceOf(this)));
        //destroy contract
        selfdestruct(admin);
    }
}