// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Demo {
    uint256[] public counts = [1, 2, 3, 4, 5];

    function getCounts() public view returns (uint256[] memory) {
        return counts;
    }

    function getLength() public view returns (uint256) {
        return counts.length;
    }

    function setLength(uint256 _length) public {
        // 动态长度数组大小不能被修改，他的长度会随着值的数量动态变化
        // counts.length = _length;
    }

    function addElement(uint256 ele) public {
        counts.push(ele);
    }

    //可以根据下标修改
    function modify(uint256 _index, uint256 ele) public {
        if (_index < counts.length) {
            counts[_index] = ele;
        }
    }
}
