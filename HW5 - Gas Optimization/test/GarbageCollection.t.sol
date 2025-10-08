// SPDX-License-Identifier: MIT
pragma solidity >=0.8.17;

import "forge-std/Test.sol";
import "../src/GarbageCollection.sol";

contract GarbageCollectionGasTest is Test {
    GarbageCollection gcInstance;
    
    event GasUsed(string functionName, uint256 gasUsed);

    function setUp() public {
        gcInstance = new GarbageCollection();
        gcInstance.setNumber(12345);
    }

    function testGasOptimization() public {
        uint256 startGas;
        uint256 endGas;

        startGas = gasleft();
        gcInstance.getNumber();
        endGas = gasleft();
        uint256 gasUsedByGetNumber = startGas - endGas;
        emit GasUsed("getNumber", gasUsedByGetNumber);

        startGas = gasleft();
        gcInstance.getNumberAndCollect();
        endGas = gasleft();
        uint256 gasUsedByGetNumberAndCollect = startGas - endGas;
        emit GasUsed("getNumberAndCollect", gasUsedByGetNumberAndCollect);

        // Assert that getNumberAndCollect uses less or equal gas than getNumber.
        assert(gasUsedByGetNumberAndCollect < gasUsedByGetNumber);
    }
}
