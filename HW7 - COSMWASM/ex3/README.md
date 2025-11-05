### Exercise 3: Returning the Value of Instantiate

## Overview
Congrats on your decision to pursue interplanetary portal construction. With proper diligence the portal's secrets will be clarified in due time.

The instantiate entry point returns a Rust Result, taking a CosmWasm 
Response 
 struct and an error type.

Response \
The Response struct returns a few items that allow the contract to communicate back to the caller. It has several types in it for sending messages and data back.

Messages \
CosmWasm is based on the 
Actor Model
 design pattern. In this pattern, Actors do not talk directly to one another (i.e., do not call functions directly) but rather send messages to one another. Here's a basic interface for the Actor model:
```
pub trait Actor {
  fn handle(msgPayload: &[u8]) -> Vec<Msg>;
}

pub struct Msg {
  pub destination: Vec<u8>,
  pub payload: Vec<u8>,
}
```
## Exercise
For this exercise, we're simply going to elaborate on the instantiate outline we've already created.

1. Add a Result<R, E> return to the function. "R" will be Response and "E" will be ContractError, which we can import as a Rust 
Crate
.
2. Have the function return Ok(Response::default()).
