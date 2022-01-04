// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Demo {
    string public name = "Hello";
    uint256 public number = 1;

    // 状态变量不会被修改，故而修饰为 view
    function modifyName(string memory _name) internal view {
        // memory 修饰值类型，原来的状态变量值不会被修改，指向的内存空间是不同的
        string memory name2 = _name;
        bytes(name2)[0] = "-";

        // 值类型本生就在内存中存储，声明时指向不同的内存空间，故而也不会修改原来的值
        uint256 number2 = number;
        number2 = 11;
    }

    /**
     * storage 修饰参数时，函数修饰符不能是 public 和 external，即不能被外部合约引用
     * 且因为状态变量会被修改，所以不能声明为 view
     */
    function modifyName2(string storage _name) internal {
        // storage 修饰引用类型，指向同一个内存空间，赋值时相当于同一份引用的传递，故而原来的值也会被修改
        string storage name2 = _name;
        bytes(name2)[0] = "-";

        uint256 number2 = number;
        number2 = 11;
    }

    function modify() public {
        modifyName2(name);
    }
}
