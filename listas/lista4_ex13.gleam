import sgleam/check
import gleam/float

/// Esse tipo união conta com as duas figuras geométricas presentes
/// neste determinado contexto.

pub type FiguraGeometrica {
    Circulo(raio: Float)
    Quadrado(altura: Float, largura: Float)
}

/// Essa função deve calcular a área de uma determinada figura geométrica,
/// para isso verifica qual a figura e usa seus campos de atributo aplciados
/// na formula.

pub fn calcula_area_forma(figura: FiguraGeometrica) -> Float {
    case figura {
        Circulo(raio) -> 3.14 *. {raio *. raio}
        Quadrado(altura, largura) -> altura *. largura
    }
}

pub fn calcula_area_forma_examples() {
    let circulo = Circulo(5.0)
    let quadrado = Quadrado(5.0, 5.0)

    check.eq(calcula_area_forma(circulo), 78.5)
    check.eq(calcula_area_forma(quadrado), 25.0)
}

/// Essa função deve verificar se uma forma geométrica cabe dentro da outra, para isso verifica se 
/// o diâmetro do círulo é menor que a menor dimensão do retângulo, e se a diagonal de um retângulo
/// é menor que o diÇametro de um círculo.

pub fn fits_in(fig1: FiguraGeometrica, fig2: FiguraGeometrica) -> Bool {
    case fig1,fig2 {
        Quadrado(altura, largura), Circulo(raio) -> {
            case float.square_root({altura *. altura} +. {largura *. largura}){
                Ok(val) -> val <.2.0 *. raio
                Error(_) -> False
            }
        }
        Circulo(raio), Quadrado(altura, largura) -> {
            case altura <. largura {
                True -> 2.0 *. raio <=. altura
                False -> 2.0 *. raio <=. largura
            }
        }
        _, _ -> False
    }
}

pub fn fits_in_examples() {
    let ret1 = Quadrado(16.0, 12.0)
    let c1 = Circulo(10.0)

    let ret2 = Quadrado(7.0, 6.0)
    let c2 = Circulo(5.0)

    let ret3 = Quadrado(15.0, 8.0)
    let c3 = Circulo(4.0)

    let ret4 = Quadrado(6.0, 6.0)
    let c4 = Circulo(2.5)

    let ret5 = Quadrado(15.0, 15.0)
    let c5 = Circulo(10.0)

    let ret6 = Quadrado(5.0, 9.0)
    let c6 = Circulo(9.0)

    let ret7 = Quadrado(15.0, 10.0)
    let c7 = Circulo(6.0)

    let ret8 = Quadrado(5.0, 5.0)
    let c8 = Circulo(3.0)

    check.eq(fits_in(ret1, c1), False)
    check.eq(fits_in(ret2, c2), True)
    check.eq(fits_in(c3, ret3), True)
    check.eq(fits_in(c4, ret4), True)

    check.eq(fits_in(ret5, c5), False)
    check.eq(fits_in(ret6, c6), True)
    check.eq(fits_in(c7, ret7), False)
    check.eq(fits_in(c8, ret8), False)
}
/// Verificar Testes, pois dois não passarão