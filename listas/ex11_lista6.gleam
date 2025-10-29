import sgleam/check

/// Essa função deve calcular a amplitude máxima de valores em uma lista,
/// para fazer isso, usa duas outras funções max e min, que encontram o maior e menor valor em
/// uma lista respectivamente. Funciona para números naturais

pub fn amplitude(lista: List(Int)) -> Result(Int, String) {
    let maior = maximo(lista)
    let menor = minimo(lista)

    case maior, menor {
        Ok(max), Ok(min) -> Ok(max - min)
        _, _ -> Error("Deu pau na máquina")
    }
}

pub fn amplitude_examples() {
    check.eq(amplitude([1, 2, 3, 4, 5]), Ok(4))
    check.eq(amplitude([1, 1]), Ok(0))
    check.eq(amplitude([1, 2, 3, 4, 9]), Ok(8))
    check.eq(amplitude([]), Error("Deu pau na máquina"))
}

///Implementação da função que encontra o valor máximo em uma lista

pub fn maximo(lista: List(Int)) -> Result(Int, String) {
    case lista {
        [] -> Error("Error: Lista sem elementos")
        [primeiro, ..resto] -> Ok(auxiliar_maior(primeiro, resto))
    }
}

/// Função que auxília a função que encontra o valor máximo de uma lista

pub fn auxiliar_maior(n: Int, lista: List(Int)) -> Int {
    case lista {
        [] -> n
        [primeiro, ..resto] if primeiro > n -> auxiliar_maior(primeiro, resto)
        [_primeiro, ..resto] -> auxiliar_maior(n, resto)
    }
}

pub fn maximo_examples() {
    check.eq(maximo([]), Error("Error: Lista sem elementos"))
    check.eq(maximo([1, 2, 3]), Ok(3))
    check.eq(maximo([3, 19, 10, 11]), Ok(19))
}

/// Implementação da função que econtra o valor minímo de uma lista

pub fn minimo(lista: List(Int)) -> Result(Int, String) {
    case lista {
        [] -> Error("Error: Lista sem elementos")
        [primeiro, ..resto] -> Ok(auxiliar_minimo(primeiro, resto))
    }
}

/// Implementação da função que auxília a função que encontra o valor minímo de uma lista

pub fn auxiliar_minimo(n: Int, lista: List(Int)) -> Int {
    case lista {
        [] -> n
        [primeiro, ..resto] if primeiro < n -> auxiliar_minimo(primeiro, resto)
        [_primeiro, ..resto] -> auxiliar_minimo(n, resto)
    }
}

pub fn minimo_examples() {
    check.eq(minimo([]), Error("Error: Lista sem elementos"))
    check.eq(minimo([1, -1, 0, 3, 4]), Ok(-1))
    check.eq(minimo([1, 2, 3, 0, 10, 9, 7]), Ok(0))
}