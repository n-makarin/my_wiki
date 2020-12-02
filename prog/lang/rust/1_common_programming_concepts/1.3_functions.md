# Functions
Rust doesn’t care where you define your functions.

```rust
fn main() {
    another_function(5);
}

fn another_function(x: i32) {
    println!("The value of x is: {}", x);
}
```
<br>

The block that we use to create new scopes, `{}`, is an expression, for example:
```rust
fn main() {
    let x = 5;

    let y = {
        let x = 3;
        x + 1
    };

    println!("The value of y is: {}", y);
}
```
<br>

Here’s an example of a function that returns a value:
```rust
fn five() -> i32 {
    5
}

fn main() {
    let x = five();

    println!("The value of x is: {}", x);
}
```
<br>

❗️ Note we don't place a semicolon an the end of the expressions:
```rust
fn main() {
    let x = plus_one(5);

    println!("The value of x is: {}", x);
}

fn plus_one(x: i32) -> i32 {
    x + 1 // don't need to place a semicolon
}
```

