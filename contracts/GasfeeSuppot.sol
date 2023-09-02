// SPDX-License-Identifier: MIT

pragma solidity >=0.4.22 <0.9.0;

contract GasFeeSupport {
    address payable public organizer;
    address[] public specialAddresses;

    constructor(address[] memory _specialAddresses) {
        organizer = payable(msg.sender);
        specialAddresses = _specialAddresses;
    }

    modifier onlyOrganizer() {
        require(msg.sender == organizer, "Only the organizer can perform this action");
        _;
    }

     modifier onlySpecialAddress() {
        bool isSpecialAddress = false;
        for (uint i = 0; i < specialAddresses.length; i++) {
            if (msg.sender == specialAddresses[i]) {
                isSpecialAddress = true;
                break;
            }
        }
        require(isSpecialAddress, "Only the special address can send gas fee");
        _;
    }

      function addSpecialAddress(address _address) public onlyOrganizer {
        specialAddresses.push(_address);
    }

    function sendGasFee(address payable[] memory participants, uint256 amount) public onlySpecialAddress {

        for(uint i=0; i<participants.length; i++) {
            participants[i].transfer(amount);
        }
    }

    receive() external payable {}
}