const GasFeeSupport = artifacts.require("GasFeeSupport");

contract("GasFeeSupport", function () {
    it ("is_greet_works_well", async function () {
        const instance = await GasFeeSupport.deployed();
        await instance.addSpecialAddress('0x6fdAd1ADe795B5E3053dcA7313Aa1d1eA7390AA8');
        const response = await instance.specialAddresses();
        
        assert.equal(response, ['0xC0467830e52337147c6aC34aB4097163a58C9d9B','0x6fdAd1ADe795B5E3053dcA7313Aa1d1eA7390AA8'], "greeting message is wrong");
    })
})