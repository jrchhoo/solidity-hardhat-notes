// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Demo1 {
    function sayHello() public pure returns(string memory) {
        return "Hello";
    }
}

contract Demo2 {
    function sayBye() public pure virtual returns(string memory) {
        return "Bye";
    }
}

contract Demo is Demo1, Demo2 {
    function sayBye() public pure override returns(string memory) {
        return "Bye Bye!!!";
    }
}