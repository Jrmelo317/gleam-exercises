import gleam/io
import gleam/string

pub fn so_primeira_maiuscula(palavra: String) -> String {
    let incio = string.slice(palavra, 0, 1)
    let resto = string.slice(palavra, 1, string.length(palavra))

    let inicio_maiusculo = string.uppercase(incio)
    let resto_minusculo = string.lowercase(resto)
    string.concat([inicio_maiusculo, resto_minusculo])
}

pub fn main() {
    io.debug(so_primeira_maiuscula("paula"))
    io.debug(so_primeira_maiuscula("ALFREDO"))
}