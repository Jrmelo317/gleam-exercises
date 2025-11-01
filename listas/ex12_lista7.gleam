import sgleam/check

/// Essa função deve receber duas listas de livros e retornar quantos livros estão nas duas listas.
/// Cada lista não possui livros repetidos dentro de si própria.

pub fn quantity_same_books(l1: List(a), l2: List(a)) -> Int {
    case l1, l2 {
        [], [] -> 0
        [p1, ..r1], [p2, ..r2] -> {
            let result = find_key(p1, l2)

            case result {
                True -> 1 + quantity_same_books(r1, l2)
                False -> quantity_same_books(r1, l2)
            }
        }
        [p1, ..r1], [] -> 0
        [], [p2, ..r2] -> 0
    }
}

/// Essa função deve receber um elemento e percorrer uma lista de elementos únicos, se achar retorna
/// True, se não, retorna False.

pub fn find_key(key: a, list: List(a)) -> Bool {
    case list {
        [first, ..rest] if first == key -> True
        [first, ..rest] -> find_key(key, rest)
        [] -> False
    }
}

pub fn quantity_same_books_examples() {
    check.eq(quantity_same_books([1, 2, 3, 4], [1, 2, 4, 5]), 3)
    check.eq(quantity_same_books([], []), 0)
    check.eq(quantity_same_books([1, 2, 3], []), 0)
    check.eq(quantity_same_books([], [1, 2, 3]), 0)
    check.eq(quantity_same_books([1, 2, 3], [1, 2, 3]), 3)
    check.eq(quantity_same_books([2, 3, 4], [1, 5, 6]), 0)
}