// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

abstract contract Token{
    
    // token 总量，默认为 public 变量会生成一个getter接口，名称为 totalSupply()
    uint256 public totalSupply;

    // 获取账户_owner 拥有的 token 数量
    function balanceOf(address _owner) external virtual view returns(uint256 balance);

    // 从调用者账户往 _to 账户转数量为 _value 的 token
    function transfer(address _to, uint256 _value) external virtual returns(bool success);

    // 从账户 _from 往 _to 账户转数量为 _value 的 token, 与approve方法配合使用
    function transferFrom(address _from, address _to, uint256 _value) external virtual returns(bool success);

    // 调用者账户设置账户 _spender 能从调用者账户中转出 数量为 _value 的 token
    function approve(address _spender, uint256 _value) external virtual returns(bool success);

    // 获取账户 _spender 可以从账户 _owner 中转出 token 的数量
    function allowance(address _owner, address _spender) external virtual view returns(uint256 remaining);

    // 事件
    // 发生转账时必须要触发的事件
    // 增加了 indexed 的参数值会存到日志结构的 Topic 部分，便于快速查找。而未加 indexed 的参数值会存在 data 部分，成为原始日志
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    
    //方法 approve(address _spender, uint256 _value) 成功执行的时候必须触发的事件
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

}

contract StandardToken is Token {

    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowed;

    function balanceOf(address _owner) external override view returns(uint256 balance){
        return balances[_owner];
    }
        
    function transfer(address _to, uint256 _value) external override returns(bool success){
        require(balances[msg.sender] >= _value);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) external override returns(bool success){
        require(balances[_from] >= _value && allowed[_from][msg.sender] >= _value);
        balances[_to] += _value;
        balances[_from] -= _value;
        allowed[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;

    }

    function approve(address _spender, uint256 _value) external override returns(bool success){
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) external override view returns(uint256 remaining) {
        return allowed[_owner][_spender];
    }
     
}

contract MntToken is StandardToken {

    // 名称
    string public name = "SimpleToken";
    // 小数位数
    uint8 public decimals = 18;
    // 发行代币符号
    string public symbol;

    constructor(uint256 _initialSupply, string memory _name, string memory _symbol) {
        totalSupply = _initialSupply * 10 ** uint256(decimals);
        balances[msg.sender] = totalSupply;
        name = _name;
        symbol = _symbol;
    }

    function approveAndCall(address _spender, uint256 _value) public {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
    }
}


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract MntToken1 is ERC20 {
    constructor() ERC20("SimpleTokenTest", "MNT") {
       _mint(msg.sender,100 * 10 ** decimals());
    }
}