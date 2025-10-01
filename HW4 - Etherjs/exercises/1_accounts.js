// GOAL: To view something on Ethereum mainnet using Ether.js

/** import etherjs */
const { ethers } = require('ethers');

/** get infura url*/
// 1) Create an account here: https://www.infura.io
// 2) You should see "My First Key" automatically generated
// 3) Click on it, and go to "All Endpoints" to make sure Ethereum Mainnet is checked
// 4) Finally, go to "Active Endpoints" get your URL 
const infura_url = 'TODO'

/** init provider */
// Hint: what provider did we use in lecture?
// also, provider should not be a string
const provider = 'TODO'

/** find some wallet address */
// 1) Go to Etherscan
// 2) Find any wallet you'd like
// 3) Paste the address below
const address = 'TODO'

/** setup async function to get balance */
// Hint: consult the ethers docs https://docs.ethers.org/v5/
const main = async() => {
    // makes sure to use the "await" keyword before instantiating the balance object
    const balance = 'TODO'
    console.log(`Balance: ${ethers.utils.formatEther(balance)}`)
}

/** call the main function */
main()