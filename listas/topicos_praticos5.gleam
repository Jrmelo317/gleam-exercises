import sgleam/check
import gleam/list

/// Implementação da função range que recebe um início e um fim e cria uma lista
/// de números que vai do início até o fim. Faz isso utilizando a recursão generativa.

pub fn range(start: Int, end: Int) -> List(Int) {
    case start, end {
        _, _ if start == end -> []
        _, _ -> [start, ..range(start + 1, end)]
    }
}

pub fn range_examples() {
    check.eq(range(1, 1), [])
    check.eq(range(1, 2), [1])
    check.eq(range(1, 5), [1, 2, 3, 4])
    check.eq(range(0, 10), [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    check.eq(range(5, 8), [5, 6, 7])
}

/// Essa função quebra uma lista de elementos em sub-grupos com n elementos, 
/// para isso vai quebrando a lsita. Quando a lista não tem um tamanha múltiplo
/// de n, ela a última sub-lista terá menos elementos que n, que serão os restan
/// tes. Faz isso usando recursão generativa.

pub fn agrupa(lista: List(a), n: Int) -> List(List(a)) {
    case lista {
        [] -> []
        _ -> {
            let #(new, rest) = list.split(lista, n)
            [new, ..agrupa(rest, n)]
        }
    }
}

pub fn agrupa_examples() {
    check.eq(agrupa([], 2), [])
    check.eq(agrupa([1, 2, 3, 4], 2), [[1, 2], [3, 4]])
    check.eq(agrupa([1, 2, 3, 4, 5], 2), [[1, 2], [3, 4], [5]])
    check.eq(agrupa([1, 2, 3, 4, 5, 6], 3), [[1, 2, 3], [4, 5, 6]])
    check.eq(agrupa(["a", "b", "c", "d", "e"], 3), [["a", "b", "c"], ["d", "e"]])
}

/// Nesse caso faremos o algoritmo quicksort em gleam usando uma recursão gene-
/// rativa.

pub fn quick_sort(lista: List(Int)) -> List(Int) {
    case lista {
        [] -> []
        [x] -> [x]
        [pivo, ..r] -> {
            let maiores = list.filter(r, fn(x) {x >= pivo})
            let menores = list.filter(r, fn(x) {x < pivo})
            list.append(quick_sort(menores), [pivo, ..quick_sort(maiores)])
        }
    }
}

pub fn quick_sort_examples() {
    check.eq(quick_sort([]), [])
    check.eq(quick_sort([5]), [5])
    check.eq(quick_sort([3, 1, 2]), [1, 2, 3])
    check.eq(quick_sort([5, 2, 8, 1, 9]), [1, 2, 5, 8, 9])
    check.eq(quick_sort([10, 7, 8, 9, 1, 5]), [1, 5, 7, 8, 9, 10])
    check.eq(quick_sort([3, 3, 1, 2, 3]), [1, 2, 3, 3, 3])
}