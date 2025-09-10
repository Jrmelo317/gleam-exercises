import sgleam/check
import gleam/string

///Essa função verifica se uma palavra é uma palavra duplicada, com hífen ou não em seu meio
/// Retorna True se for duplicada e False se não for.


pub fn verifica_duplicada(palavra: String) -> Bool {
    let tam = string.length(palavra)
    case tam % 2 == 0 {
        True -> case string.slice(palavra, tam / 2, tam) == string.slice(palavra, 0, tam / 2) {
            True -> True
            False -> False
        }
        False -> case string.slice(palavra, {tam - 1} / 2 + 1, tam) == string.slice(palavra, 0, {tam - 1} / 2) && string.slice(palavra, {tam - 1} / 2, 1) == "-" {
            True -> True
            False -> False
        }
    }
}

pub fn verifica_duplicada_examples() {
    check.eq(verifica_duplicada("lero-lero"), True)
    check.eq(verifica_duplicada("leri-lero"), False)
    check.eq(verifica_duplicada("lero-iero"), False)
    check.eq(verifica_duplicada("lerolero"), True)
    check.eq(verifica_duplicada("lero-ler"), False)
    check.eq(verifica_duplicada("ler-lero"), False)
    check.eq(verifica_duplicada("leroler"), False)
    check.eq(verifica_duplicada("lerlero"), False)
}