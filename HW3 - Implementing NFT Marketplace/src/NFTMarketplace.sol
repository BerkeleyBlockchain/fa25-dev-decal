// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "./NFT.sol";


contract NFTMarketplace is NFT {
    using Counters for Counters.Counter;
    Counters.Counter public _tokenIds;
    Counters.Counter private _itemsSold;

    uint256 listingPrice = 0.025 ether;

    mapping(uint256 => MarketItem) private idToMarketItem;

    struct MarketItem {
        uint256 tokenId;
        address payable seller;
        address payable owner;
        uint256 price;
        bool sold;
    }

    event MarketItemCreated (
        uint256 indexed tokenId,
        address seller,
        address owner,
        uint256 price,
        bool sold
    );

    constructor(
        string memory _name,
        string memory _symbol,
        string memory _baseURI
    ) NFT(_name, _symbol, _baseURI) Ownable() {
    }

    /* Mints a token and lists it in the marketplace */
    function createToken(string memory tokenURI, uint256 price) public payable returns (uint) {
      _tokenIds.increment();
      uint256 newTokenId = _tokenIds.current();

      _mint(msg.sender, newTokenId);
      _setTokenURI(newTokenId, tokenURI);
      createMarketItem(newTokenId, price);
      return newTokenId;
    }


    function createMarketItem(uint256 tokenId, uint256 price) private {
      require(price > 0, "Price must be at least 1 wei");
    //   emit log_named_int("Msg.value is: ", msg.value);
      require(msg.value == listingPrice, "Price must be equal to listing price");

      idToMarketItem[tokenId] =  MarketItem(
        tokenId,
        payable(msg.sender),
        payable(address(this)),
        price,
        false
      );

      _transfer(msg.sender, address(this), tokenId);
      payable(msg.sender).transfer(msg.value - listingPrice);
      emit MarketItemCreated(
        tokenId,
        msg.sender,
        address(this),
        price,
        false
      );
    }

    /* Creates the sale of a marketplace item */
    /* Transfers ownership of the item, as well as funds between parties */
    function createMarketSale( uint256 tokenId) public payable {
      uint price = idToMarketItem[tokenId].price;
      address seller = idToMarketItem[tokenId].seller;
      require(msg.value == price, "Please submit the asking price in order to complete the purchase");
      idToMarketItem[tokenId].owner = payable(msg.sender);
      idToMarketItem[tokenId].sold = true;
      idToMarketItem[tokenId].seller = payable(address(0));
      _itemsSold.increment();
      _transfer(address(this), msg.sender, tokenId);
      payable(owner()).transfer(listingPrice);
      payable(seller).transfer(msg.value);
    }

    /* allows someone to resell a token they have purchased */
    function resellToken(uint256 tokenId, uint256 price) public payable {
      require(idToMarketItem[tokenId].owner == msg.sender, "Only item owner can perform this operation");
      require(msg.value == listingPrice, "Price must be equal to listing price");
      idToMarketItem[tokenId].sold = false;
      idToMarketItem[tokenId].price = price;
      idToMarketItem[tokenId].seller = payable(msg.sender);
      idToMarketItem[tokenId].owner = payable(address(this));
      _itemsSold.decrement();

      _transfer(msg.sender, address(this), tokenId);
    }

    /* Updates the listing price of the contract */
    function updateListingPrice(uint _listingPrice) public payable onlyOwner {
        // TODO: Change the listing price
        ____________
    }

    /* Returns the listing price of the contract */
    // TODO: This function needs to be publically callable.
    function getListingPrice() ______________________ {
        return listingPrice;
    }

    /* Returns only items a user has listed */
    function fetchItemsListed() public view returns (MarketItem[] memory) {
        // Number of NFTs
        uint totalItemCount = _tokenIds.current();
        // The amount of NFTs owned by the user
        uint itemCount = 0;

        // TODO: Increment from the id of the first NFT to the last NFT
        for (________) {
            // TODO: Use the ID to get the MarketItem, and check if the seller of the MarketItem 
            // is the person calling this function
            if (_________) {
                __________
            }
        }

        // TODO: To return all of the items, initialize an item array *that is stored in memory* (same as the return type)
        MarketItem[] memory items = new MarketItem[](itemCount);
        // Keeping track of the index of the return array
        uint currentIndex = 0;

        // TODO: Now, increment from the id of the first NFT to the last NFT, 
        // but add each of the user's NFTs to the array we created. 
        for (____________) {
            // TODO: Same as before
            if (_____________) {
                // TODO: Since our MarketItems are in storage, in order to avoid unnecessary data copying, 
                // we should save the pointer to their location, rather than copy the data to memory. We can 
                // to do this by using a storage type variable. 
                MarketItem storage currentItem = _________
                ________ = currentItem;
                currentIndex += 1;
            }
        }
        return items;
    }

    /* Returns only items that a user has purchased */
    function fetchMyNFTs() public view returns (MarketItem[] memory) {
        //TODO: Initialize some variables / counters
        uint totalItemCount = _________
        ________ = __________


        // TODO: Count how many NFTs the user owns
        // TODO: Create and return an array with all the NFTs that the user has purchased
        // Think: what are we doing differently this time?
        _________________ = ________
        _____________________ = _____________________
        for (___________________) {
            if (________________________) {
               _____________________________________
               _____________________________________
               _____________________________________
            }
        }
        return items;
    }

    /* Returns all unsold market items */
    function fetchMarketItems() public view returns (MarketItem[] memory) {
        // Number of NFTs
        ___________________________
        // TODO: get the number of unsold NFTs, we will subtract the number of sold NFTs from the total number of NFTs
        uint unsoldItemCount = __________________________

        _______________________
        ___________________________________________________________
        for (_______________________) {
            //TODO: Think, what is different this time?
            if (_____________________ == _________) {
               _____________________________________
               _____________________________________
               _____________________________________
            }
        }
        return items;
    }
}