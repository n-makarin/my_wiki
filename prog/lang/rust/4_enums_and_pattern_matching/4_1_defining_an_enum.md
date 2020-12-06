# Defining an Enum

/ [home](/README.md) / [prog](/prog/README.md) / [lang](/prog/lang/README.md) / [rust](/prog/lang/rust/README.md) / [4. Enums and Pattern Matching](/prog/lang/rust/4_enums_and_pattern_matching/README.md) / [4.1. Defining an Enum](/prog/lang/rust/4_enums_and_pattern_matching/4_1_defining_an_enum.md)

## Table of Contents

- [Defining an Enum](#defining-an-enum)
  - [Table of Contents](#table-of-contents)
  - [Enum Values](#enum-values)
  - [Method `call`](#method-call)
  - [`enum Option<T>`](#enum-optiont)

## Enum Values

```rust
enum IpAddrKind {
    V4,
    V6,
}
```

We can create instances of each of the two variants of IpAddrKind like this:

```rust
let four = IpAddrKind::V4;
let six = IpAddrKind::V6;

fn route(ip_kind: IpAddrKind) {}

route(IpAddrKind::V4);
```

We can associate both variants with `String` values:

```rust
enum IpAddr {
    V4(String),
    V6(String),
}

let home = IpAddr::V4(String::from("127.0.0.1"));

let loopback = IpAddr::V6(String::from("::1"));
```

Values in `enum` may have different types:

```rust
enum IpAddr {
    V4(u8, u8, u8, u8),
    V6(String),
}

let home = IpAddr::V4(127, 0, 0, 1);

let loopback = IpAddr::V6(String::from("::1"));
```

```rust
enum Message {
    Quit,
    Move { x: i32, y: i32 },
    Write(String),
    ChangeColor(i32, i32, i32),
}
```

## Method `call`

```rust
fn main() {
    enum Message {
        Quit,
        Move { x: i32, y: i32 },
        Write(String),
        ChangeColor(i32, i32, i32),
    }

    impl Message {
        fn call(&self) {
            // method body would be defined here
        }
    }

    let m = Message::Write(String::from("hello"));
    m.call();
}
```

## `enum Option<T>`

As such, Rust does not have nulls, but it does have an enum that can encode the concept of a value being present or absent.

It has options `Some` and `None`:

```rust
enum Option<T> {
    Some(T),
    None,
}
```

```rust
fn main() {
    let some_number = Some(5);
    let some_string = Some("a string");

    let absent_number: Option<i32> = None;
}
```

🔹 If we use `None` rather than `Some`, we need to tell Rust what type of `Option<T>` we have.

🔸  `Option<T>` and `T` (where `T` can be any type) are different types, the compiler won’t let us use an `Option<T>` value as if it were definitely a valid value.

For example, this code won’t compile because it’s trying to add an `i8` to an `Option<i8>`:

```rust
fn main() {
    let x: i8 = 5;
    let y: Option<i8> = Some(5);

    let sum = x + y;
}
```
