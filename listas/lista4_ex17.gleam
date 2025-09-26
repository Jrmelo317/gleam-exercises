import sgleam/check

/// Essa função deve receber o consumo em quilowatts de uma determinada residência
/// e calcular quanto a pessoa deve pagar na conta de luz, isso deve levar em conta
/// a quantidade de quilowatts, o valor por quilowatts, que aqui sera de 1 real, e
/// a bandeira atual de consumo.

pub type Bandeira {
    Verde
    Amarela
    Vermelha1
    Vermelha2
}

pub fn calcula_conta_luz(bandeira: Bandeira, consumo_quilowatts: Float) -> Float {
    case bandeira {
        Verde -> consumo_quilowatts *. 1.0
        Amarela -> consumo_quilowatts *. 1.0 +. {consumo_quilowatts *. 0.01874}
        Vermelha1 -> consumo_quilowatts *. 1.0 +. {consumo_quilowatts *. 0.03971}
        Vermelha2 -> consumo_quilowatts *. 1.0 +. {consumo_quilowatts *. 0.09492}
    }
}

pub fn calcula_conta_luz_examples() {
    let b1 = Verde
    let b2 = Amarela
    let b3 = Vermelha1
    let b4 = Vermelha2

    check.eq(calcula_conta_luz(b1, 100.0), 100.0)
    check.eq(calcula_conta_luz(b2, 100.0), 101.874)
    check.eq(calcula_conta_luz(b3, 100.0), 103.971)
    check.eq(calcula_conta_luz(b4, 100.0), 109.492)
}