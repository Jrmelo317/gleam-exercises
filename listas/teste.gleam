import gleam/string
import sgleam/check

pub fn soma(a: Int, b: Int) -> Int {
    a + b
}

pub fn soma_examples() {
    check.eq(soma(1, 2), 3)
}