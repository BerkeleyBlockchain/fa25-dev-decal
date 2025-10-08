// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.7;

contract ExternalCallOptimization {

    uint256 public storedBalance;

    constructor() payable {
        storedBalance = address(this).balance;
    }

    function badGetBalance() public view returns (uint256) {
        return address(this).balance; // uses the balance property, equivalent to an external call
    }

    function goodGetBalance() public view returns (uint256) {
        /** YOUR CODE HERE */

    }

    // function to deposit Ether into the contract for testing
    function deposit() external payable {
        storedBalance += msg.value;
    }
}
