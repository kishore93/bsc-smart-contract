// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract StopRussoUkraineWar {
    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public allowance;
    uint256 public _totalTokenSupply = 307200;
    string public _tokenName = "Stop Russo Ukraine War";
    string public _tokenSymbol = "SWAR";
    uint8 public _tokenDecimals = 2;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    constructor() {
        balances[msg.sender] = _totalTokenSupply;
    }

    function name() public view returns (string memory) {
        return _tokenName;
    }

    function symbol() public view returns (string memory) {
        return _tokenSymbol;
    }

    function decimals() public view returns (uint8) {
        return _tokenDecimals;
    }

    function totalSupply() public view returns (uint256) {
        return _totalTokenSupply;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf(msg.sender) >= _value, 'Not enough tokens to send');
        balances[_to] += _value;
        balances[msg.sender] -= _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(balanceOf(_from) >= _value, 'Not enough tokens to send');
        require(allowance[_from][msg.sender] >= _value, 'Not enough token allowance to send');
        balances[_to] += _value;
        balances[_from] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }


}
