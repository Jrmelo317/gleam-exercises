import sgleam/check
import gleam/list
import gleam/float
import gleam/string
import gleam/int

/// Essa função deve receber uma lista de inteiros e nega-los, ou seja, se é positivo se torna
/// negativo, se é negativo se torna positivo. Para isso utiliza-se a função list.map.

pub fn lista_nega(lst: List(Int)) -> List(Int) {
    list.map(lst, fn (x) {x * -1})
}

pub fn lista_nega_examples() {
    check.eq(lista_nega([1, 2, 3]), [-1, -2, -3])
    check.eq(lista_nega([]), [])
    check.eq(lista_nega([1, -2, 3]), [-1, 2, -3])
    check.eq(lista_nega([1, 2, 3, 4, -5]), [-1, -2, -3, -4, 5])
}

/// Essa função recebe uma lista de floats e transforma todos os floats dessa lista em string,
/// retornando essa nova lista de strings. Para isso utiliza-se a função list.map.

pub fn lista_string(lst: List(Float)) -> List(String) {
    list.map(lst, float.to_string)
}

pub fn lista_string_examples() {
    check.eq(lista_string([1.0, 2.0]), ["1.0", "2.0"])
    check.eq(lista_string([]), [])
    check.eq(lista_string([1.0, 3.0, 5.0]), ["1.0", "3.0", "5.0"])
    check.eq(lista_string([1.00, 5.3240]), ["1.0", "5.324"])
}

/// Essa função recebe uma lista de Strings um prefixo, retorna apenas as strings dentro da
/// lista que possuírem o prefixo passado. Faz isso utilizando-se de list.filter.

pub fn comeca(lst: List(String), pre: String) -> List(String) {
    list.filter(lst, fn (x) {string.starts_with(x, pre)})
}

pub fn comeca_examples() {
    check.eq(comeca([], "a"), [])
    check.eq(comeca(["abc", "Paulo", "João"], "a"), ["abc"])
    check.eq(comeca(["abd", "abc", "abb"], "a"), ["abd", "abc", "abb"])
    check.eq(comeca(["abd", "abc", "abb"], "b"), [])
}

/// Essa função recebe uma lista de listas, e mantem dentro dessa lista apenas listas que tenham
/// uma tamanho x, passado como parâmetro. Para isso, utiliza-se a função list.filter.

pub fn list_size(lst: List(List(a)), x: Int) -> List(List(a)) {
    list.filter(lst, fn (a) {list.length(a) == x})
}

pub fn list_size_examples() {
    check.eq(list_size([["123", "12", "1"], ["1", "2", "3"], ["1"], ["1", "2"]], 3), [["123", "12", "1"], ["1", "2", "3"]])
    check.eq(list_size([[], [], []], 1), [])
    check.eq(list_size([[1, 2], [1, 2], [1, 2, 3]], 2), [[1, 2], [1, 2]])
}

/// Aqui vão duas funções de subtração em uma lista inteira, isto é, recebe-se uma lista
/// de Inteiros e se reduz a um único valor. A ideia principal é poder visualizar as diferenças
/// entre fold right e fold left

/// Função de subtrair uma lista completa utilizando-se fold right, ou seja, se subtrai da esqueda
/// para a direita, o primeiro par, depois o result com o terceiro elemento, ...

pub fn substrai_right(lst: List(Int)) -> Int {
    list.fold_right(lst, 0, fn (x, acc) { x - acc })
}

pub fn subtrai_right_examples() {
    check.eq(substrai_right([-1, 10, 5, -3]), -3)
    check.eq(substrai_right([10, 10, 10]), 10)
    check.eq(substrai_right([2, -2, 2, -2]), 8)
}
