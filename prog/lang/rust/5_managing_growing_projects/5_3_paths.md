# Paths

/ [home](/README.md) / [prog](/prog/README.md) / [lang](/prog/lang/README.md) / [rust](/prog/lang/rust/README.md) / [5. Managing Growing Projects](/prog/lang/rust/5_managing_growing_projects/README.md) / [5.2. Paths](/prog/lang/rust/5_managing_growing_projects/5_3_paths.md)

## Table of Contents

- [Paths](#paths)
  - [Table of Contents](#table-of-contents)
  - [Exposing Paths with the pub Keyword](#exposing-paths-with-the-pub-keyword)
  - [Starting Relative Paths with super](#starting-relative-paths-with-super)
  - [Making Structs and Enums Public](#making-structs-and-enums-public)

A path can take two forms:

- An absolute path starts from a crate root by using a crate name or a literal crate.
- A relative path starts from the current module and uses self, super, or an identifier in the current module.

🔹 Child modules wrap and hide their implementation details, but the child modules can see the context in which they’re defined.

## Exposing Paths with the pub Keyword

```rust
mod front_of_house {
    pub mod hosting {
        pub fn add_to_waitlist() {}
    }
}

pub fn eat_at_restaurant() {
    // Absolute path
    crate::front_of_house::hosting::add_to_waitlist();

    // Relative path
    front_of_house::hosting::add_to_waitlist();
}

fn main() {}
```

## Starting Relative Paths with super

We can also construct relative paths that begin in the parent module by using `super` at the start of the path. This is like starting a filesystem path with the `..` syntax.

```rust
fn serve_order() {}

mod back_of_house {
    fn fix_incorrect_order() {
        cook_order();
        super::serve_order();
    }

    fn cook_order() {}
}

fn main() {}
```

## Making Structs and Enums Public

If we use pub before a struct definition, we make the struct public, but the struct’s fields will still be private.

We can make each field public or not on a case-by-case basis.

```rust

#![allow(unused)]
fn main() {
    mod back_of_house {
        pub struct Breakfast {
            pub toast: String,
            seasonal_fruit: String,
        }

        impl Breakfast {
            pub fn summer(toast: &str) -> Breakfast {
                Breakfast {
                    toast: String::from(toast),
                    seasonal_fruit: String::from("peaches"),
                }
            }
        }
    }

    pub fn eat_at_restaurant() {
        // Order a breakfast in the summer with Rye toast
        let mut meal = back_of_house::Breakfast::summer("Rye");
        // Change our mind about what bread we'd like
        meal.toast = String::from("Wheat");
        println!("I'd like {} toast please", meal.toast);

        // The next line won't compile if we uncomment it; we're not allowed
        // to see or modify the seasonal fruit that comes with the meal
        // meal.seasonal_fruit = String::from("blueberries");
    }
}
```

🔹 In contrast, if we make an enum public, all of its variants are then public. We only need the pub before the enum keyword:

```rust
mod back_of_house {
    pub enum Appetizer {
        Soup,
        Salad,
    }
}

pub fn eat_at_restaurant() {
    let order1 = back_of_house::Appetizer::Soup;
    let order2 = back_of_house::Appetizer::Salad;
}
```
