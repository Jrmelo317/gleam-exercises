import sgleam/check

pub type Espectador {
    Crianca
    Jovem(carteirinha: Int)
    Adulto
    Idoso
}

/// Essa função verifica se um determinado espectador possui carteirinha,
/// se possui retorna o número dela, se não possui retorna 0

pub fn verifica_carteirinha_estudante(espectador: Espectador) -> Int {
    case espectador {
        Jovem(carteirinha) -> carteirinha
        _ -> 0
    }
}

pub fn verifica_carteirinha_estudante_examples() {
    let espec1 = Crianca
    let espec2 = Jovem(1234)
    let espec3 = Adulto
    let espec4 = Idoso

    check.eq(verifica_carteirinha_estudante(espec1), 0)
    check.eq(verifica_carteirinha_estudante(espec2), 1234)
    check.eq(verifica_carteirinha_estudante(espec3), 0)
    check.eq(verifica_carteirinha_estudante(espec4), 0)
}

/// Essa função deve verificar se um determinado espectador possui direito a desconto.
/// Adultos nunca tem desconto, crianças e idosos sempre tem desconto e jovens só tem desconto
/// se possuírem carteirinha, ou seja, diferente de 0

pub fn verifica_desconto(espec: Espectador) -> Bool {
    case espec {
        Crianca -> True
        Idoso -> True
        Adulto -> False
        Jovem(carteirinha) -> carteirinha != 0
    }
}

pub fn verifica_desconto_examples() {
    let espec1 = Crianca
    let espec2 = Jovem(1234)
    let espec3 = Adulto
    let espec4 = Idoso
    let espec5 = Jovem(0)

    check.eq(verifica_desconto(espec1), True)
    check.eq(verifica_desconto(espec2), True)
    check.eq(verifica_desconto(espec3), False)
    check.eq(verifica_desconto(espec4), True)
    check.eq(verifica_desconto(espec5), False)
}