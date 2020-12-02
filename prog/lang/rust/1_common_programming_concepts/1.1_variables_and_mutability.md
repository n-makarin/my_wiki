# Variables and Mutability

## let
Variables are immutable by default.
```rust
let foo = bar
```
<br>

To make it mutable use `mut` statement:
```rust
let mut foo = bar
```

## const
* the type of the `const` value must be annotated
* Constants can be declared in any scope, including the global scope
* constants may be set only to a constant expression, not the result of a <br>
  function call or any other value that could only be computed at runtime

```rust
const MAX_POINTS: u32 = 100_000;
```

## Shadowing
Difference between mut and shadowing is that because we’re effectively creating a new variable when we use the let keyword again, we can change the type of the value but reuse the same name.

```rust
let spaces = "   ";
let spaces = spaces.len();
```
<br>

❗️ don't use shadowing with `mut` variables
```rust
let mut spaces = "   ";
let spaces = spaces.len();
```