pragma solidity ^0.4.18;

contract BasicToken {
  mapping(address => uint256) balances; // point to the balance of the user, total supply (like a hash map)
  string public constant NAME = "BasicToken"; // convention to list on an exchange 
  string public constant SYMBOL = "BTN";
  uint256 totalSupply_; // depends on the logic of your contract
  event Transfer(address indexed from, address indexed to, uint256 value); // web3 allows to query against the blockchin in a native app, listeners, this is like a 'push'

// function below is a constructor that only runs once, to setup the initial supply, the default
// *Mintable token would allow for some adjustable here, but that is not ERC20 stand
  function BasicToken (uint256 INITIAL_SUPPLY, address _owner) {
    totalSupply_ = INITIAL_SUPPLY;
    balances[_owner] = INITIAL_SUPPLY; // gives the owner all the tokens
    emit Transfer(0x0, _owner, INITIAL_SUPPLY); // 'Ox0' signifes this is 1t transfer thats happening, contract creation address 
  }
// public ca view this contract, also for the exchanges
  function totalSupply() public view returns (uint256) {
    return totalSupply_;
  }
// 
  function transfer(address _to, uint256 _value) public returns (bool) {
    require(_to != address(0)); // this is an assertion to chack the 0x0 address
    require(_value <= balances[msg.sender]); // make sure the sender has some tokens, would be able to send as much as you wanted if not there, not a security flwa if not there
    
    balances[msg.sender] = balances[msg.sender] - _value;
    balances[_to] = balances[_to] + _value;
    Transfer(msg.sender, _to, _value);
    return true;
  }

  function balanceOf(address _owner) public view returns (uint256 balance) {
    return balances[_owner];
  }
}