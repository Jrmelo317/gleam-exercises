import sgleam/check

/// Essa função deve receber uma lista de strings e concatenar todos os seus elementos em uma única
/// String. Para fazer isso, tuiliza-se a recursividade, concatenando os elementos um a um, 
/// chamando a função novamente.

pub fn concatena_lista_string(lista: List(String)) -> String {
    case lista {
        [] -> ""
        [primeiro, ..resto] -> primeiro <> concatena_lista_string(resto)
    }
}

pub fn concatena_lista_string_examples() {
    check.eq(concatena_lista_string([]), "")
    check.eq(concatena_lista_string(["ab", "cd"]), "abcd")
    check.eq(concatena_lista_string(["p", "a", "r"]), "par")
    check.eq(concatena_lista_string(["im", "par"]), "impar")
}