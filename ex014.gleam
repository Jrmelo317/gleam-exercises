import gleam/io
import gleam/string
import gleam/int

pub fn verifica_tamanho_tres(x: Int) -> Bool {
    let qtd_digitos = string.length(int.to_string(x))
    case qtd_digitos == 3 {
        True -> True
        False -> False
    }
}

pub fn main() {
    let teste1 = 99
    let teste2 = 100
    let teste3 = 999
    let teste4 = 1000

    io.debug(verifica_tamanho_tres(teste1))
    io.debug(verifica_tamanho_tres(teste2))
    io.debug(verifica_tamanho_tres(teste3))
    io.debug(verifica_tamanho_tres(teste4))
}