// SPDX-License-Identifier: MIT
pragma solidity >=0.8.17;

import "forge-std/Test.sol";
import "../src/ExternalCallOptimization.sol";

contract ExternalCallOptimizationTest is Test {
    ExternalCallOptimization eco;

    function setUp() public {
        eco = new ExternalCallOptimization{value: 1 ether}();
    }

    function testBalanceOptimization() public {
        uint256 gasBad = gasleft();
        eco.badGetBalance();
        gasBad = gasBad - gasleft();

        uint256 gasGood = gasleft();
        eco.goodGetBalance();
        gasGood = gasGood - gasleft();

        assert(gasGood < gasBad);
    }
}
