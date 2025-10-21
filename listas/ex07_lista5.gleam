import sgleam/check

/// Essa função deve contar quantos elementos tem uma lista, sendo que a lista pode ser de qualquer
/// tipo. Para isso usa recursividade.

pub fn conta_elementos(lista: List(a)) -> Int {
    case lista {
        [] -> 0
        [primeiro, .. resto] -> 1 + conta_elementos(resto)
    }
}

pub fn conta_elementos_examples() {
    check.eq(conta_elementos([]), 0)
    check.eq(conta_elementos([1, 2, 3, 4]), 4)
    check.eq(conta_elementos(["a", "b", "c"]), 3)
    check.eq(conta_elementos([1.0, 3.0, 7.0]), 3)
}