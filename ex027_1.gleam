import sgleam/check
import gleam/string

/// Essa função rotaciona uma string a direita uma quantidade n de caracteres,
/// desta forma ela "pega" os n caracteres finais da string, e coloca nas n
/// primeiras posições da string


pub fn rotaciona_direita_string(palavra: String, n: Int) -> String {
    string.concat([string.slice(palavra, string.length(palavra) - n, n), string.slice(palavra, 0, string.length(palavra) - n)])
}

pub fn rotaciona_direita_string_examples() {
    check.eq(rotaciona_direita_string("marcelio", 5), "celiomar")
    check.eq(rotaciona_direita_string("marcelio", 8), "marcelio")
    check.eq(rotaciona_direita_string("joao", 2), "aojo")
    check.eq(rotaciona_direita_string("eloah", 0), "eloah")
    check.eq(rotaciona_direita_string("fabio", 3), "biofa")
}