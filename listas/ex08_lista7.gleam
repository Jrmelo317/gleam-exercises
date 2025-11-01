import sgleam/check

/// Essa função deve retornar apenas a primeira quantidade x de uma lista de elementos.
/// Exemplos f(2, [1, 2, 3, 4]) deve retornar [1, 2].

pub fn mantem(x: Int, lista: List(a)) -> List(a) {
    case x, lista {
        0, _ -> []
        _, [first, ..rest] -> [first, ..mantem(x - 1, rest)]
        _, [] -> []
    }
}

pub fn mantem_examples() {
    check.eq(mantem(0, []), [])
    check.eq(mantem(0, [1, 2, 3]), [])
    check.eq(mantem(2, [1, 2, 3, 4]), [1, 2])
    check.eq(mantem(4, [1, 2, 3]), [1, 2, 3])
    check.eq(mantem(3, [1, 2, 3]), [1, 2, 3])
}