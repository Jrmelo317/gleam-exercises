import sgleam/check
import gleam/list
import gleam/string
import gleam/int

/// Essa função deve utilizar fold para processar valores de uma lista, faz isso utilizando acumuladores
/// de modo a mitigar os processamentos. O retorno deve ser a soma de todos os valores da lista.

pub fn relativa_absoluta(lista: List(Int)) -> Int {
    list.fold(lista, 0, fn(acc, x) {acc + x})
}

pub fn relativa_absoluta_examples() {
    check.eq(relativa_absoluta([1, 2, 3, 4, 5]), 15)
    check.eq(relativa_absoluta([]), 0)
    check.eq(relativa_absoluta([30, -30, -60]), -60)
    check.eq(relativa_absoluta([-10, -10, -10, -10]), -40)
    check.eq(relativa_absoluta([30, 40, 30]), 100)
}

/// Essa função serve para achar a amplitude máxima de ua lista de números, para isso utiliza fold

pub fn max_amplitude(lista: List(Int)) -> Int {
    let max = list.fold(lista, -10000000, fn(acc, x) {
        case x > acc {
            True -> x
            False -> acc
    }})

    let min = list.fold(lista, 10000000, fn(acc, x) {
        case x < acc {
            True -> x
            False -> acc
        }
    })

    max - min
}

pub fn max_amplitude_examples() {
    check.eq(max_amplitude([1, 2, 3, 4, 5]), 4)
    check.eq(max_amplitude([]), -20000000)
    check.eq(max_amplitude([10, 20, 30, 100, 1000]), 990)
}

/// Essa função deve receber uma lista de Strings e calcular o tamanho médio delas, para isso
/// ela irá usar a função fold

pub fn avarage_size(lista: List(String)) -> Float {
    let sum = list.fold(lista, 0, fn(acc, x) {acc + string.length(x)})
    let quantity_values = list.fold(lista, 0, fn(acc, x) {acc + 1})

    int.to_float(sum) /. int.to_float(quantity_values)
}

pub fn avarage_size_examples() {
    check.eq(avarage_size(["Joao", "Paulo"]), 4.5)
    check.eq(avarage_size(["AAA", "AAA", "AAA"]), 3.0)
    check.eq(avarage_size([]), 0.0)
}