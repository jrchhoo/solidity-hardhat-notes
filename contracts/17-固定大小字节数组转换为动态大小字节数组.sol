// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Demo {
    bytes6 public name = 0x414243444545;

    function bytes6ToBytes() public view returns (bytes memory name2) {
        // 不能直接转换，否则会报错
        // name2 = bytes(name);

        // for 循环动态赋值转换
        name2 = new bytes(name.length);
        for (uint256 i = 0; i < name.length; i++) {
            name2[i] = name[i];
        }
    }
}
