import sgleam/check

/// Essa função deve receber uma lista de booleanos, e retorna se True
/// se todos os booleanos da lista forem True, se não, retorna False.
/// Faz isso usando recursividade, e não utiliza condicional.

pub fn list_all_true(lista: List(Bool)) -> Bool {
    case lista {
        [] -> True
        [primeiro, ..resto] -> primeiro && list_all_true(resto)
    }
}

pub fn list_all_true_examples() {
    check.eq(list_all_true([True, True, False]), False)
    check.eq(list_all_true([]), True)
    check.eq(list_all_true([True, True, True, True]), True)
}