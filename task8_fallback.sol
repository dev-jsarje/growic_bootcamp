pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

//import "@openzeppelin/contracts/access/Ownable.sol";
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol


contract UserBalance {

    address payable public owner;

    // Map address to user balance 
    mapping(address => uint) public userBalance;

    //get     
    function getBalance(address _addr) private view returns (uint){
        uint256 _amount = userBalance[_addr];
        return _amount;
    }

    //set 
    function setBalance(address _addr, uint256 _amount) private {
        userBalance[_addr] = _amount;
    }

   

    // Function to deposit Ether into this contract.
    // Call this function along with some Ether.
    // The balance of this contract will be automatically updated
    
    constructor() {
        owner = payable(msg.sender);
    }

    function deposit() external payable {}

    fallback () external payable {}

    receive() external payable {}
        
        

    // Return the balance
    function checkBalance() public view returns (uint256) { 
        return getBalance(msg.sender);
    }

}
