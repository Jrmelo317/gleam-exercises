import sgleam/check
import gleam/string
import gleam/list

/// Essa função deve adicionar um nove a frente de um número de celuluar,
/// caso este ainda não conte com um. Os números são representados por strings,
/// e seguem o formato DDD - de 2 dígitos entre parênteses - 8 ou nove números
/// regularmente separados por um hífen


pub fn adiciona_digito(numero: String) -> String {
    case string.length(numero) > 14 {
        True -> numero
        False -> {
            let numero_lista = string.to_graphemes(numero)
            let numero_fim = list.drop(numero_lista, 5)
            let numero_inicio = list.take(numero_lista, 5)
            let numero_inicio_nove = list.append(numero_inicio, ["9"])
            let numero_completo = list.append(numero_inicio_nove, numero_fim)
            string.join(numero_completo, "")
        }
    } 
}

pub fn adiciona_digito_examples() {
    check.eq(adiciona_digito("(44) 99898-9936"), "(44) 99898-9936")
    check.eq(adiciona_digito("(51) 9898-9936"), "(51) 99898-9936")
    check.eq(adiciona_digito("(44) 8898-9936"), "(44) 98898-9936")
    check.eq(adiciona_digito("(44) 9988-3215"), "(44) 99988-3215")
    check.eq(adiciona_digito("(44) 99922-5120"), "(44) 99922-5120")
}