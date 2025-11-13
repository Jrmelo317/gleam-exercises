import sgleam/check

/// Essa função serve para processar um valor natural, mas para isso assumiremos que ela
/// irá receber apenas valores naturais. Ela deve receber n, caso base e uma função. N é
/// o valor sobre qual estamos operando, caso base é o valor que a função deve retornar 
/// se n = 0, ou seja, o caso base de um processo recursivo com números naturais, e função
/// é o processamento que deve ser aplicado a n caso não caia no caso base.

pub fn reduces_num(n: Int, base_case: a, f: fn (Int, a) -> a) -> a {
    case n {
        0 -> base_case
        _ -> f(n, reduces_num(n - 1, base_case, f))
    }
}

pub fn reduces_num_examples() {
    check.eq(reduces_num(4, 1, fn(acc, i) {i * acc}), 24)
    check.eq(reduces_num(5, 0, fn(acc, i) {acc - i}), 3)
    check.eq(reduces_num(5, 0, fn(acc, i) {acc + i}), 15)
}