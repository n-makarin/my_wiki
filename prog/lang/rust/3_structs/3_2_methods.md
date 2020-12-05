# Methods

/ [home](/README.md) / [prog](/prog/README.md) / [lang](/prog/lang/README.md) / [rust](/prog/lang/rust/README.md) / [3. Structs](/prog/lang/rust/3_structs/README.md) / [3.2. Methods](/prog/lang/rust/3_structs/3_2_methods.md)

## Table of Contents

- [Methods](#methods)
  - [Table of Contents](#table-of-contents)
  - [Defining Methods](#defining-methods)
  - [Associated Functions](#associated-functions)
  - [Multiple `impl` Blocks](#multiple-impl-blocks)

## Defining Methods

Methods let you specify the behavior that instances of your structs have.

```rust
#[derive(Debug)]
struct Rectangle {
    width: u32,
    height: u32,
}

impl Rectangle {
    fn area(&self) -> u32 {
        self.width * self.height
    }
}

fn main() {
    let rect1 = Rectangle {
        width: 30,
        height: 50,
    };

    println!(
        "The area of the rectangle is {} square pixels.",
        rect1.area()
    );
}
```

With multiple parameters:

```rust
impl Rectangle {
    fn area(&self) -> u32 {
        self.width * self.height
    }

    fn can_hold(&self, other: &Rectangle) -> bool {
        self.width > other.width && self.height > other.height
    }
}
```

## Associated Functions

To call this associated function, we use the `::` syntax with the struct name;

`let sq = Rectangle::square(3);`

```rust
#[derive(Debug)]
struct Rectangle {
    width: u32,
    height: u32,
}

impl Rectangle {
    fn square(size: u32) -> Rectangle {
        Rectangle {
            width: size,
            height: size,
        }
    }
}

fn main() {
    let sq = Rectangle::square(3);
}
```

## Multiple `impl` Blocks

Each struct is allowed to have multiple `impl` blocks.

This could be useful for **generic types** and **traits**.
