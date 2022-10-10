pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

//import "@openzeppelin/contracts/access/Ownable.sol";
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol


contract UserBalance {

    address payable owner;

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

   

    // User deposit into mapping
    function deposit(uint256 _amount) public {
        return setBalance(msg.sender, _amount + getBalance(msg.sender) );
    }

    // Return the balance
    function checkBalance() public view returns (uint256) { 
        return getBalance(msg.sender);
    }

}
    
