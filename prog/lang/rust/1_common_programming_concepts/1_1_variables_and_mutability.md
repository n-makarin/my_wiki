# Variables and mutability

/ [home](/README.md) / [prog](/prog/README.md) / [lang](/prog/lang/README.md) / [rust](/prog/lang/rust/README.md) / [1. Common programming concepts](/prog/lang/rust/1_common_programming_concepts/README.md) / [1.1. Variables and mutability](/prog/lang/rust/1_common_programming_concepts/1_1_variables_and_mutability.md)

## Table of Contents

- [Variables and mutability](#variables-and-mutability)
  - [Table of Contents](#table-of-contents)
  - [let](#let)
  - [const](#const)
  - [Shadowing](#shadowing)

## let

Variables are immutable by default.

```rust
let foo = bar
```

To make it mutable use `mut` statement:

```rust
let mut foo = bar
```

## const

- the type of the `const` value must be annotated
- Constants can be declared in any scope, including the global scope
- constants may be set only to a constant expression, not the result of a function call or any other value that could only be computed at runtime

```rust
const MAX_POINTS: u32 = 100_000;
```

## Shadowing

Difference between mut and shadowing is that because we’re effectively creating a new variable when we use the let keyword again, we can change the type of the value but reuse the same name.

```rust
let spaces = "   ";
let spaces = spaces.len();
```

❗️ don't use shadowing with `mut` variables

```rust
let mut spaces = "   ";
let spaces = spaces.len();
```
