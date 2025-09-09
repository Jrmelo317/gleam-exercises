import sgleam/check
import gleam/string

/// Essa função verifica se um texto escrito pelo usuário está de acordo com a
/// regra de não possuir espaços extras, ou seja a string não começa nem acaba com
/// o caracter de espaço, retorna True se estiver de acordo e False se não estiver
/// de acordo


pub fn verifica_espacos_extras(palavra: String) -> Bool {
    case !{string.starts_with(palavra, " ")} && !{string.ends_with(palavra, " ")} {
        True -> True
        False -> False
    }
}

pub fn verifica_espacos_extras_examples() {
    check.eq(verifica_espacos_extras(" Falso"), False)
    check.eq(verifica_espacos_extras("Falso "), False)
    check.eq(verifica_espacos_extras("True"), True)
}