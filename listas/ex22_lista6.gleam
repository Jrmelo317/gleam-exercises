import sgleam/check
import gleam/int
import gleam/list

pub type Ponto {
    Ponto(x: Int, y: Int)
}

/// Para resolver o problema dos menor retângulo possível para cobrir uma série de pontos em um ponto cartesiano, devemos
/// levar a ideia de que. O retângulo precisa ter suas extremidades verticais na menor e maior posição possível em relação
/// a y, e em relação ao eixo horizontal a menor e maior posição possível em relação a x.

/// Função para pegar o maior x

pub fn bigger_x(lista: List(Ponto)) -> Int {
    case lista {
        [] -> -1000
        [primeiro, ..resto] -> int.max(primeiro.x, bigger_x(resto))
    }
}

pub fn bigger_x_examples() {
    check.eq(bigger_x([Ponto(1, 1), Ponto(0, 0), Ponto(2, 2)]), 2)
    check.eq(bigger_x([]), -1000)
    check.eq(bigger_x([Ponto(1, 1), Ponto(3, 0), Ponto(2, 2)]), 3)
}

/// Função para pegar o menor x

pub fn smallest_x(lista: List(Ponto)) -> Int {
    case lista {
        [] -> 1000
        [primeiro, ..resto] -> int.min(primeiro.x, smallest_x(resto))
    }
}

pub fn smallest_x_examples() {
    check.eq(smallest_x([Ponto(1, 1), Ponto(0, 0), Ponto(2, 2)]), 0)
    check.eq(smallest_x([]), 1000)
    check.eq(smallest_x([Ponto(1, 1), Ponto(3, 0), Ponto(2, 2)]), 1)
}

/// Função para pegar o maior y

pub fn bigger_y(lista: List(Ponto)) -> Int {
    case lista {
        [] -> -1000
        [primeiro, ..resto] -> int.max(primeiro.y, bigger_y(resto))
    }
}

pub fn bigger_y_examples() {
    check.eq(bigger_y([Ponto(1, 10), Ponto(0, 0), Ponto(50, 2)]), 10)
    check.eq(bigger_y([]), -1000)
    check.eq(bigger_y([Ponto(1, 1), Ponto(3, 0), Ponto(2, 2)]), 2)
}

/// Função para pegar o menor y

pub fn smallest_y(lista: List(Ponto)) -> Int {
    case lista {
        [] -> 1000
        [primeiro, ..resto] -> int.min(primeiro.y, smallest_y(resto))
    }
}

pub fn smallest_y_examples() {
    check.eq(smallest_y([Ponto(1, 1), Ponto(0, 0), Ponto(2, 2)]), 0)
    check.eq(smallest_y([]), 1000)
    check.eq(smallest_y([Ponto(1, 1), Ponto(3, 0), Ponto(2, 2)]), 0)
}

/// Função que retorna o tamanho dos limites do menor retângulo possível. Importante salientar que o retorno dessa função é
/// sempre uma lista que retorna o maior_x, o menor_x, o maior_y e o menor_y. Assim se é possível traçar as coordenadas das
/// retas e da extremidade do retêngulo.

pub fn smallest_retan(lista: List(Ponto)) -> Result(List(Int), Nil) {
    let tam_lista = list.length(lista)
    case lista {
        _ if tam_lista < 2 -> Error(Nil)
        _ -> {
            let menor_x = smallest_x(lista)
            let maior_x = bigger_x(lista)

            let menor_y = smallest_y(lista)
            let maior_y = bigger_y(lista)

            Ok([maior_x, menor_x, maior_y, menor_y])
        }
    }
}

pub fn smallest_retan_examples() {
    check.eq(smallest_retan([Ponto(1, 1), Ponto(2, 2), Ponto(1, -5), Ponto(2, 15)]), Ok([2, 1, 15, -5]))

    let pontos_vazios = []
    check.eq(smallest_retan(pontos_vazios), Error(Nil))

    let ponto_unico = [Ponto(5, 5)]
    check.eq(smallest_retan(ponto_unico), Error(Nil))

    let pontos_padrao = [Ponto(3, 4), Ponto(1, 8), Ponto(5, 2)]
    let esperado_padrao = Ok([5, 1, 8, 2])
    check.eq(smallest_retan(pontos_padrao), esperado_padrao)

    let pontos_negativos = [Ponto(-5, -10), Ponto(-1, 2), Ponto(-8, -3)]
    let esperado_negativo = Ok([-1, -8, 2, -10])
    check.eq(smallest_retan(pontos_negativos), esperado_negativo)
  
    let pontos_linha = [Ponto(1, 5), Ponto(10, 5), Ponto(-2, 5)]
    let esperado_linha = Ok([10, -2, 5, 5])
    check.eq(smallest_retan(pontos_linha), esperado_linha)

    let pontos_identicos = [Ponto(7, 7), Ponto(7, 7)]
    let esperado_identicos = Ok([7, 7, 7, 7])
    check.eq(smallest_retan(pontos_identicos), esperado_identicos)
}