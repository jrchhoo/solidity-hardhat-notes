// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Demo {
    bytes6 public name = 0x123456789123;

    function bytes6ToBytes10() public view returns (bytes10) {
        // 输出：0x12345678912300000000
        return bytes10(name);
    }

    function bytes6ToBytes2() public view returns (bytes2) {
        // 输出：0x1234
        return bytes2(name);
    }

    function bytes6ToBytes1() public view returns (bytes1) {
        // 输出：0x12
        return bytes1(name);
    }
}
