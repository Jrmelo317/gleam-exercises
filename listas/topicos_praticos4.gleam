import sgleam/check
import gleam/list

/// Essa função executa um fatorial usando um acc

pub fn fatorial_acc(val: Int) -> Int {
    fatorial_helper(val, 1)
}

pub fn fatorial_helper(val: Int, acc: Int) -> Int {
    case val {
        1 -> acc
        0 -> 1
        _ -> fatorial_helper(val - 1, acc * val)
    }
}

pub fn fatorial_acc_examples() {
    check.eq(fatorial_acc(1), 1)
    check.eq(fatorial_acc(2), 2)
    check.eq(fatorial_acc(3), 6)
    check.eq(fatorial_acc(4), 24)
    check.eq(fatorial_acc(5), 120)
}

/// Essa função tem como ideia resolver o problema das distâncias relativas ao 
/// pontos inicial, por exmplo f([1, 2, 3, 4]) -> [1, 3, 6, 10].

pub fn distancia_relativa(lista: List(Int)) -> List(Int) {
    distancia_helper(lista, 0)
}

pub fn distancia_helper(lista: List(Int), acc: Int) -> List(Int) {
    case lista {
        [] -> []
        [f, ..r] -> [f + acc, ..distancia_helper(r, f + acc)]
    }
}

pub fn distancia_relativa_examples() {
    check.eq(distancia_relativa([]), [])
    check.eq(distancia_relativa([5]), [5])
    check.eq(distancia_relativa([1, 2, 3, 4]), [1, 3, 6, 10])
    check.eq(distancia_relativa([10, 5, 5]), [10, 15, 20])
    check.eq(distancia_relativa([2, -1, 3, -2]), [2, 1, 4, 2])
}

/// Essa função inverte uma lista com gasto de O(n), usando fold para isso,
/// portanto usando um acc.

pub fn inverte_acc(lista: List(a)) -> List(a) {
    list.fold(lista, [], fn(acc, x) {
        [x, ..acc]
    })
}

pub fn inverte_acc_examples() {
    check.eq(inverte_acc([]), [])
    check.eq(inverte_acc([1]), [1])
    check.eq(inverte_acc([1, 2, 3]), [3, 2, 1])
    check.eq(inverte_acc([1, 2, 3, 4, 5]), [5, 4, 3, 2, 1])
    check.eq(inverte_acc(["a", "b", "c"]), ["c", "b", "a"])
}