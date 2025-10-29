import sgleam/check
import gleam/string
import gleam/int

/// Essa função deve receber uma lista de strings, e contar qual a média de caracteres que
/// cada string desta lista contém

pub fn media_char(lista: List(String)) -> Float {
    let total_elementos = conta_elementos(lista)
    let total_char = total_char(lista)

    let total_elementos_float = int.to_float(total_elementos)
    let total_char_float = int.to_float(total_char)

    total_char_float /. total_elementos_float
}

pub fn media_char_examples() {
    check.eq(media_char([]), 0.0)
    check.eq(media_char(["a", "b", "cd"]), 1.333)
    check.eq(media_char(["abd", "edf"]), 3.0)
    check.eq(media_char(["abc", "ce", "a"]), 2.0)
    check.eq(media_char(["asd", "as"]), 2.5)
}

/// Essa função deve contar quantas strings uma lista possui (elementos no geral).

pub fn conta_elementos(lista: List(a)) -> Int {
    case lista {
        [] -> 0
        [_primeiro, ..resto] -> 1 + conta_elementos(resto)
    }
}

pub fn conta_elementos_examples() {
    check.eq(conta_elementos([1, 2, 3, 4]), 4)
    check.eq(conta_elementos([]), 0)
    check.eq(conta_elementos(["a", "b", "c"]), 3)
}

/// Coleta a quantidade total de caracteres de uma lista de caracteres

pub fn total_char(lista: List(String)) -> Int {
    case lista {
        [] -> 0
        [primeiro, ..resto] -> string.length(primeiro) + total_char(resto)
    }
}

pub fn total_char_examples() {
    check.eq(total_char([]), 0)
    check.eq(total_char(["abc", "def"]), 6)
    check.eq(total_char(["a", "bc", "def"]), 6)
}