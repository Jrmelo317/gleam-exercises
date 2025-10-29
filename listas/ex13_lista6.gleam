import sgleam/check

/// Essa função verifica se uma lista de inteiros possui mais valores positivos ou mais valores negativos.
/// Se possui mais valores positivos retorna True, se não retorna False. No caso de possuir o mesmo tanto, 
/// retorna um erro. Estaremos considerando zero nesse caso como um número nulo, logo zero não conta como
/// positivo nem como negativo.

pub fn mais_positivos(lista: List(Int)) -> Result(Bool, Nil) {
    let total_pos = conta_positivos(lista)
    let total_neg = conta_negativos(lista)

    case total_pos {
        _, if total_pos == total_neg -> Error(Nil)
        _, if total_pos > total_neg -> Ok(True)
        _, -> Ok(False)
    }
}

pub fn mais_positivos_examples() {
    check.eq(mais_positivos([1, 1, -1, -1]), Error(Nil))
    check.eq(mais_positivos([]), Error(Nil))
    check.eq(mais_positivos([1, -1, -1, -1]), Ok(False))
    check.eq(mais_positivos([1, 1, 1, -1]), Ok(True))
}

/// Conta a quantidade total de números positivos em uma lista de inteiros.

pub fn conta_positivos(lista: List(Int)) -> Int {
    case lista {
        [] -> 0
        [primeiro, ..resto] if primeiro > 0 -> 1 + conta_positivos(resto)
        [_primeiro, ..resto] -> conta_positivos(resto)
    }
}

pub fn conta_positivos_examples() {
    check.eq(conta_positivos([0, -1, -2, -3]), 0)
    check.eq(conta_positivos([]), 0)
    check.eq(conta_positivos([0, 1, -2, -3]), 1)
    check.eq(conta_positivos([0, 1, 2, -3]), 2)
    check.eq(conta_positivos([0, 1, 2, 3]), 3)
}

/// Conta a quantidade total de números negativos em uma lista de inteitos.

pub fn conta_negativos(lista: List(Int)) -> Int {
    case lista {
        [] -> 0
        [primeiro, ..resto] if primeiro < 0 -> 1 + conta_negativos(resto)
        [_primeiro, .. resto] -> conta_negativos(resto)
    }
}

pub fn conta_negativos_examples() {
    check.eq(conta_negativos([0, -1, -2, -3]), 3)
    check.eq(conta_negativos([]), 0)
    check.eq(conta_negativos([0, 1, -2, -3]), 2)
    check.eq(conta_negativos([0, 1, 2, -3]), 1)
    check.eq(conta_negativos([0, 1, 2, 3]), 0)
}