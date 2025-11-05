### Exercise 8: Saving State to the Blockchain

## Overview
> Is it safe to turn this thing on yet? Well, not quite but at least we can hoist the scaffolding now. It's time we created a real instance of the Jump Ring, even if it's more like a Jump Ring shell at this particular moment. Pretty to look at, but a tad tottering.

Now that we've written our config, let's see how it's applied.

MessageInfo \
First, let's talk about the instantiate info parameter of type MessageInfo. Right now, MessageInfo is a fairly simple struct:
```
pub struct MessageInfo {
    pub sender: Addr,
    pub funds: Vec<Coin>,
}
```
It's typical for the entity accessing the smart contract to be called the "sender". The sender can provide funds to the contract, which is retained to be accessed and used by the contract.

Addr\
Every entity that wants to interact with a blockchain needs a unique address. In the case of CosmWasm, addresses in Rust come in the type 
Addr
. Addr is a string type that conforms to some cryptographic requirements of the blockchain and can be validated. You will see it often throughout these excercises.

Saving with Config \
As a reminder, our config function takes a variable of type Storage. This happens to come from the deps argument.

Once config is called, we can save the state by applying the .save() function, and passing in a reference to state (e.g., save(&state)). You can check the state.rs file to remind yourself how config works.

The save function returns a StdResult, so use the ? Rust operator to capture any errors.


## Exercise
For this exercise, input the owner argument and save it to the contract's state.

1. Create a variable called state and initialize it with a State struct that contains a single member, owner.
2. owner will be populated by the info.sender argument.
3. Use config to save &state into deps.storage.
