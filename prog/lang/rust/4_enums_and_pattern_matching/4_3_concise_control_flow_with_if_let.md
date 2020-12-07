# Concise Control Flow with if let

/ [home](/README.md) / [prog](/prog/README.md) / [lang](/prog/lang/README.md) / [rust](/prog/lang/rust/README.md) / [4. Enums and Pattern Matching](/prog/lang/rust/4_enums_and_pattern_matching/README.md) / [4.3. Concise Control Flow with if let](/prog/lang/rust/4_enums_and_pattern_matching/4_3_concise_control_flow_with_if_let.md)

## Table of Contents

- [Concise Control Flow with if let](#concise-control-flow-with-if-let)
  - [Table of Contents](#table-of-contents)

```rust
fn main() {
    let some_u8_value = Some(0u8);
    if let Some(3) = some_u8_value {
        println!("three");
    }
}
```

Using `if let` means less typing, less indentation, and less boilerplate code.

However, you lose the exhaustive checking that match enforces.

🔹 Choosing between `match` and `if let` depends on what you’re doing in your particular situation and whether gaining conciseness is an appropriate trade-off for losing exhaustive checking.

In other words, you can think of `if let` as syntax sugar for a `match` that runs code when the value matches one pattern and then ignores all other values.

```rust
#[derive(Debug)]
enum UsState {
    Alabama,
    Alaska,
    // --snip--
}

enum Coin {
    Penny,
    Nickel,
    Dime,
    Quarter(UsState),
}

fn main() {
    let coin = Coin::Penny;

    let mut count = 0;

    if let Coin::Quarter(state) = coin {
        println!("State quarter from {:?}!", state);
    } else {
        count += 1;
    }
}
```
