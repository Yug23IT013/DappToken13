require('dotenv').config();
const HDWalletProvider = require('@truffle/hdwallet-provider');

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*"
    },
    sepolia: {
      provider: () => new HDWalletProvider(
        process.env.MNEMONIC,
        `https://eth-sepolia.g.alchemy.com/v2/${process.env.ALCHEMY_API_KEY}`
      ),
      network_id: 11155111,
      gas: 4500000,  // Lower this
      gasPrice: 10000000000,  // Set fixed gas price (10 gwei)
      confirmations: 2,
      timeoutBlocks: 200,
      skipDryRun: true,
      networkCheckTimeout: 100000,  // Add these
      deploymentPollingInterval: 10000  // Add these
    }
  },
  compilers: {
    solc: {
      version: "0.4.24"
    }
  }
};