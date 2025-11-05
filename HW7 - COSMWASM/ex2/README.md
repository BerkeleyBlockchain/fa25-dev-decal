### Exercise 2: CosmWasm Entry Points

## Overview
Since ages long passed, the JumpRing has remained hidden from all but the most determined of adventure seekers. Until now, none could reveal its secrets. You're the first of your kind to figure out how to activate the Ring and possibly even use it. If only you could figure out why there are these empty beakers scattered around…

You can think of smart contract code as the blueprint for the contract itself. It does not truly become a useful part of a blockchain until it has been instantiated. Once it is established on the blockchain it can be interacted with.

In this exercise and the next few we're going to work on the instantiate entry point (as well as two others).

In Rust (and other C/C++ and Java-like languages), there is the concept of an "entry point". This is typically called main and is the first function called when a compiled application is executed. When compiling a traditional Rust app, the compiler expects there to be a main function from which the rest of the application will start and run.

There is no main function in CosmWasm - so how does it know instantiate is an entry point (the other two notwithstanding)?

We instruct the code of that fact with a function attribute, using entry_point from the cosmwasm_std library:

```
use cosmwasm_std::entry_point;

#[entry_point]
pub fn instantiate(...) -> ... {...}
```
Instantiate is one of three such entry points into a smart contract. It's used during deployment to initialize settings for a contract that's been stored on-chain, and create an address on the blockchain where the contract can be called. Maybe you recognize this pattern, as it's called a Constructor in many programming languages.


## Exercise
Let's create an empty instantiate function. Here are the steps we're interested in:

1. Write a use declaration to get access to the entry_point attribute from the CW library.
2. Write the signature for a public Rust function called instantiate. For now, we only want to write the function with an empty parameters list, and empty body and no return, like this pub fn my_function() {}. We'll fill in the rest as we go along.
