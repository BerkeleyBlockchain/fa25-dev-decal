### Exercise 6: Storing the Struct

## Overview
> During the Jump Ring operation we'll need to access the memory bank for things like locations to be teleported to, and authorized portal operators. Here we'll include the aforementioned memory core.

Now that we have our struct to work with, let's begin creating the tools to read and write to it.

CosmWasm Storage \
One of the parameters passed to instantiate is deps: DepsMut; it contains a member called storage: Storage. This is what we will be updating on the blockchain. We'll do it using the 
Singleton
 implementation from the cosmwasm_storage library.

We'll have two separate functions — a write function, called config, and a read-only function called config_read. Conveniently, cosmwasm_storage provides two matching versions called Singleton and ReadonlySingleton.


## Exercise
We're only going to write the signatures for this; we'll add the functionality in the next exercise.

1. Write two public functions called config and config_read.
2. config will take one argument: storage: &mut dyn Storage and return Singleton<State>.
3. config_read will also take one argument: storage: &dyn Storage and return ReadonlySingleton<State>.
