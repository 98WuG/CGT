pragma solidity ^0.4.11;

import './IERC20.sol';

contract CanadaGooseToken is IERC20 {

	uint public _totalSupply = 1000000;

	string public constant symbol = "CGT";
	string public constant name = "Canada Goose Token";
	uint8 public constant decimals = 0;

	mapping(address => uint256) balances;
	mapping(address => mapping(address => uint256)) allowed;

	function CanadaGooseToken()
	{
		balances[msg.sender] = _totalSupply;
	}

	function totalSupply() constant returns (uint256 totalSupply)
	{
		return _totalSupply;
	}

	function balanceOf(address _owner) constant returns (uint256 balance)
	{
		return balances[_owner];
	}

	function transfer(address _to, uint256 _value) returns (bool success)
	{
		if(balances[msg.sender] >= _value && balances[_to] + _value > balances[_to])
		{
			balances[msg.sender] -= _value;
			balances[_to] += _value;
			Transfer(msg.sender, _to, _value);
			return true;
		}
		else
		{
			return false;
		}
	}

	function transferFrom(address _from, address _to, uint256 _value) returns (bool success)
	{
		if(balances[_from] >= _value && allowed[_from][msg.sender] >= _value && balances[_to] + _value > balances[_to])
		{
			balances[_to] += _value;
			balances[_from] -= _value;
			allowed[_from][msg.sender] -= _value;
			Transfer(_from, _to, _value);
			return true;
		}
		else
		{
			return false;
		}
	}

	function approve(address _spender, uint256 _value) returns (bool success)
	{
		allowed[msg.sender][_spender] = _value;
		Approval(msg.sender, _spender, _value);
		return true;
	}

	function allowance(address _owner, address _spender) constant returns (uint256 remaining)
	{
		return allowed[_owner][_spender];
	}
}
