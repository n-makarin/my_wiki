# The match Control Flow Operator

/ [home](/README.md) / [prog](/prog/README.md) / [lang](/prog/lang/README.md) / [rust](/prog/lang/rust/README.md) / [4. Enums and Pattern Matching](/prog/lang/rust/4_enums_and_pattern_matching/README.md) / [4.2. The match Control Flow Operator](/prog/lang/rust/4_enums_and_pattern_matching/4_2_the_match_control_flow_operator.md)

## Table of Contents

- [The match Control Flow Operator](#the-match-control-flow-operator)
  - [Table of Contents](#table-of-contents)
  - [Instance](#instance)
  - [Patterns that Bind to Values](#patterns-that-bind-to-values)
  - [Matching with `Option<T>`](#matching-with-optiont)
  - [Matches Are Exhaustive](#matches-are-exhaustive)
  - [The `_` Placeholder](#the-_-placeholder)
  
## Instance

```rust
fn value_in_cents(coin: Coin) -> u8 {
  match coin {
      Coin::Penny => {
          println!("Lucky penny!");
          1
      }
      Coin::Nickel => 5,
      Coin::Dime => 10,
      Coin::Quarter => 25,
  }
}
```

## Patterns that Bind to Values

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

fn value_in_cents(coin: Coin) -> u8 {
    match coin {
        Coin::Penny => 1,
        Coin::Nickel => 5,
        Coin::Dime => 10,
        Coin::Quarter(state) => {
            println!("State quarter from {:?}!", state);
            25
        }
    }
}

fn main() {
    value_in_cents(Coin::Quarter(UsState::Alaska));
}
```

## Matching with `Option<T>`

```rust
fn main() {
    fn plus_one(x: Option<i32>) -> Option<i32> {
        match x {
            None => None,
            Some(i) => Some(i + 1),
        }
    }

    let five = Some(5);
    let six = plus_one(five);
    let none = plus_one(None);
}
```

## Matches Are Exhaustive

Matches in Rust are exhaustive: we must exhaust every last possibility in order for the code to be valid

```rust
fn plus_one(x: Option<i32>) -> Option<i32> {
    match x {
        Some(i) => Some(i + 1),
    }
}
// non-exhaustive patterns: `None` not covered
```

## The `_` Placeholder

By putting it after our other arms, the _ will match all the possible cases that aren’t specified before it.

The () is just the unit value, so nothing will happen in the _ case.

```rust
let some_u8_value = 0u8;
match some_u8_value {
    1 => println!("one"),
    3 => println!("three"),
    5 => println!("five"),
    7 => println!("seven"),
    _ => (),
}
```
