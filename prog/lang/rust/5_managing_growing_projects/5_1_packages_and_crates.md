# Packages and Crates

/ [home](/README.md) / [prog](/prog/README.md) / [lang](/prog/lang/README.md) / [rust](/prog/lang/rust/README.md) / [5. Managing Growing Projects](/prog/lang/rust/5_managing_growing_projects/README.md) / [5.1. Packages and Crates](/prog/lang/rust/5_managing_growing_projects/5_1_packages_and_crates.md)

## Table of Contents

- [Packages and Crates](#packages-and-crates)
  - [Table of Contents](#table-of-contents)

**Crates** may be binary or liblary.

**crate root** - is a source file that the Rust compiler starts from and makes up the root module of your crate.

**package** - is one or more crates that provide a set of functionality.
A package contains a *Cargo.toml* file that describes how to build those crates.

A package **must** contain zero or one library crates, and no more. It can contain as many binary crates as you’d like, but it must contain at least one crate (either library or binary).

If a package contains *src/main.rs* and *src/lib.rs*, it has two crates: a library and a binary, both with the same name as the package.
