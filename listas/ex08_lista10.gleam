import sgleam/check
import gleam/list

/// Essa sistema deve processar quantas vezes uma lista de inteiros, com número positivos e
/// negativos passa pelo 0, a cada vez que passa pelo zero de modo que está diminuindo a quantidade
/// deve-se somar 10 ao resultado, e retorna este resultado.

/// O Plano nesse caso será fazer uma recursão padrão, de modo que retornamos mais 10 sempre que
/// o valor passa por 0 se tornando negativo.

pub fn management_charity(lista: List(Int)) -> Int {
    // #(o, o False) -> Tupla que indica 1- a soma atual dos valores 2- Quantas vezes desceu para 0 3-Se já estava em 0
    let resultado = list.fold(lista, #(0, 0, False), fn(acc, x) {
        let #(sum, accumulator, was_negative) = acc
        let new_sum = sum + x

        case new_sum < 0, was_negative {
            True, False -> #(new_sum, accumulator + 10, True)
            True, True -> #(new_sum, accumulator, True)
            False, _ -> #(new_sum, accumulator, False)
        }
    })

    let #(_, result, _) = resultado
    result
}

pub fn management_charity_examples() {
    // Não passa pelo zero: resultado deve ser 0
    check.eq(management_charity([1, 2, 3]), 0)
    // Passa do positivo para o negativo uma vez: resultado deve ser 10
    check.eq(management_charity([2, 1, 0, -4]), 10)
    // Passa do positivo para o negativo duas vezes: resultado deve ser 20
    check.eq(management_charity([5, 2, 0, -8, 9, 0, -10]), 20)
    // Começa negativo: não conta, resultado deve ser 0
    check.eq(management_charity([-1, -2, -3]), 10)
    // Passa do positivo para o negativo, depois volta para positivo e passa de novo: resultado deve ser 20
    check.eq(management_charity([3, 1, 0, -2, -3, 0, -1]), 10)
    // Lista vazia: resultado deve ser 0
    check.eq(management_charity([]), 0)
}