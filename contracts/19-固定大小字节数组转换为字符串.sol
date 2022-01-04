// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Demo {
    bytes6 public name = 0x414243444545;

    function bytes6ToString() public view returns (string memory) {
        // 类似于固定大小字节数组转换为动态大小字节数组一样，不能直接转换，否则会报错
        // return string(name);

        // for 循环动态赋值转换
        bytes memory name2 = new bytes(name.length);
        for (uint256 i = 0; i < name.length; i++) {
            name2[i] = name[i];
        }
        // 输出 “ABCDEE”
        return string(name2);
    }
}
