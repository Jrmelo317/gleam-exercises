import sgleam/check

pub type Jogada {
    Pedra
    Papel
    Tesoura
}

/// Essa função deve receber dois nomes, sendo cada nome seguido de uma jogada e, 
/// seguindo as regras do jogo jokenpo, retornar o nome do vencedor

pub fn jokenpo(n1: String, j1: Jogada, n2: String, j2: Jogada) -> String {
    case j1 == j2 {
        True -> "Empate"
        False -> case j1, j2 {
            Pedra, Tesoura -> n1
            Tesoura, Papel -> n1
            Papel, Pedra -> n1
            _, _ -> n2
        }
    }
}

pub fn jokenpo_examples() {
    let pedra = Pedra
    let papel = Papel
    let tesoura = Tesoura

    let n1 = "Joaozinho"
    let n2 = "Pedrinho"

    check.eq(jokenpo(n1, pedra, n2, pedra), "Empate")
    check.eq(jokenpo(n1, papel, n2, papel), "Empate")
    check.eq(jokenpo(n1, tesoura, n2, tesoura), "Empate")
    check.eq(jokenpo(n1,pedra, n2, tesoura), "Joaozinho")
    check.eq(jokenpo(n1,tesoura, n2, papel), "Joaozinho")
    check.eq(jokenpo(n1,papel, n2, pedra), "Joaozinho")
    check.eq(jokenpo(n1,pedra, n2, papel), "Pedrinho")
}