import sgleam/check
import gleam/string
import gleam/int
import gleam/list

/// Conta a quantidade de dígitos de *n*.
/// Se *n* é 0, então devolve zero.
/// Se *n* é menor que zero, então devolve a quantidade
/// de dígitos do valor absoluto de *n*.


pub fn quantidade_digitos(n: Int) -> Int {
    case n == 0 {
        True -> 0
        False -> {
                let lista: List(String) = string.to_graphemes(int.to_string(int.absolute_value(n)))
                list.length(lista)
        }
    }
}
pub fn quantidade_digitos_examples() {
    check.eq(quantidade_digitos(123), 3)
    check.eq(quantidade_digitos(0), 0)
    check.eq(quantidade_digitos(-1519), 4)
}