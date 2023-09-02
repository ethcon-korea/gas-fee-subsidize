const GasFeeSupport = artifacts.require("GasFeeSupport");

module.exports = function(deployer, network, accounts) {
  let array =[];
  array.push('0xC0467830e52337147c6aC34aB4097163a58C9d9B');
  array.push('0x6fdAd1ADe795B5E3053dcA7313Aa1d1eA7390AA8'); 
  
  deployer.deploy(GasFeeSupport, array);
};