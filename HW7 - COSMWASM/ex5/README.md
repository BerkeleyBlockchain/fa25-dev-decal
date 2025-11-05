### Exercise 5: Storing State

## Overview

> With the outer module and scaffolding just built,
> soon we can include our memory core. 
> For the safety and benefit of travelers and portal operators, 
> first we'll build something to prepare incoming data for our memory structures.

While a smart contract can store information on the blockchain, that comes at a cost in the form of 
gas and fees
, but this ability to store and compute on open data, that everybody can access, is what allows it to be decentralized.

In this exercise, we'll create a State struct to store our basic information when the contract is initialized. This is typically done in a file named state.rs in your CosmWasm project.

Serialize and Deserialize \
We'll be making use of the 
Serde
 framework to serialize and deserialize the Rust data structures. In our case, we need our upcoming State struct to store data in such a way that it's prepared for storing on the blockchain.

From Serde, Serialize and Deserialize are traits that need to be applied to the struct using the derive attribute.

But first, let's get the struct written out. We'll build the structure here, then talk about the specifics in later exercises.


## Exercise
From Serde, Serialize and Deserialize are traits that need to be applied to the State struct. They will be applied using the derive attribute.

1. Apply #[derive(Trait1, Trait2)] to Serialize and Deserialize.
2. Immediately below derive, create a public struct called State.
3. State will have four public members called owner, planet_name, planet_sapients and minimum_sapience.
4. The members will be of the following types, respectively: Addr, String, Vec<Sapient>, and SapienceScale.
