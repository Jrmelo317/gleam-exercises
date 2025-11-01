import sgleam/check
import gleam/list

/// Essa função serve para verificar se duas listas de inteiros são iguais. Ser igual considera-se que,
/// ela tem os mesmos elementos, em mesma quantidade e em exata mesma ordem. Ela retorna o bool True se
/// for, se não for retorna false.

pub fn compar_lists(l1: List(a), l2: List(a)) -> Bool {
    let check_size = verifica_tam(l1, l2)

    case l1, l2, check_size {
        [], [], _ -> True
        [p1, ..r1], [p2, ..r2], True -> p1 == p2 && compar_lists(r1, r2)
        _, _, False -> False
        [p1, ..r1], [], True -> False
        [], [p2, ..r2], True -> False
    }
}

pub fn verifica_tam(l1: List(a), l2: List(a)) -> Bool {
    let tam_l1 = list.length(l1)
    let tam_l2 = list.length(l2)

    tam_l1 == tam_l2
}

pub fn compar_lists_examples() {
    check.eq(compar_lists([1, 2, 3], [1, 3, 2]), False)
    check.eq(compar_lists([], []), True)
    check.eq(compar_lists([1, 2, 3], [1, 2, 3]), True)
    check.eq(compar_lists([1, 2, 3, 4], [1, 2, 3]), False)
    check.eq(compar_lists([5, 4, 3, 2, 1], [5, 4, 3, 3, 1]), False)
}