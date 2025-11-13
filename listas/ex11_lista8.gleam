import sgleam/check
import gleam/int
import gleam/string

/// Essa função deve aplicar duas vezes uma função em f passada como parâmetro para
/// um x, que também é recebido como parâmetro. Exemplo: duas_vezes(3, fn(x) {x + 1})
/// deve retornar 5.

pub fn two_times(x: a, f: fn(a) -> a) -> a {
    f(f(x))
}

pub fn two_times_examples() {
    check.eq(two_times(1, fn(x) {x + 10}), 21)
    check.eq(two_times(1, int.negate), 1)
    check.eq(two_times("Aiai", string.lowercase), "aiai")
    check.eq(two_times(100, fn(x) {x - 10}), 80)
    check.eq(two_times(-5, fn(x) {5 - x}), -5)
}