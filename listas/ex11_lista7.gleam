import sgleam/check

/// Essa função deve inserir um elemento em uma posição específica de uma lista, recebendo como 
/// parâmtro o elemento, a posição no qual será inserido e a lista. Exemplo: f(1, 1, [0, 2, 3,])
/// retorna [0, 1, 2, 3]

pub fn insert_pos(elem: a, x: Int, lista: List(a)) -> List(a) {
    case x, lista {
        0, [first, ..rest] -> [elem, first, ..insert_pos(elem, -1, rest)]
        _, [first, ..rest] -> [first, ..insert_pos(elem, x - 1, rest)]
        _, [] -> []
    }
}

pub fn insert_pos_examples() {
    check.eq(insert_pos(0, -1, [1, 2, 3]), [1, 2, 3])
    check.eq(insert_pos(0, 0, [1, 2, 3]), [0, 1, 2, 3])
    check.eq(insert_pos(0, 1, [1, 2, 3]), [1, 0, 2, 3])
    check.eq(insert_pos(0, 3, [1, 2, 3]), [1, 2, 3])
    check.eq(insert_pos(0, 4, [1, 2, 3]), [1, 2, 3])
}