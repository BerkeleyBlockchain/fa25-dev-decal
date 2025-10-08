// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.7;

contract ArrayLength {

    uint[] public myArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 
    11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
    11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
    11, 12, 13, 14, 15, 16, 17, 18, 19, 20];

    uint256 public lastGasUsedRegular;
    uint256 public lastGasUsedOptimized;

    function badCaching() public returns (uint256) {
        uint256 startingGas = gasleft();
        for (uint256 i; i < myArray.length; i++) {
            i++;
        }

        lastGasUsedRegular = startingGas - gasleft();
        return lastGasUsedRegular;
    }

    function goodCaching() public returns (uint256) {
        uint256 startingGas = gasleft();
        /** YOUR CODE HERE */


        lastGasUsedOptimized = startingGas - gasleft();
        return lastGasUsedOptimized;
    }
}