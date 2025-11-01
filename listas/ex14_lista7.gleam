import sgleam/check

/// Essa função deve receber duas listas de números inteiros, deve juntar as duas listas
/// de modo que mantenha a lista em ordem decrescente. Para está função funcionar, as
/// duas listas que ela receber precisam estar previamente ordenadas.

pub fn join_list(l1: List(Int), l2: List(Int)) -> List(Int) {
    case l1, l2 {
        [], [] -> []
        [f1, ..r1], [f2, ..r2] if f1 >= f2 -> [f1, ..join_list(r1, l2)]
        [f1, ..r1], [f2, ..r2] -> [f2, ..join_list(l1, r2)]
        [f1, ..r1], [] -> [f1, ..join_list(r1, [])]
        [], [f2, ..r2] -> [f2, ..join_list([], r2)] 
    }
}

pub fn join_list_examples() {
    check.eq(join_list([], []), [])
    check.eq(join_list([4, 3, 2, 1], [8, 7, 6, 5, 4, 3]), [8, 7, 6, 5, 4, 4, 3, 3, 2, 1])
    check.eq(join_list([], [5, 3, 1]), [5, 3, 1])
    check.eq(join_list([5, 3, 1], []), [5, 3, 1])
    check.eq(join_list([8, 6, 4, 2], [7, 5, 3, 1]), [8, 7, 6, 5, 4, 3, 2, 1])
}