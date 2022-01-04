// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Demo {
    /**
     * [1,2,3,4]
     * [1,2,3,4]
     * [9,10,11,12]
     * 3 行 4 列
     */
    uint256[4][3] public counts = [[1, 2, 3, 4], [1, 2, 3, 4], [9, 10, 11, 12]];

    function getLength() public view returns (uint256) {
        return counts.length;
    }

    function getContentLength(uint256 _index) public view returns (uint256) {
        return counts[_index].length;
    }
}
