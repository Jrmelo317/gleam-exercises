import sgleam/check
import gleam/list
import gleam/int

/// Precisamos verificar se 2/3 dos valores de uma lista de floats é maior do que
/// 90.0. Para isso, vamos criar uma função que conta em uma lista o total de 
/// valores maiores que 90.0, e dividir pelo total da lista. Assim teremos a 
/// porcentagem de notas maiores que 90.0, se essa porcentagem for maior ou igual a 
/// 0.66666, consideraremos que ele atingiu a Laurea Academica.

pub fn conta_elem_maior_nove(lista: List(Float)) -> Int {
    case lista {
        [] -> 0
        [primeiro, ..resto] if primeiro >=. 90.0 -> 1 + conta_elem_maior_nove(resto)
        [primeiro, ..resto] -> conta_elem_maior_nove(resto)
    }
}

pub fn conta_elem_maior_nove_examples() {
    check.eq(conta_elem_maior_nove([]), 0)
    check.eq(conta_elem_maior_nove([10.0, 20.0, 30.0]), 0)
    check.eq(conta_elem_maior_nove([90.0, 90.1, 89.9, 90.9]), 3)
}

/// Essa função é a que retorna se Laureou ou não, usando as notas. Usa a função
/// anterior para achar a quantidade de notas acima de 90.0, e ve quantos elementos
/// a lista tem, dividindo e achando a porcentagem.

pub fn laureo(lista: List(Float)) -> Bool {
    let total_acima = int.to_float(conta_elem_maior_nove(lista))
    let total = int.to_float(list.length(lista))

    let porcentage = total_acima /. total
    porcentage >=. 0.66666666
}

pub fn laureo_examples() {
    check.eq(laureo([90.0, 90.0, 10.0]), True)
    check.eq(laureo([00.0]), False)
    check.eq(laureo([90.0, 89.9, 10.0]), False)
    check.eq(laureo([90.0, 90.0, 10.0, 100.0]), True)
}