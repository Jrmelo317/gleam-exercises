import sgleam/check

/// Essa função deve determinar quantos acertos um candidato teve em uma prova de vestibular. A 
/// função recebe um gabarito e respostas, sendo ambos listas. Para cada resposta correta o candidato
/// soma um ponto. Exexmplo f([1, 2, 3], [2, 2, 3]) deve retornar 2.

pub fn same_value(answers: List(a), checks: List(a)) -> Int {
    case answers, checks {
        [], [] -> 0
        [answer, ..rest_a], [check, ..rest_c] if answer == check -> 1 + same_value(rest_a, rest_c)
        [answer, ..rest_a], [check, ..rest_c] -> same_value(rest_a, rest_c)
        [], [check, ..rest_c] -> 0
        [answer, ..rest_a], [] -> 0
    }
}

pub fn same_value_examples() {
    check.eq(same_value([], []), 0)
    check.eq(same_value([1, 2, 3], [1, 2, 3]), 3)
    check.eq(same_value([2, 2, 3], [1, 2, 3]), 2)
    check.eq(same_value([1, 2, 3], [4, 5]), 0)
    check.eq(same_value([2, 3, 4], [5, 5, 5, 5, 3, 4, 3]), 0)
}