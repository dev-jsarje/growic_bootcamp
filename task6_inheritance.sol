pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// A simple use case for inheritance is to launch an ERC20 token using the OpenZepellin ERC20 implementation.
// Try to launch your custom ERC20 on any test network and then send me the address to the contract!


contract TeamLHToken is ERC20 {
    constructor() ERC20("TeamLHToken", "TLT") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }
}
