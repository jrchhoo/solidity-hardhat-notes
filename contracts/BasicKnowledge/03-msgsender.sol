// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Demo {
    uint256 count = 0;

    address owner;

    constructor(uint256 _newCount) {
        owner = msg.sender;
        count = _newCount;
    }

    function incrementCount() public {
        if (msg.sender == owner) {
            count += 10;
        } else {
            count++;
        }
    }

    function getCount() public view returns (uint256) {
        return count;
    }

    function kill() private {
        if (msg.sender == owner) {
            selfdestruct(payable(msg.sender)); // 只有部署者才可以销毁合约
        }
    }
}
