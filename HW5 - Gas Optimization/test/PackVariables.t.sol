// SPDX-License-Identifier: MIT
pragma solidity >=0.8.17;

import "forge-std/Test.sol";
import "../src/PackVariables.sol";  // replace with your actual path

contract VariablePackingTest is Test {
    ContractOne contractOne;
    ContractTwo contractTwo;

    function setUp() public {
        contractOne = new ContractOne();
        contractTwo = new ContractTwo();
    }

    function testGasOptimization() public {
        uint256 startGas;
        uint256 endGas;

        startGas = gasleft();
        contractOne.setValues(1, 1234567890, 2);
        endGas = gasleft();
        uint256 gasUsedByContractOne = startGas - endGas;

        startGas = gasleft();
        contractTwo.setValues(1, 2, 1234567890);
        endGas = gasleft();
        uint256 gasUsedByContractTwo = startGas - endGas;

        // Assert that ContractTwo uses less gas than ContractOne for the same operation.
        assert(gasUsedByContractTwo < gasUsedByContractOne);
    }
}
