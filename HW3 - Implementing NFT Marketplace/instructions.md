
# Homework 3 - Building an NFT Marketplace

In this homework, you will expand on the NFT contract you built in HW2 to build an NFT Marketplace contract.

Created by Siddhant Satapathy and Daniel Gushchyan

## Getting Started

### Cloning Github Repository

Please clone the HW3 github repository: https://github.com/BerkeleyBlockchain/dev-decal-sp23/tree/master/hw3-Implementing%20NFT%20Marketplace. 

You will be editing the src/NFTMarketplace.sol contract.

### Foundry setup

From the previous HW, you should have Foundry set up. For this homework, we need to install external [OpenZeppelin contracts](https://www.openzeppelin.com/contracts) into Forge. 

OpenZeppelin is a repository of common ERC20 and ERC721 smart contracts that have been thoroughly tested and verified, and are used by most dApps. We will be inheriting from these contracts and building on top of them.

In order to add these to forge:

1. <b> Open up the terminal in the src directory (important!) </b>
2. Run the following command:
```
 forge install OpenZeppelin/openzeppelin-contracts
```
3. Reset the forge remapping in the <b>root directory</b> (hw3):
```
forge remappings > remappings.txt
```
4. Run
```
forge build
```

At this stage, we haven't filled out the NFTMarketplace.sol contract yet. Thus, the compilation will fail.

### Looking at the NFT Marketplace Contract (demo)

### Filling in the remaining functions

Now fill in updateListingPrice(), getListingPrice(), fetchItemsListed(), fetchMyNFTs(), and fetchMarketItems() functions. 

After you have filled these in, run 
```
forge test -vv
```
to verify that these functions work properly. Our tests are not comprehensive, but they test the basic functionality of these functions. 

You can specify the verbosity of the output by changing the number of v's. ``` forge test ``` is the not verbose, while ``` forge test -vvvv ``` is extremely verbose.



## Submission

Submit your NFTMarketplace.sol file and a screenshot of your 4/4 passed tests on this form:

https://forms.gle/Bd2jy6jfNJfkYhDcA

Congratulations! You've now deployed an operational NFT marketplace! 

Please email us if you have any issues!

### Troubleshooting

- If you have issues with forge build not recognizing solidity v0.8.19, then add this line to foundry.toml to anchor the solidity version to v0.8.13. 

```
solc_version = "0.8.13"
```
If this doesn't work, then reinstall Solidity and try this step again.

- If the OpenZeppelin imports are not recognized, ensure that these lines are in remappings.txt. If not, then add them. Additionally, if you are using VSCode, then please go into settings and search for Solidity. Ensure that Package Default Dependencies Contracts Directory is set to src and Package Default Dependencies Directory is set to lib.

```
openzeppelin-contracts/=lib/openzeppelin-contracts/
@openzeppelin/=lib/openzeppelin-contracts/
```
