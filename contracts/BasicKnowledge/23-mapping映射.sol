// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Demo {
    mapping(address => uint256) public balances;

    mapping (string => uint256) public params;

    function update(uint256 newBalance) public {
        balances[msg.sender] = newBalance;
    }

    function pushParam(string memory _key, uint256 _value) internal {
        params[_key] = _value;
    }

    function getValue(string memory _key) internal view returns (uint256){
        return params[_key];
    }

}
