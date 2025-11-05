### Exercise 9: The InstantiateMsg Type

## Overview
> The shell of a Jump Ring, such a sight to behold. Keep going, you're almost ready to turn this thing on!

We've talked about DepsMut and MessageInfo already; we're going to ignore Env for this lesson, leaving us with InstantiateMsg, which is a structure we'll write to ensure anyone calling our contract complies to our design.

All CosmWasm entry points take either an enum or a struct. For instantiate, structs are typically used to initialize a smart contract with starting values. We need to apply Serialize and Deserialize since this information is coming from outside the contract.

For our Jump Ring smart contract, we're only going to expect a few basics items:

- The planet's name, as a String;
- A list of sapient creatures on the planet as a Vec<Sapient>;
- The minimum sapience allowed for passage through this particular Jump Ring (based on the Interchain endorsed and totally legit SapienceScale, which we can view in species.rs along with Sapient).
- There will be additional messages for the other two entry points coming later. We'll do this work in a new file called msg.rs.


## Exercise
The "message" for instantiate is a public struct with public members.

1. Write a struct called InstantiateMsg.
2. The three members will be, in order, planet_name, planet_sapients, and minimum_sapience.
3. Apply the correct types to each member.
