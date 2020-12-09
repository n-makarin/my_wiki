# Defining Modules

/ [home](/README.md) / [prog](/prog/README.md) / [lang](/prog/lang/README.md) / [rust](/prog/lang/rust/README.md) / [5. Managing Growing Projects](/prog/lang/rust/5_managing_growing_projects/README.md) / [5.2. Defining Modules](/prog/lang/rust/5_managing_growing_projects/5_2_defining_modules.md)

## Table of Contents

- [Defining Modules](#defining-modules)
  - [Table of Contents](#table-of-contents)

**Modules** let us organize code within a crate into groups for readability and easy reuse. Modules also control the privacy of items, which is whether an item can be used by outside code (public) or is an internal implementation detail and not available for outside use (private).

**module tree** - crate’s module structure

```rust
mod front_of_house {
    mod hosting {
        fn add_to_waitlist() {}

        fn seat_at_table() {}
    }

    mod serving {
        fn take_order() {}

        fn serve_order() {}

        fn take_payment() {}
    }
}

fn main() {}
```
