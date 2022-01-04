// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Demo {
    function getContractAddress() public view returns (address) {
        return address(this);
    }

    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function toContractTransfer() public payable returns(bool) {
        address contractAddress = address(this);
        payable(contractAddress).transfer(msg.value);
        return true;
    }

    function getAccountBalance() public view returns (uint256) {
        return msg.sender.balance;
    }
}
