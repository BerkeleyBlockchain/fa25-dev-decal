// SPDX-License-Identifier: MIT
contract Addition {

    uint256 public number = 1;
    uint256 public number2 = 1;
    uint256 public lastGasUsedRegular;
    uint256 public lastGasUsedOptimized;

    function addition(uint256 value) public returns (uint256) {
        uint256 startingGas = gasleft();
        number += value;
        lastGasUsedRegular = startingGas - gasleft();
        return lastGasUsedRegular;
    }

    function additionOptimized(uint256 value) public returns (uint256) {
        uint256 startingGas = gasleft();
        /** YOUR CODE HERE */
        lastGasUsedOptimized = startingGas - gasleft();
        return lastGasUsedOptimized;
    }
}