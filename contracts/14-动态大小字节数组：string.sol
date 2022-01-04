// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Demo {

    string public name = "12&*kfc";
    
    function getLength() public view returns(uint){
        // 报错，需要转换
        // return name.length;
        return bytes(name).length; 
    }

    // 值会被修改
    function modifyName() public{
        bytes(name)[0] = "M";
    }

    function stringToBytes() public view returns(bytes memory) {
        return bytes(name);
    }

}