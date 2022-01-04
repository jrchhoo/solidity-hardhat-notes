// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Demo{
    function getAddressBalance(address _addr) public view returns(uint) {
        return _addr.balance;
    }
}