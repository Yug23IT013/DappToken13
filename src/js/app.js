App = {
    web3Provider: null,
    contracts: {},
    accoutn: '0x0',

    init : function() {
        console.log("App initialized...");
        return App.initWeb3();
    },

    initWeb3: function() {
        if (typeof window.ethereum !== 'undefined') {
            App.web3Provider = window.ethereum;
            web3 = new Web3(window.ethereum);
            // Request account access
            window.ethereum.request({ method: 'eth_requestAccounts' });
            
            // Log network ID for debugging
            window.ethereum.request({ method: 'eth_chainId' }).then(function(chainId) {
                console.log("Connected to network ID:", parseInt(chainId, 16));
            });
        } else if (typeof web3 !== 'undefined') {
            App.web3Provider = web3.currentProvider;
            web3 = new Web3(web3.currentProvider);
        } else {
            App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
            web3 = new Web3(App.web3Provider);
        }

        return App.initContracts();
    },

    initContracts: function() {
        $.getJSON("DappToken13Sale.json", function(dappToken13Sale) {
            App.contracts.dappToken13Sale = TruffleContract(dappToken13Sale);
            App.contracts.dappToken13Sale.setProvider(App.web3Provider);
            App.contracts.dappToken13Sale.deployed().then(function(dappToken13Sale) {
                console.log("Dapp Token Sale Address:", dappToken13Sale.address);
            });
        })
            .done(function() {
                $.getJSON("DappToken13.json", function(dappToken13) {
                    App.contracts.dappToken13 = TruffleContract(dappToken13);
                    App.contracts.dappToken13.setProvider(App.web3Provider);
                    App.contracts.dappToken13.deployed().then(function(dappToken13) {
                        console.log("Dapp Token Address:", dappToken13.address);
                    });
                    return App.render();
                });
        })
    },

    render: function() {

        web3.eth.getCoinbase(function(err, account) {
            if (err === null) {
                App.account = account;
                $("#accountAddress").html("Your Account: " + account);
            }
        });
    }

}

$(function() {
    $(window).load(function() {
        App.init();
    });
});