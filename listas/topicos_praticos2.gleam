import sgleam/check
import gleam/list

/// Essa lista busca treinar o processamento simultaneo

/// Essa função tem como objetivo unir duas listas em uma única lista,
/// a lista terá o tamanha de n sendo n o temanho da menor lista presente
/// no merge. Além disso, os elementos serão armazenados em pares de tuplas,
/// para assim as duas listas serem de dois tipos iguais. Além disso, os
/// elementos de tamanho x excedentes a n da maior lista não farão parte
/// dessa nova lista.

pub fn merge_listas(a: List(a), b: List(b)) -> List(#(a, b)) {
    case a, b {
        [], _ -> []
        _, [] -> []
        [f1, ..r1], [f2, ..r2] -> [#(f1, f2), ..merge_listas(r1, r2)]
    }
}

pub fn merge_listas_examples() {
    check.eq(merge_listas([], []), [])
    check.eq(merge_listas([1, 2, 3], []), [])
    check.eq(merge_listas([], ["a", "b"]), [])
    check.eq(merge_listas([1, 2], ["a", "b"]), [#(1, "a"), #(2, "b")])
    check.eq(merge_listas([1, 2, 3], ["a", "b"]), [#(1, "a"), #(2, "b")])
    check.eq(merge_listas([1, 2], ["a", "b", "c"]), [#(1, "a"), #(2, "b")])
}

/// Essa função verifica se uma lista é prefixa da outra, isto é, se a primeira
/// lista é igual o inicío da segunda lista.

pub fn is_preffix(preffix: List(a), suffix: List(a)) -> Bool {
    // Faz as verificações
    let tam_preffix = list.length(preffix)
    let tam_suffix = list.length(suffix)

    case tam_preffix, tam_suffix {
        _, _ if tam_preffix > tam_suffix -> False
        _, _ if tam_preffix == tam_suffix -> preffix == suffix
        _, _ -> is_preffix_back(preffix, suffix)
    }
}

pub fn is_preffix_back(preffix: List(a), suffix: List(a)) -> Bool {
    case preffix, suffix {
        [], _ -> True
        [f1, ..r1], [f2, ..r2] -> f1 == f2 && is_preffix_back(r1, r2)
        // Se caírmos nesse caso existe um erro, False para garantir
        _, _ -> False
    }
}

pub fn is_preffix_examples() {
    check.eq(is_preffix([], []), True)
    check.eq(is_preffix([], [1, 2, 3]), True)
    check.eq(is_preffix([1], [1, 2, 3]), True)
    check.eq(is_preffix([1, 2], [1, 2, 3]), True)
    check.eq(is_preffix([1, 2, 3], [1, 2, 3]), True)
    check.eq(is_preffix([1, 2, 3, 4], [1, 2, 3]), False)
    check.eq(is_preffix([2], [1, 2, 3]), False)
    check.eq(is_preffix([1, 3], [1, 2, 3]), False)
}

/// Essa função deve receber duas listas de números inteiros oredenados
/// e retornar apenas uma lista que contenha os números presentes em ambas
/// as listas. Fazemos isso através do processamento simultâneo.

pub fn concat_same_elements(l1: List(Int), l2: List(Int)) -> List(Int) {
    case l1, l2 {
        [f1, ..r1], [f2, ..r2] if f1 == f2 -> [f1, ..concat_same_elements(r1, r2)]
        [f1, ..r1], [f2, ..r2] if f1 > f2 -> concat_same_elements(l1, r2)
        [f1, ..r1], [f2, ..r2] if f2 > f1 -> concat_same_elements(r1, l2)
        _, _ -> []
    }
}

pub fn concat_same_elements_examples() {
    check.eq(concat_same_elements([], []), [])
    check.eq(concat_same_elements([1, 2, 3], []), [])
    check.eq(concat_same_elements([], [1, 2, 3]), [])
    check.eq(concat_same_elements([1, 2, 3], [1, 2, 3]), [1, 2, 3])
    check.eq(concat_same_elements([1, 3, 5], [2, 4, 6]), [])
    check.eq(concat_same_elements([1, 2, 3, 4, 5], [2, 4, 5, 6]), [2, 4, 5])
    check.eq(concat_same_elements([1, 2, 5, 8], [2, 3, 5, 7, 8, 9]), [2, 5, 8])
}