import sgleam/check

/// Essa função deve receber as 4 notas de um aluno, e dizer a partir da média
/// aritmética dessas 4 notas se o aluno está aporvado ou reprovado. Aporvado
/// tem nota maior ou igual a 7. Exame para alunos com nota maior ou igual a 4 
/// e menor que 7. Reprovado para alunos com média menor que 4.

pub type Situacao {
    Aprovado
    Exame
    Reprovado
}

pub fn verifica_situacao(n1: Float, n2: Float, n3: Float, n4: Float) -> Situacao {
    let media = {n1 +. n2 +. n3 +. n4} /. 4.0
    case media >=. 7.0 {
        True -> Aprovado
        False -> case media >=. 4.0 {
            True -> Exame
            False -> Reprovado
        }
    } 
}

pub fn verifica_situacao_examples() {
    check.eq(verifica_situacao(7.0, 7.0, 7.0, 7.0), Aprovado)
    check.eq(verifica_situacao(7.5, 9.5, 10.0, 8.0), Aprovado)
    check.eq(verifica_situacao(5.0, 5.0, 5.0, 5.0), Exame)
    check.eq(verifica_situacao(4.0, 4.0, 4.0, 4.0), Exame)
    check.eq(verifica_situacao(3.8, 3.8, 4.0, 3.5), Reprovado)
}