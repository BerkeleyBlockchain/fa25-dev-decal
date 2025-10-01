// GOAL: See block info on your local machine.

const { ethers } = require("ethers");

/** copy infura_url and provider from exercise #1 */
const infura_url = 'TODO'
const provider = 'TODO'

const main = async () => {

    // get the block number
    const block = 'TODO'
    console.log(`\nBlock Number: ${block}\n`)

    // get the block
    const blockInfo = 'TODO'
    console.log(blockInfo)

    // get the transactions
    const { transactions } = 'TODO'
    
    // log the first transaction'
    console.log(`\nLogging first transaction in block:\n`)
    'TODO'
}

main()