import sgleam/check


pub type Desempenho {
    Desempenho(pontos: Int, saldo: Int)
}

/// Essa função deve receber o desempenho atual de um time, que conta com quantos pontos
/// e saldo de gols o time esta, e a partir da quantidade de gols marcados e sofridos em
/// uma partida, atualizar o saldo de pontos.


pub fn atualiza_desempenho(d: Desempenho, pro: Int, contra: Int) -> Desempenho {
    let saldo_partida = pro - contra

    case saldo_partida {
        0 -> Desempenho(d.pontos + 1, d.saldo)
        _ -> case saldo_partida > 0 {
            True -> Desempenho(d.pontos + 3, d.saldo + saldo_partida)
            False -> Desempenho(d.pontos, d.saldo + saldo_partida)
        }
    }
}

pub fn atualiza_desempenho_examples() {
    let d1 = Desempenho(0, 0)

    check.eq(atualiza_desempenho(d1, 1, 0), Desempenho(3, 1))
    check.eq(atualiza_desempenho(d1, 0, 0), Desempenho(1, 0))
    check.eq(atualiza_desempenho(d1, 0, 3), Desempenho(0, -3))
}