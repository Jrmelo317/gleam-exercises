import sgleam/check

/// Nesse exercício mais do que verificar se uma lista está contida em outra lista, 
/// verificamos se duas listas estão contidas uma na outra. 

/// Essa função processa se uma lista está contida em outra lista.

pub fn verifica_lista(l1: List(a), l2: List(a)) -> Bool {
    case l1, l2 {
        [], [] -> True
        [], [_p2, .._r2] -> True
        [_p1, .._r1], [] -> False
        [p1, ..r1], [_p2, .._r2] -> contem(p1, l2) && verifica_lista(r1, l2)
    }
}

/// Essa verifica se uma lista está contida dentro de outra lista e vice-versa. 
/// Isso é considerado se eles possuem o mesmo conjunto de elementos, mas não
/// necessariamente a mesma quantidade de cada um.

pub fn verifica_duas_listas(l1: List(a), l2: List(a)) -> Bool {
    let verifica1 = verifica_lista(l1, l2)
    let verifica2 = verifica_lista(l2, l1)

    verifica1 && verifica2
}

/// Essa função verifica se um elemento está contido em uma lista.

pub fn contem(x: a, l: List(a)) -> Bool {
    case l {
        [] -> False
        [p1, .._r1] if p1 == x -> True 
        [_p1, ..r1] -> contem(x, r1)
    }
}

pub fn verifica_duas_listas_examples() {
    check.eq(verifica_duas_listas([], []), True)
    check.eq(verifica_duas_listas([1, 2, 3], [3, 2, 1]), True)
    check.eq(verifica_duas_listas([1, 2, 3], [3, 3, 4, 5, 1, 2]), False)
    check.eq(verifica_duas_listas([1, 2, 3, 4, 5, 6, 7], [5, 4, 1, 2, 3, 6]), False)
    check.eq(verifica_duas_listas([1, 2, 3, 4, 5], [5, 4, 1, 2, 3]), True)
}