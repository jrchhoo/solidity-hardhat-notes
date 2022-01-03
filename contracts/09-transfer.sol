// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Demo {
    address owner;
    uint256 value;

    constructor() {
        owner = msg.sender;
    }

    // 调用者向某个地址转入以太币（单位：wei） 
    // <address>.transfer(uint amount) ==> 向 address 发送数量为 amount(wei)，如果失败则throw Exception，发送时消耗gas
    // 如果某个方法要接收以太币时必须使用 payable 修饰函数
    function transaction() public payable {
        payable(owner).transfer(msg.value);

        // send 不用了，用transfer替代
        // payable(owner).send(msg.value);
    }

    function getOwnerBalance() public view returns (uint256) {
        return owner.balance;
    }

    function getAddressBalance() public view returns (uint256) {
        return msg.sender.balance;
    }
}
