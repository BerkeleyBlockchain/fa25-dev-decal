// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.7;

contract GarbageCollection {

    uint256 public number;

    function setNumber(uint256 num) public {
        number = num;
    }

    function getNumberAndCollect() public returns (uint256) {
        uint256 num = number;
        /** YOUR CODE HERE */

        return num;
    }

    function getNumber() public returns (uint256) {
        uint256 num = number;
        return num;
    }
}