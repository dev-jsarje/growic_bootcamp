
pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

//import "@openzeppelin/contracts/access/Ownable.sol";
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

/**
 * Student Registration
 * 
*/

contract StudentRegistration{

/**
 * owner is a state variable with value type address and public
 */
    address public owner;
  
  /**
   * Mapping of address to students
   */
    mapping (address=>student)students;
    
    /**
     * Owner is the person deploying the contract
     */
    constructor() public {
        owner=msg.sender;
    }
    
    /**
     * Modifier called onlyOwner and require that msg.sender = owner
     */
    modifier onlyOwner {
        require(msg.sender==owner);
        _;
    }
    /**
     * A struct that contains details of students
     */
    struct student{
        
        address studentId;
        uint256 totalMarks;
        uint256 percentage;
        bool isExist;
        
    }
    /**
     * function to register studentid,percentage and marks
     * 
     */
    function register(address studentId,uint256 totalMarks, uint256 percentage) public onlyOwner {
            /**
             *@devstudent cannot register twice
             */
            require(students[studentId].isExist==false,"Student already registered");
            
            uint256 totalMarks;
            uint256 percentage;
           
            
            /**
             * assigning the student details to a (studentId)
             */
            students[studentId]=student(studentId,totalMarks,percentage,true);
    }
    
    /**
     * Function to get the details of a student
     */
            
    function getStudentDetails(address studentId) public view returns (address,uint256,uint256){
        
        /**
         * returning studentId,totalMarks and percentage of each student
         */ 
        return(students[studentId].studentId,students[studentId].totalMarks,students[studentId].percentage);
    }
}
