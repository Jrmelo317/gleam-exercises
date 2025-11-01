import sgleam/check
import gleam/list

/// Essa função deve receber uma lista genérica, e remover o elemento de uma posião específica
/// na qual o usuário passar como parâmetro. Exemplo f(2, [1, 2, 3, 4]) retorna [1, 2, 4].
/// As posições começam a ser contadas a partir de 0.

pub fn remov_at(pos: Int, lista: List(a)) -> List(a) {
    case pos, lista {
        0, [first, ..rest] -> remov_at(list.length(rest) * 2, rest)
        _, [first, ..rest] -> [first, ..remov_at(pos - 1, rest)]
        _, [] -> []
    }
}

pub fn remov_at_examples() {
    check.eq(remov_at(0, []), [])
    check.eq(remov_at(0, [1, 2, 3]), [2, 3])
    check.eq(remov_at(1, [1, 2, 3]), [1, 3])
    check.eq(remov_at(3, [1, 2, 3]), [1, 2, 3])
}