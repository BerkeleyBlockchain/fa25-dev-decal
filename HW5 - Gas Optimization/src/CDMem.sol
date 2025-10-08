// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.7;

contract CDMem {

    function addMem(uint[] memory myArray) external pure returns (uint sum) {
        uint length = myArray.length;
        for (uint i; i < length; i++) {
            sum += myArray[i];
        }
    }

    /** YOUR CODE HERE */
    /** Hint: implement the same function above, but change something in the function header. */
}