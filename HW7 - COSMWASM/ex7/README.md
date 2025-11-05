### Exercise 7: Singleton and Storage

## Overview
> With the memory core in place, and tapped into the Storage module, finally we can implement the cosmic subroutines for saving to and reading from its data banks.

The cosmwasm_storage package provides the singleton method which gives us access to typical storage methods, in particular, load and save, which we will use here.

The singleton function requires a unique key (key: &[u8]) as well, to ensure there are no collisions when saving the data. This lets us have multiple types of storage. The key indicates where we will read or save data, and will be the same for both instances of our config functions (i.e. config and config_read).


## Exercise
We'll write the key as a static constant, to be used as the second parameter of our config functions.

1. Write a static constant called CONFIG_KEY of type &[u8]. Assign the value b"config" to it.
2. In config, return singleton, with storage for the first argument, and the key we assigned in step 1, for the second argument.
3. For config_read, you'll use singleton_read and its arguments will be the same as the parameters for config.
