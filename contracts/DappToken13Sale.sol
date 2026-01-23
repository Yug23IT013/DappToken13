pragma solidity ^0.4.24;
import "./DappToken13.sol";

contract DappToken13Sale{
    address admin;
    DappToken13 public tokenContract;
    uint256 public tokenPrice;

    function DappToken13Sale(DappToken13 _tokenContract, uint256 _tokenPrice) public{
        // Assign and admin
        admin = msg.sender;
        //Token Contract
        tokenContract = _tokenContract;
        //Token Price
        tokenPrice = _tokenPrice;
    
    }
}