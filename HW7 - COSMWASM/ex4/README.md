### Excersie 4: Entry Point Parameters

## Overview
You may feel like you're surrounded now by bits and pieces of teleporter scaffolding and cosmic junk. It will take a while to turn this blueprint into an apparatus fit for travel. You've got a bit of work ahead before this cybernetic scaffolding looks anything like a "Jump Ring", but you'll need a few more components in place before you can start hooking up the guts.

Our instantiate function takes four parameters: DepsMut, Env, MessageInfo and InstantiateMsg.

The first three parameters are from the cosmwasm_std library, and the last one, InstantiateMsg, is a custom struct we will write ourselves.

- Deps
, short for _dependencies_, provides access to CW utilities such as persistent storage; which, as you might have deduced, allows you to read from storage. For writing to storage you'll want the mutable version of this package, called 
DepsMut
.
- Env
, short for _environment_, provides information about the block and the transaction the message was executed in.
- MessageInfo
 contains the sender's (that is, the caller of the contract method) address and funds sent along with the transaction.

## Exercise
1. In order, add four parameters named deps, _env, info, and msg.
2. Add the types DepsMut, Env, MessageInfo, and InstantiateMsg.

The _env argument is prepended with an _ to tell the compiler not to complain about it being an unused variable, which you'll see as we progress through building up this function.
