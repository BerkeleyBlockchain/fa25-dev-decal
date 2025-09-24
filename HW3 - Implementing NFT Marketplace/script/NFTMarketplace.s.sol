// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import { NFTMarketplace } from "src/NFTMarketplace.sol";

contract NFTMarketplaceScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        new NFTMarketplace("MarketplaceToken", "MKT", "Token");
        vm.stopBroadcast();

    }
}
