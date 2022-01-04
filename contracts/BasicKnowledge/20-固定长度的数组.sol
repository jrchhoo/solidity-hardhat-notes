// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Demo {
    uint256[5] public counts = [1, 2, 3, 4, 5];

    function getCounts() public view returns (uint256[5] memory) {
        return counts;
    }

    function getLength() public view returns (uint256) {
        return counts.length;
    }

    function setLength(uint256 _length) public {
        // 固定长度数组大小不能被修改
        // counts.length = _length;
    }

    function addElement(uint256 ele) public {
        // 固定长度数组大小不能被添加新值
        // counts.push(ele);
    }

    //可以根据下标修改
    function modify(uint256 _index, uint256 ele) public {
        counts[_index] = ele;
    }
}
