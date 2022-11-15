// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
contract SimpleBank {
 mapping (address => uint) private balances;
 address owner;
 // Constructor is "payable" so it can receive ether, 
 constructor() public payable {
 /* Set the owner to the creator of this contract */
 owner = msg.sender;
 }
 /// @notice Deposit ether into bank, requires method is "payable"
 /// @return The balance of the user after the deposit is made
 function deposit(uint depoamount) public payable returns (uint) {
 balances[msg.sender] += depoamount;
 payable(msg.sender).transfer(depoamount);
 //emit LogDepositMade(msg.sender, msg.value);
 return balances[msg.sender];
 }
 /// @notice Withdraw ether from bank
 /// @return The balance remaining for the user
 function withdraw(uint withdrawAmount) public returns (uint) {
 // Check enough balance available, otherwise just return balance
 if (withdrawAmount <= balances[msg.sender]) {
 balances[msg.sender] -= withdrawAmount;
 payable(msg.sender).transfer(withdrawAmount);
 }
 return balances[msg.sender];
 }
 function balance() public view returns (uint) {
 return balances[msg.sender];
 }
}
