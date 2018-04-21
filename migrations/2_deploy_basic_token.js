var BasicToken = artifacts.require("./BasicToken.sol");

module.exports = function(deployer, network, accounts) {
                                                         deployer.deploy(BasicToken, 10000000000, accounts[0]); // heres where you set the amt of the total supply, this is setup when we used the cmd ganache-cli -u 0 which unlocks the 1st account
                                                       };