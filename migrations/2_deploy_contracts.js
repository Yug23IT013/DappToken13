var DappToken13 = artifacts.require("./DappToken13.sol");

module.exports = function(deployer) {
  deployer.deploy(DappToken13, 1000000);
};
