// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/NFT.sol";
import "../src/NFTMarketplace.sol";

contract NFTMarketplaceTest is Test {
    NFTMarketplace public marketplace;
    uint256 gasCost = 1e8;

    
    receive() external payable {}

    function setUp() public {
        marketplace = new NFTMarketplace("MarketplaceToken", "MKT", "Token");
        vm.deal(address(1), 4 ether);   
    }

    function testSingleMintAndUnsold() public {
        uint256 id1 = marketplace.createToken{value: marketplace.getListingPrice()}("Token 1", 2 ether);
        assertEq(id1, 1);
        NFTMarketplace.MarketItem[] memory unsold = marketplace.fetchMarketItems();
        assertEq(unsold.length, 1);
    }

    function testListingPrice() public {
        uint256 id1 = marketplace.createToken{value: 0.025 ether}("Token 1", 2 ether);
        assertEq(id1, 1);

        // this should go through
        marketplace.updateListingPrice(0.030 ether);
        emit log_named_uint("Listing price is now", marketplace.getListingPrice());
        
        // this should revert
        vm.expectRevert(bytes("Only contract owner can update listing price."));
        vm.prank(address(1));
        marketplace.updateListingPrice(0.030 ether);

    }

    function testMintAndBuy() public {
        uint256 id1 = marketplace.createToken{value: 0.025 ether}("Token 1", 2 ether);
        assertEq(id1, 1);
        vm.startPrank(address(1));
        marketplace.createMarketSale{value: 2 ether}(1);
        assertEq(marketplace.fetchMyNFTs().length, 1);
        // assertEq(marketplace.fetchMarketItems().length, 0);
        vm.stopPrank();
    }

    function testItemsListed() public {
        uint256 id1 = marketplace.createToken{value: 0.025 ether}("Token 1", 2 ether);
        assertEq(id1, 1);
        // assertEq(marketplace.fetchItemsListed().length, 1);
        vm.startPrank(address(1));
        marketplace.createMarketSale{value: 2 ether}(1);
        assertEq(marketplace.fetchMarketItems().length, 0);
        vm.stopPrank();
        // assertEq(marketplace.fetchItemsListed().length, 0);
    }

    function testMultiMintAndList() public {
        
        // Instantiate a new marketplace so that it doesn't interfere with other tests
        marketplace = new NFTMarketplace("Marketplace 2", "MKT", "Token");

        // Supply addresses 0x1 and 0x2 with 100 ether each.
        vm.deal(address(2), 100 ether);
        vm.deal(address(1), 100 ether);
        
        // Until vm.stopPrank is called, all function calls are done by address 0x2
        vm.startPrank(address(2));

        // Mints 20 NFTs and puts them on the market, such that the function caller (0x2) is the seller.
        for (uint i = 1; i <= 20; i++) {
            // We are passing a value of 0.025 to our transaction to pay the required marketplace fee.
            // We pass in 2 as the parameter for how much we want to put our nft on sale for.
            marketplace.createToken{value: 0.025 ether}(string.concat("Token ", Strings.toString(i)), 2 ether);
        }

        // Asserts that there are 20 items on the market right now that are sold
        assertEq(marketplace.fetchMarketItems().length, 20);

        /* Asserts that there are 20 items on the market right now that are being sold by 
            the address calling this function (0x2) */
        assertEq(marketplace.fetchItemsListed().length, 20);

        /* Since all NFTs are on the market right now, under the custody of the NFT Marketplace,  
            trying to fetch all owned NFTs should return 0*/
        assertEq(marketplace.fetchMyNFTs().length, 0);
        vm.stopPrank();

        // Now, we will take the role of address 0x1 and purchase 10 of 0x2's items off of the market.
        vm.startPrank(address(1));

        for (uint i = 1; i <= 10; i++) {
            marketplace.createMarketSale{value: 2 ether}(i);
        }

        assertEq(marketplace.fetchMyNFTs().length, 10);
        assertEq(marketplace.fetchMarketItems().length, 10);

        vm.stopPrank();
    }
}
