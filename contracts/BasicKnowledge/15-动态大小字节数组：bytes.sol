// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Demo {

    bytes public name = new bytes(4);

    function getLength() public view returns (uint256) {
        return name.length;
    }

    // 声明时固定的动态字节数组长度不可被修改
    // function modifyNameLength(uint256 _length) public {
    //     name.length = _length;
    // }

    // bytes传值的时候要传入16进制的数，例如：0xAF，0x1a, 根据不同字节数，传入不同长度，
    // 并且在添加元素后，数组长度会动态改变
    function setNameIndexData(uint256 _index, bytes1 data) public {
        name[_index] = data;
    }

    function addElement(bytes1 _bytesParam) public {
        name.push(_bytesParam);
    }
}
