// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Demo {
    mapping(address => uint256) public balances;

    function update(uint256 newBalance) public {
        balances[msg.sender] = newBalance;
    }
}
