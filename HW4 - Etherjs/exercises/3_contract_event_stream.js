// GOAL: Get all of the DAI transfers found in the latest block

const { ethers } = require("ethers");

/** copy infura_url and provider from exercise #1 */
const infura_url = 'TODO'
const provider = 'TODO'

/** get specific contract fields (name, symbol, totalSupply, Transfer)*/

const ERC20_ABI = [
    // Hint: Transfer is an Event, and therefore has slightly different syntax
    'TODO'
];

/** get DAI contract address from exercise #2*/
const address = 'TODO'

/** create new contract */
const contract = 'TODO'

const main = async () => {

    // get the most recent block number
    const block = 'TODO'

    // filter for 'Transfer' events
    const transferEvents = 'TODO'

    // print them out
    'TODO'
}

main()