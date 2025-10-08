// SPDX-License-Identifier: MIT
pragma solidity >=0.8.17;

import "forge-std/Test.sol";
import "../src/Addition.sol";

contract AdditionTest is Test {
    Addition addObj;
    

    function setUp() public {
        addObj = new Addition();
    }


    function testAdditionOptimized() public {
        uint256 gasRegular = addObj.addition(10);
        uint256 gasOptimized = addObj.additionOptimized(10);
        
        assert(gasOptimized < gasRegular);

    }
}