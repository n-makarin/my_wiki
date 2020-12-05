# Defining and Instantiating Structs

/ [home](/README.md) / [prog](/prog/README.md) / [lang](/prog/lang/README.md) / [rust](/prog/lang/rust/README.md) / [3. Structs](/prog/lang/rust/3_structs/README.md) / [3.1. Defining and Instantiating Structs](/prog/lang/rust/3_structs/3_1_defining_and_instantiating_structs.md)

## Table of Contents

- [Defining and Instantiating Structs](#defining-and-instantiating-structs)
  - [Table of Contents](#table-of-contents)
  - [Definition](#definition)
  - [Instantiating](#instantiating)
  - [Struct update syntax](#struct-update-syntax)
  - [Tuple structs](#tuple-structs)
  - [Unit-like structs](#unit-like-structs)
  - [Ownership of Struct Data](#ownership-of-struct-data)

## Definition

```rust
struct User {
    // fields
    username: String,
    email: String,
    sign_in_count: u64,
    active: bool,
}
```

## Instantiating

```rust
let mut user1 = User {
    email: String::from("someone@example.com"),
    username: String::from("someusername123"),
    active: true,
    sign_in_count: 1,
};

//  we can change a value by using the dot notation and assigning into a particular field
user1.email = String::from("anotheremail@example.com");
```

`build_user` function that returns a User instance with the given email and username.

```rust
struct User {
    username: String,
    email: String,
    sign_in_count: u64,
    active: bool,
}

fn build_user(email: String, username: String) -> User {
    User {
        email: email,
        username: username,
        active: true,
        sign_in_count: 1,
    }
}

fn main() {
    let user1 = build_user(
        String::from("someone@example.com"),
        String::from("someusername123"),
    );
}
```

Field init shorthand syntax:

```rust
fn build_user(email: String, username: String) -> User {
    User {
        email,
        username,
        active: true,
        sign_in_count: 1,
    }
}
```

## Struct update syntax

```rust
let user1 = User {
    email: String::from("someone@example.com"),
    username: String::from("someusername123"),
    active: true,
    sign_in_count: 1,
};

let user2 = User {
    email: String::from("another@example.com"),
    username: String::from("anotherusername567"),
    ..user1
};
```

## Tuple structs

Tuple structs are useful when you want to give the whole tuple a name and make the tuple be a different type from other tuples, and naming each field as in a regular struct would be verbose or redundant.

```rust
fn main() {
    struct Color(i32, i32, i32);
    struct Point(i32, i32, i32);

    let black = Color(0, 0, 0);
    let origin = Point(0, 0, 0);
}
```

## Unit-like structs

They behave similarly to (), the unit type.

Unit-like structs can be useful in situations in which you need to implement a trait on some type but don’t have any data that you want to store in the type itself.

## Ownership of Struct Data

It’s possible for structs to store references to data owned by something else, but to do so requires the use of *lifetimes*.

Lifetimes ensure that the data referenced by a struct is valid for as long as the struct is.
