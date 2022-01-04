// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Demo {
    string name = "hello";

    // 报错 
    // function getName1() constant returns (string memory) {
    //     return name;
    // }

    // 返回值为全局变量或属性时修饰函数
    function getName2() public view returns (string memory) {
        return name;
    }

    // 返回确定值而不是变量的时候修饰函数
    function getName3() public pure returns (string memory) {
        return "Hello";
    }

    // 如果某个方法要接收以太币时修饰函数 income ether
    function getName4() public payable returns (uint) {
        return msg.value;
    }
}
