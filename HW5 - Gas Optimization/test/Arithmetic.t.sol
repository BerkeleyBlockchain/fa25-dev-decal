// SPDX-License-Identifier: MIT
pragma solidity >=0.8.17;

import "forge-std/Test.sol";
import "../src/Arithmetic.sol";

contract ArithmeticTest is Test {
    Arithmetic arithmetic;

    function setUp() public {
        arithmetic = new Arithmetic();
    }

    function testGasOptimization() public {
        uint256 numberToTest = 12345678;
        uint256 startingGas;
        uint256 endingGas;

        // Measuring gas for the divideByTwo function
        startingGas = gasleft();
        arithmetic.divideByTwo(numberToTest);
        endingGas = gasleft();
        uint256 gasForDivideByTwo = startingGas - endingGas;

        // Measuring gas for the bitwiseDivide function
        startingGas = gasleft();
        arithmetic.bitwiseDivide(numberToTest);
        endingGas = gasleft();
        uint256 gasForBitwiseDivide = startingGas - endingGas;

        assert(gasForBitwiseDivide < gasForDivideByTwo);
    }
}
