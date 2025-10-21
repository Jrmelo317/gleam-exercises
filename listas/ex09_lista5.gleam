import sgleam/check

/// Essa função deve pegar uma lista de strings, e reomver desta lista de strings
/// as strings vazia, sendo uma string vazia do formato "". Para isso usa recursividade.

pub fn remove_string_vazia_lista(lista: List(String)) -> List(String) {
    case lista {
        [] -> []
        [primeiro, ..resto] if primeiro == "" -> remove_string_vazia_lista(resto)
        [primeiro, .. resto] -> [primeiro, ..remove_string_vazia_lista(resto)]
    }
}

pub fn remove_string_vazia_lista_examples() {
    check.eq(remove_string_vazia_lista(["a", "b", "c"]), ["a", "b", "c"])
    check.eq(remove_string_vazia_lista([]), [])
    check.eq(remove_string_vazia_lista(["", "a"]), ["a"])
    check.eq(remove_string_vazia_lista(["a", ""]), ["a"])
    check.eq(remove_string_vazia_lista(["a", "", "c"]), ["a", "c"])
}