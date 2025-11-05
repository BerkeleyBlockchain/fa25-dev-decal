# Cosm Wasm

Welcome to hw7, you will be using Rust with smart contracts, finally

## Installation
```bash
rustup target add wasm32-unknown-unknown
```

```bash
git clone git@github.com:CosmWasm/wasmd.git
cd ./wasmd
make install
```

### Utility Checking
An additional helpful tool for building smart contracts is the cosmwasm-checkutility. It allows you to check if the wasm binary is a proper smart contract ready to upload into the blockchain. You can install it using cargo:

```bash
cargo install cosmwasm-check
```
```bash
cosmwasm-check --version
```

[installation instructions](https://book.cosmwasm.com/setting-up-env.html)