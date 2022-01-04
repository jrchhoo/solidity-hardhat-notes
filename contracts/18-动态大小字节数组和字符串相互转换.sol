// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Demo {
    bytes public name = new bytes(2);
    string public name2 = "ABCD";

    constructor() {
        name[0] = 0x41;
        name[1] = 0x42;
    }

    function bytesToString() public view returns (string memory) {
        // 输出 AB
        return string(name);
    }

    function stringToBytes() public view returns (bytes memory) {
        // 输出 0x41424344
        return bytes(name2);
    }
}
