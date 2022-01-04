// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Demo{

    // 枚举实际上就是下标0-255的256个成员，最多不超过256个成员，最少不少于1个
    enum Season{
        Spring, Summer, Autumn, Winter
    }

    Season public season;

    constructor(Season _s){
        season = _s;
    }

    function setSeason(Season _s) public {
        season = _s;
    }

    function getSeason() public view returns (Season){
        return season;
    }
}