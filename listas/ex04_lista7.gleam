import sgleam/check
import gleam/list


/// Para isso criaremos uma função auxiliar que, recebe um elemento e uma lista,
/// e retorna os pares daquele elemento com todos os elementos daquela lista.

pub fn even_list(x: a, list: List(a)) -> List(List(a)) {
    case list {
        [] -> []
        [first, ..rest] -> [[x, first], ..even_list(x, rest)] 
    }
}

pub fn even_list_examples() {
    check.eq(even_list("a", ["a", "b"]), [["a", "a"], ["a", "b"]])
    check.eq(even_list("a", []), [])
    check.eq(even_list(1, [2, 3, 4]), [[1, 2], [1, 3], [1, 4]])
}

/// Criaremos uma função que retorna todos os pares de duas listas em formato
/// de listas dentro de lista, com uma lista para cada par. Exemplo: [1] e [2, 3]
/// retornará [[1, 2], [1, 3]].

pub fn even_two_list(l1: List(a), l2: List(a)) -> List(List(a)) {
    case l1, l2 {
        [], [] -> [[]]
        [p1, ..r1], [_p2, .._r2] -> list.append(even_list(p1, l2), even_two_list(r1, l2))
        [], [_p2, .._r2] -> []
        [_p1, .._r1], [] -> [[]]
    }
}

pub fn even_two_list_exampels() {
    check.eq(even_two_list([1, 2], [3, 4]), [[1, 3], [1, 4], [2, 3], [2, 4]])
    check.eq(even_two_list([], []), [[]])
    check.eq(even_two_list([1, 2], []), [[]])
    check.eq(even_two_list([], [1, 2]), [[]])
    check.eq(even_two_list([10], [11, 12, 14]), [[10, 11], [10, 12], [10, 14]])
}