// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Demo{
    uint count = 0;

    constructor(uint _newCount){
        count = _newCount;
    }

    function incrementCount() public{
        count++;
    }

    function getCount() public view returns(uint) {
        return count;
    }

    function kill() private {
        selfdestruct(payable(msg.sender)); // 销毁合约
    }
}