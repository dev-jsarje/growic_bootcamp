pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

//import "@openzeppelin/contracts/access/Ownable.sol";
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

// Custom error

error AmountToSmall();
error UserNotFunded();
error cannotAddUserFund();

contract UserBalance {

    address payable owner;
    // Create a private constant variable called Fee
    uint private constant Fee = 1;

    // Defined struct to save user details

    struct userDetails {
        string name;
        uint256 age;
    }

    // Map address to user balance 
    mapping(address => uint) public userBalance;

    // Map address to user
    mapping(address => userDetails) userMap;

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

    // Set user details
    function setUserDetails(string calldata _name, uint256 _age) public { 
        userDetails memory _userDetails = userDetails(_name, _age);
        setUserDetails(msg.sender, _userDetails);
    }

    // Get user details
    function getUserDetail() public view returns (userDetails memory) { 
        return (msg.sender, userDetails);
    }

    // Add a withdraw function
        modifier onlyOwner() {
            require(msg.sender == owner, "Not owner");
            _;
        }

        function withdraw() public payable onlyOwner {

        }

    // Add an addFund function

    modifier checkDeposit() {
        if (userBalance[_addr] == 0) {
            revert UserNotFunded();
        }
        _;
    }

    modifier addUserFund() {
        if (!userMap[msg.sender].canAddUserFund) {
            revert cannotAddUserFund();
        }
        _;
    }

    modifier value(uint256 _amount) {
        if (_amount < Fee) {
            revert AmountToSmall();
        }
        _;
    }

    function addFund(uint256 _amount) public payable userCanAddFund UserFunded(msg.sender) {
        setBalance(msg.sender, getBalance(msg.sender) + _amount - Fee);
    }

}
