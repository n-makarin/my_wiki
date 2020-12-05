# References and Borrowing

/ [home](/README.md) / [prog](/prog/README.md) / [lang](/prog/lang/README.md) / [rust](/prog/lang/rust/README.md) / [2. Ownership](/prog/lang/rust/2_ownership/README.md) / [2.2. References and Borrowing](/prog/lang/rust/2_ownership/2_2_references_and_borrowing.md)

## Table of Contents

- [References and Borrowing](#references-and-borrowing)
  - [Table of Contents](#table-of-contents)
  - [References](#references)
  - [Borrowing](#borrowing)
  - [Mutable References](#mutable-references)
  - [Dangling References](#dangling-references)
  - [The Rules of References](#the-rules-of-references)

## References

```rust
fn main() {
    let s1 = String::from("hello");

    let len = calculate_length(&s1);

    println!("The length of '{}' is {}.", s1, len);
}

fn calculate_length(s: &String) -> usize {
    s.len()
}
```

References allow you to refer to some value without taking ownership of it.
<!-- markdownlint-disable MD033 -->
<img src="/img/prog/lang/rust/pointer.svg" width="375" alt="pointer in memory">

🔹 The opposite of referencing by using & is *dereferencing*, which is accomplished with the dereference operator, `*`.

Because reference does not own variable, the value it points to will not be dropped when the reference goes out of scope.

## Borrowing

**borrowing** - function with references as a parameters

We won’t need to return the values in order to give back ownership, because we never had ownership.

🔹 Just as variables are immutable by default, so are references. We’re not allowed to modify something we have a reference to.

```rust
fn main() {
    let s = String::from("hello");

    change(&s);
}

fn change(some_string: &String) {
    some_string.push_str(", world");
}

// error[E0596]: cannot borrow `*some_string` as mutable, as it is behind a `&` reference
```

## Mutable References

```rust
fn main() {
    let mut s = String::from("hello");

    change(&mut s);
}

fn change(some_string: &mut String) {
    some_string.push_str(", world");
}
```

🔸 But mutable references have one big restriction: you can have only one mutable reference to a particular piece of data in a particular scope.

This code will fail:

```rust
fn main() {
    let mut s = String::from("hello");

    let r1 = &mut s;
    let r2 = &mut s;

    println!("{}, {}", r1, r2);

    // error[E0499]: cannot borrow `s` as mutable more than once at a time
}
```

The benefit of having this restriction is that Rust can prevent data races at compile time. A *data race* is similar to a race condition and happens when these three behaviors occur:

- Two or more pointers access the same data at the same time.
- At least one of the pointers is being used to write to the data.
- There’s no mechanism being used to synchronize access to the data.

As always, we can use curly brackets to create a new scope, allowing for multiple mutable references, just not simultaneous ones:

```rust
fn main() {
    let mut s = String::from("hello");

    {
        let r1 = &mut s;
    } // r1 goes out of scope here, so we can make a new reference with no problems.

    let r2 = &mut s;
}
```

❗️ We can't combine mutable and immutable references to once variable:

```rust
fn main() {
    let mut s = String::from("hello");

    let r1 = &s; // no problem
    let r2 = &s; // no problem
    let r3 = &mut s; // BIG PROBLEM

    println!("{}, {}, and {}", r1, r2, r3);
}
```

🔹 Note that a reference’s scope starts from where it is introduced and continues through the last time that reference is used. For instance, this code will compile because the last usage of the immutable references occurs before the mutable reference is introduced:

```rust
fn main() {
    let mut s = String::from("hello");

    let r1 = &s; // no problem
    let r2 = &s; // no problem
    println!("{} and {}", r1, r2);
    // r1 and r2 are no longer used after this point

    let r3 = &mut s; // no problem
    println!("{}", r3);
}
```

## Dangling References

Dangling references is a references that use data of location in memory that may have been given to someone else, by freeing some memory while preserving a pointer to that memory.

❗️ Here is an example of error:

```rust
fn main() {
    let reference_to_nothing = dangle();
}

fn dangle() -> &String {
    let s = String::from("hello");

    &s
}
// this function's return type contains a borrowed value,
// but there is no value for it to be borrowed from
```

## The Rules of References

- At any given time, you can have either one mutable reference or any number of immutable references.
- References must always be valid.
