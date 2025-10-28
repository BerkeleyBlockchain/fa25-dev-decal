# Simple Counter Smart Contract - CosmWasm Homework
This homework assignment guides you through creating, testing, and deploying a basic CosmWasm smart contract written in Rust. The contract allows for incrementing, decrementing, and resetting a counter.


## Setup
### 1. Install Rust
If you haven't installed Rust, use rustup for more version management features:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```


### 2. VSCode Extensions
Install the following extensions in VSCode:

- Rust Analyzer
- TOML Language Support

#### 3. Create the Rust Project
Initialize a new Rust project:
```bash
cargo init
```
This will  initialize a new Rust project in the current directory. It will create a Cargo.toml file and a Cargo.lock file.


## DNA Calculations


It's time for bioinformatics! And by "bioinformatics" we mean counting chars.

### Counting 
A strand of DNA is made up of a combination of four nucleotide bases -- cytosine, guanine, adenine, and thymine, which are described by the letters C, G, A, T. To begin, we want you to write a function that takes in a sequence of these bases and count how many times they occur:
```rust
pub struct NucleotideCounter {
     pub a: usize,
     pub c:usize,
     pub g:usize,
     pub t: usize,
}

pub fn counts(dna: &[char]) -> NucleotideCounter {
     todo!()
}
```


The input will be a list that looks something like this: ['A', 'C', 'G', 'A', 'T', ...]. Each time you encounter one of these four symbols, we expect you to count it in the corresponding field in this counter and return it at the end.

Hint: You can loop through the elements of a list with a for-loop.

If the sequence includes letter that is not one of these, we will expect you to panic. This includes the lowercase letters a, g, etc. -- only capital letters are valid, only these four. Since we haven't talked about error handling yet, here's how to panic:

```rust
panic!("Error");
```



### Complementary DNA
DNA consists of two strands that are linked base to base. Each base has a specific friend that it bonds with:

Base G only binds to base C and vice versa
Base A only binds to base T and vice versa
In the next function, we want you to give us this thread that binds to the passed, base by base:

```rust
pub fn dna_complement(dna: &[char]) -> Vec<char> {
     todo!()
}
```

So, dna_complement(&['A', 'C']) we would expect to return a vector with first element 'T' and second element 'G'. As with the first function, we expect that if we provide a different letter than these four, you will panic.

### RNA
DNA is the "instructions" for an organism.. RNA molecules copy these instructions and deliver them to make proteins. Instead of the base thymine (T) it uses the base uracil (U), which works the same way -- it binds to adenosine (A).

The other interesting thing is that the thread reads backwards, or at least something we vaguely remember and will boldly use as an excuse to make you iterate backwards for variety:

```rust
pub fn reverse_rna_complement(dna: &[char]) -> Vec<char> {
     todo!()
}
```

We expect this function to give us the "complement" of the passed string, just like the previous function. With the difference that instead of T we would expect the base U to be present, and the strand must be reversed. That is, reverse_rna_complement(&['A', 'C']) should return a vector with first element 'G' and second element 'U'.

It would probably be easiest to invert the result vector, which sounds like something that might be described somewhere in the standard library documentation.

Again, panic at an unexpected symbol. The input is DNA, so the four validation symbols are unchanged, only the output will be different.

To compile and test your solution:

```bash
cargo test
```

## Submission
Submit your solution.rs file to Gradescope under the assignment for Homework 6.
## Tips
Always refer to the Rust documentation when stuck.
