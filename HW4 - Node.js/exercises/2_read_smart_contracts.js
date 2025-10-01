// GOAL: To read values off of the DAI smart contract

const { ethers } = require("ethers");

/** copy infura_url and provider from exercise #1 */
const infura_url = 'TODO'
const provider = 'TODO'

/** get DAI contract address */
// 1) Lookup "DAI Stablecoin" on Etherscan
// 2) Copy its "Token Contract"
// 3) Go Click "Contract", then "Read Contract" for help with DAI_ABI
const address = 'TODO'

/** get specific contract fields (name, symbol, totalSupply)*/
// Hint: look at the lecture slides on "Human-Readable ABI"
const DAI_ABI = [
    'TODO'
]

/** create contract so you can interact with it in javascript */
const contract = 'TODO'

const main = async () => {
    /** create the contract variables specified in the DAI_ABI comment*/
    

    /** print there values */
    
}

main()