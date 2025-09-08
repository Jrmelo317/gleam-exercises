import sgleam/check
import gleam/string


///Essa função verifica se uma frase tem um ponto final
///se não tiver adiciona o ponto final a ela


pub fn verifica_ponto(frase: String) -> String {
    let ultimo_digito_frase: String = string.slice(frase, at_index: string.length(frase) - 1, length: 1)
    case ultimo_digito_frase == "." {
        True -> frase
        False -> string.append(to: frase, suffix: ".")
    }
}

pub fn verifica_ponto_examples() {
    check.eq(verifica_ponto("Aleluia"), "Aleluia.")
    check.eq(verifica_ponto("João."), "João.")
}