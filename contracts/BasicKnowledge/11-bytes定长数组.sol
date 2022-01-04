// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Demo{

    bytes32 public name = 0x7738263325956e895f1e4c4cca527695b33e3f1dea8801ebc7cf64f8cb40bc69;
    function nameBytesLength() public view returns(uint) {

        // 定长字节数组长度不可变，内部字节不可变
        // name.length = 6;
        // name[0] = 0x1b;

        return name.length;
    }
}