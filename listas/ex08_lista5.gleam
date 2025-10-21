import sgleam/check
import gleam/int

/// Essa função deve transformar uma lista de números em uma lista de string destes números.
/// Para isso, reitera sobre essa lista usando recursividade e em cada elemento aplica a função
/// to_string, da biblioteca int.

pub fn list_int_to_string(lista: List(Int)) -> List(String) {
    case lista {
        [] -> []
        [primeiro, ..resto] -> [int.to_string(primeiro), ..list_int_to_string(resto)]
    }
}

pub fn list_int_to_string_examples() {
    check.eq(list_int_to_string([]), [])
    check.eq(list_int_to_string([1, 2, 3]), ["1", "2", "3"])
}