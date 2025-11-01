import sgleam/check

/// Essa função deve descartar os x primeiros números de uma lista. Exemplo f(2, [1, 2, 3, 4])
/// deve retornar [3, 4].

pub fn descarta(x: Int, lista: List(a)) -> List(a) {
    case x, lista {
        0, [p1, ..r1] -> [p1, ..descarta(0, r1)]
        _, [p1, ..r1] -> descarta(x - 1, r1)
        _, [] -> []
    }
}

pub fn descarta_examples() {
    check.eq(descarta(0, []), [])
    check.eq(descarta(0, [1, 2, 3]), [1, 2, 3])
    check.eq(descarta(2, [1, 2, 3]), [3])
    check.eq(descarta(4, [1, 2, 3]), [])
    check.eq(descarta(3, [1, 2, 3]), [])
}