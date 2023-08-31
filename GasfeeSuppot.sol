// SPDX-License-Identifier: MIT

pragma solidity >=0.4.22 <0.9.0;

contract GasFeeSupport {
    address payable public organizer;

    constructor() {
        organizer = payable(msg.sender);
    }

    function sendGasFee(address payable[] memory participants, uint256 amount) public {

        require(msg.sender == organizer, "Only the organizer can send gas fee");

        for(uint i=0; i<participants.length; i++) {
            participants[i].transfer(amount);
        }
    }

    receive() external payable {}
}