import sgleam/check
import gleam/string

/// Essa função recebe uma string e um número natural,
/// retorna a string recebida, com a quantidade estabelecida pelo
/// parâmetro, caracteres iniciais ocm a letra "x"


pub fn substitui_car(palavra: String, n: Int) -> String {
    let palavra_cortada = string.slice(palavra, at_index: n, length: string.length(palavra))
    let preffix = adiciona_x("", n)
    let nova_palavra = string.concat([preffix, palavra_cortada])
}

pub fn adiciona_x(palavra: String, n: Int) -> String {
    case n == 0 {
        True -> palavra
        False -> adiciona_x(string.concat([palavra, "x"]), n - 1)
    }
}

pub fn substitui_car_examples() {
    check.eq(substitui_car("joao", 2), "xxao")
    check.eq(substitui_car("joao", 0), "joao")
    check.eq(substitui_car("joao", 5), "xxxxx")
}