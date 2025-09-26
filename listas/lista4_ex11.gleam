import sgleam/check

pub type Situacao {
    Parado
    Subindo
    Descendo
}

/// Essa função assume que um elevador está parado em um andar, recebe o andar que está
/// parado e o andar em que foi solicitado e retorna a situação do elevador após a solicitação,
///  isto é, se vai subir ou descer

pub fn solicitacao(andar_atual: Int, andar_solicitado: Int) -> Situacao {
    case andar_atual == andar_solicitado {
        True -> Parado
        False -> case andar_atual > andar_solicitado {
            True -> Descendo
            False -> Subindo
        }
    }
}

pub fn solicitacao_examples() {
    check.eq(solicitacao(5, 5), Parado)
    check.eq(solicitacao(5, 10), Subindo)
    check.eq(solicitacao(10, 5), Descendo)
}

/// Essa função recebe dois estados, o estado em que o elevador está e o estado
/// em que o elevador deseja ficar. Um elevador só pode começar a se mover para
/// uma direção diferente se estiver parado.

pub fn troca_estado(e1: Situacao, e2: Situacao) -> Bool {
    case e1 == Parado || e2 == Parado || e1 == e2{
        True -> True
        False -> False
    }
}

pub fn troca_estado_examples() {
    check.eq(troca_estado(Parado, Parado), True)
    check.eq(troca_estado(Parado, Subindo), True)
    check.eq(troca_estado(Parado, Descendo), True)
    check.eq(troca_estado(Subindo, Parado), True)
    check.eq(troca_estado(Subindo, Subindo), True)
    check.eq(troca_estado(Subindo, Descendo), False)
    check.eq(troca_estado(Descendo, Parado), True)
    check.eq(troca_estado(Descendo, Subindo), False)
    check.eq(troca_estado(Descendo, Descendo), True)
}