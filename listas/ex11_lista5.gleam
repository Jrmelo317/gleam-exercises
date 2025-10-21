import sgleam/check

/// Essa função deve receber uma lista de números inteiros do tipo Int, e retorna um booleano.
/// Retorna True se a lista estiver em ordem não decrescente, e False se estiver.


pub fn ordem_nao_decrescente(lista: List(Int)) -> Bool {
    case lista {
        [] -> True
        [_] -> True
        [primeiro, segundo, ..resto] if primeiro > segundo -> False
        [primeiro, ..resto] -> True && ordem_nao_decrescente(resto)
    }
}

pub fn ordem_nao_decrescente_examples() {
    check.eq(ordem_nao_decrescente([1, 2, 3, 4, 5]), True)
    check.eq(ordem_nao_decrescente([5, 4, 3, 2, 1]), False)
    check.eq(ordem_nao_decrescente([]), True)
    check.eq(ordem_nao_decrescente([5, 4, 10, 3, 1]), False)
    check.eq(ordem_nao_decrescente([1]), True)
    check.eq(ordem_nao_decrescente([1, 2, 3, 6, 4]), False)
}