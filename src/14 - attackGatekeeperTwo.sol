// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface GatekeeperTwo {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract attackGatekeeperTwo {
    constructor(address _target) {
        uint64 A = uint64(bytes8(keccak256(abi.encodePacked(address(this)))));
        
        uint64 C = type(uint64).max;
        
        uint64 B = C ^ A;
        
        bytes8 key = bytes8(B);
        
        GatekeeperTwo(_target).enter(key);
    }
}
