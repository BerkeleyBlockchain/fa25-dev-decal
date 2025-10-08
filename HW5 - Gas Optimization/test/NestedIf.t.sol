// SPDX-License-Identifier: MIT
pragma solidity >=0.8.17;

import "forge-std/Test.sol";
import "../src/NestedIf.sol";

contract NestedIfGasTest is Test {
    NestedIf nestedIfInstance;
    
    event GasUsed(string functionName, uint256 gasUsed);

    function setUp() public {
        nestedIfInstance = new NestedIf();
    }

    function testGasOptimization() public {
        uint256 startGas;
        uint256 endGas;

        uint256 testNumber = 25;  // Choose a number that is true for both conditions

        startGas = gasleft();
        nestedIfInstance.badNesting(testNumber);
        endGas = gasleft();
        uint256 gasUsedByBadNesting = startGas - endGas;
        emit GasUsed("badNesting", gasUsedByBadNesting);

        startGas = gasleft();
        nestedIfInstance.goodNesting(testNumber);
        endGas = gasleft();
        uint256 gasUsedByGoodNesting = startGas - endGas;
        emit GasUsed("goodNesting", gasUsedByGoodNesting);

        // Assert that goodNesting uses less or equal gas than badNesting.
        assert(gasUsedByGoodNesting < gasUsedByBadNesting);
    }
}
