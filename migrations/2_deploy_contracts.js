var DappToken13 = artifacts.require("./DappToken13.sol");
var DappToken13Sale = artifacts.require("./DappToken13Sale.sol");

module.exports = function(deployer) {
  deployer.deploy(DappToken13, 1000000).then(function() {
    var tokenPrice = 1000000000000000; // in wei = 0.001 ETH
    return deployer.deploy(DappToken13Sale, DappToken13.address, tokenPrice);
  });
};