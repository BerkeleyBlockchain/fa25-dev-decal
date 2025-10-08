// SPDX-License-Identifier: MIT
pragma solidity >=0.8.17;

import "forge-std/Test.sol";
import "../src/CDMem.sol";

contract CDMemTest is Test {
    CDMem cdmemObj;

    function setUp() public {
        cdmemObj = new CDMem();
    }

    function testGasConsumption() public {
        uint[] memory testArray = new uint[](100);
        for (uint i = 0; i < 100; i++) {
            testArray[i] = i;
        }

        uint256 startingGasMem = gasleft();
        cdmemObj.addMem(testArray);
        uint256 gasUsedMem = startingGasMem - gasleft();

        uint256 startingGasCD = gasleft();
        cdmemObj.addCD(testArray);
        uint256 gasUsedCD = startingGasCD - gasleft();

        assert(gasUsedCD < gasUsedMem);
    }
}
