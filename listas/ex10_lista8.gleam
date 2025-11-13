import sgleam/check
import gleam/list
import gleam/int
import gleam/string


/// O objetivo desta função é criar uma função genérica, ou seja, que funcione para
/// ~qualquer tipo e receba um predicado, função que resulta um bool, daquele mesmo
/// tipo. Assim aplicando filter naquela função para manter apenas os elementos da
/// lista que respeitem o predicado.

pub fn do_filter(list: List(a), f: fn(a) -> Bool) -> List(a) {
    list.filter(list, f)
}

pub fn do_filter_examples() {
    check.eq(do_filter([1, 2, 3, 4, 5, 6], int.is_odd), [1, 3, 5])
    check.eq(do_filter(["ory", "theory", "mandatory", "hakunamatata"], string.is_empty), [])
    check.eq(do_filter([1, 2, 3, 4, 5, 6], int.is_even), [2, 4, 6])
}