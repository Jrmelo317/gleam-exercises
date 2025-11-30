import sgleam/check
import gleam/list

/// O objetivo deste exercício é criar uma função que a partir de uma lista e uma recursão
/// ordena todos os valores da lista. Consideramos que se a lista é vazia ela já está ordenada,
/// se não selecionamos os números minímos da lista e geramos uma nova lista sem or números
/// minímos.

/// Essa função pega uma lista de valores não vazia e diz qual o número minímo nela.

pub fn list_min(lista: List(Int)) -> Int {
    let min = first(lista)
    list_min_back(lista, min)
}

/// Retorna o primeiro elemento de uma lista

pub fn first(lista: List(Int)) -> Int {
    case lista {
        [] -> -1
        [f, ..r] -> f
    }
}

pub fn first_examples() {
    check.eq(first([1, 2, 3]), 1)
    check.eq(first([]), -1)
}

pub fn list_min_back(lista: List(Int), min: Int) -> Int {
    case lista {
        [] -> min
        [f, ..r] if f < min -> list_min_back(r, f)
        [f, ..r] -> list_min_back(r, min) 
    }
}

pub fn list_min_examples() {
    check.eq(list_min([1, 2, 3, 4, 5, 6, 0, -1, 9]), -1)
    check.eq(list_min([1, 3, 5, 7, 9, 1, 2, 3, 4, -1, -1, 10, 4]), -1)
    check.eq(list_min([10, 4, 6, 8, 3, 3, 4, 5, 7]), 3)
}

/// Essa função pega todos os valores minímos de uma função

pub fn get_mins(lista: List(Int)) -> List(Int) {
    let min = list_min(lista)
    get_all_values(lista, min)
}

pub fn get_all_values(lista: List(Int), value: Int) -> List(Int) {
    case lista {
        [] -> []
        [f, ..r] if f == value -> [f, ..get_all_values(r, value)]
        [f, ..r] -> get_all_values(r, value) 
    }
}

pub fn get_mins_examples() {
    check.eq(get_mins([1, 1, 1, 2, 3, 4, 5, 1]), [1, 1, 1, 1])
    check.eq(get_mins([2, 3, 4, 5, 1, 3, 4, 5]), [1])
    check.eq(get_mins([3, 1, 3, 1, 3, 1, 3, 1]), [1, 1, 1, 1])
} 

pub fn ordena(lista: List(Int)) -> List(Int) {
    case lista {
        [] -> []
        [f, ..r] -> {
            let min = list_min(lista)
            let mins = get_mins(lista)
            let list_removs = remov_list(lista, min)
            list.append(mins, ordena(list_removs))
        }
    }
}

pub fn ordena_examples() {
    check.eq(ordena([3, 3, 4, 1, 2, 3]), [1, 2, 3, 3, 3, 4])
    check.eq(ordena([]), [])
    check.eq(ordena([1, 1, 1, 1, 1]), [1, 1, 1, 1, 1])
    check.eq(ordena([3, 4, 5, 1, 2, 8, 4, 2]), [1, 2, 2, 3, 4, 4, 5, 8])
}

/// Pega uma lista e remove todos os valores dessa lista que forem iguais a value,
/// este passado como parâmetro.

pub fn remov_list(lista: List(Int), value: Int) -> List(Int) {
    case lista {
        [] -> []
        [f, ..r] if f == value -> remov_list(r, value)
        [f, ..r] -> [f, ..remov_list(r, value)]
    }
}

pub fn remov_list_examples() {
    check.eq(remov_list([1, 1, 1, 1], 1), [])
    check.eq(remov_list([1, 1, 1, 1], 2), [1, 1, 1, 1])
    check.eq(remov_list([], 2), [])
}