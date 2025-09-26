import sgleam/check

pub type Direcao {
    Norte
    Sul
    Leste
    Oeste
}

/// Essa função recebe uma variável do tipo Direcao e retorna a Direcao oposta a ela

pub fn direcao_oposta(direcao: Direcao) -> Direcao {
    case direcao {
        Norte -> Sul
        Sul -> Norte
        Leste -> Oeste
        Oeste -> Leste
    }
}

pub fn direcao_oposta_examples() {
    check.eq(direcao_oposta(Norte), Sul)
    check.eq(direcao_oposta(Sul), Norte)
    check.eq(direcao_oposta(Leste), Oeste)
    check.eq(direcao_oposta(Oeste), Leste)
}

///Essa função recebe uma variável do tipo Direcao e retorna a Direcao que está a 90
/// graus no sentido horário da direcao recebida

pub fn noventa_graus_horario(direcao: Direcao) -> Direcao {
    case direcao {
        Norte -> Leste
        Leste -> Sul
        Sul -> Oeste
        Oeste -> Norte
    }
}

pub fn noventa_graus_horario_examples() {
    check.eq(noventa_graus_horario(Norte), Leste)
    check.eq(noventa_graus_horario(Leste), Sul)
    check.eq(noventa_graus_horario(Sul), Oeste)
    check.eq(noventa_graus_horario(Oeste), Norte)
}

///Essa função recebe uma variável do tipo Direcao e retorna a Direcao que está a 90
/// graus no sentido anti horário da direcao recebida, além disso, sua implementação 
/// foi realizada sem a utilização de estruturas de controle de fluxo

pub fn noventa_graus_anti_horario(direcao: Direcao) -> Direcao {
    noventa_graus_horario(direcao_oposta(direcao))
}

pub fn noventa_graus_anti_horario_examples() {
    check.eq(noventa_graus_anti_horario(Norte), Oeste)
    check.eq(noventa_graus_anti_horario(Leste), Norte)
    check.eq(noventa_graus_anti_horario(Sul), Leste)
    check.eq(noventa_graus_anti_horario(Oeste), Sul)
}

/// Nesta função são recebidas duas direções, a função deve retorar em graus o quanto
/// uma pessoa deve virar para no sentido da primeira para a segunda direção

pub fn distancia_graus(d1: Direcao, d2: Direcao) -> Int {
    case d1, d2 {
        Norte, Norte -> 0
        Norte, Leste -> 90
        Norte, Sul -> 180
        Norte, Oeste -> 270
        Leste, Leste -> 0
        Leste, Sul -> 90
        Leste, Oeste -> 180
        Leste, Norte -> 270
        Sul, Sul -> 0
        Sul, Oeste -> 90
        Sul, Norte -> 180
        Sul, Leste -> 270
        Oeste, Oeste -> 0
        Oeste, Norte -> 90
        Oeste, Leste -> 180
        Oeste, Sul -> 270
    }
}

pub fn distancia_graus_examples() {
    check.eq(distancia_graus(Norte, Norte), 0)
    check.eq(distancia_graus(Norte, Leste), 90)
    check.eq(distancia_graus(Norte, Sul), 180)
    check.eq(distancia_graus(Norte, Oeste), 270)
    check.eq(distancia_graus(Leste, Leste), 0)
    check.eq(distancia_graus(Leste, Sul), 90)
    check.eq(distancia_graus(Leste, Oeste), 180)
    check.eq(distancia_graus(Leste, Norte), 270)
    check.eq(distancia_graus(Sul, Sul), 0)
    check.eq(distancia_graus(Sul, Oeste), 90)
    check.eq(distancia_graus(Sul, Norte), 180)
    check.eq(distancia_graus(Sul, Leste), 270)
    check.eq(distancia_graus(Oeste, Oeste), 0)
    check.eq(distancia_graus(Oeste, Norte), 90)
    check.eq(distancia_graus(Oeste, Leste), 180)
    check.eq(distancia_graus(Oeste, Sul), 270)
}