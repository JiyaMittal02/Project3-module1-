pragma solidity ^0.8.0;

contract SimpleBank {
    mapping(address => uint) public balances;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
        require(msg.value > 0, "Deposit must be > 0");
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint amount) public {
        require(amount > 0 && balances[msg.sender] >= amount, "Invalid withdraw");
        balances[msg.sender] -= amount;
        assert(balances[msg.sender] >= 0);
        payable(msg.sender).transfer(amount);
    }

    function triggerRevert() public pure {
        revert("Reverted");
    }
}
