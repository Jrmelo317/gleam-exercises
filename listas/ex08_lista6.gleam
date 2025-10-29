import sgleam/check

/// Essa função deve receber uma número natural a e um número
/// netural n, e retornar um número natural que é a elevado a n.

pub fn elevado(a: Int, n: Int) -> Int {
    case n {
        _ if n == 0 -> 1
        _ -> a * elevado(a, n - 1)
    }
}

pub fn elevado_examples() {
    check.eq(elevado(3, 2), 9)
    check.eq(elevado(2, 4), 16)
    check.eq(elevado(10, 0), 1)
    check.eq(elevado(10, 1), 10)
    check.eq(elevado(3, 4), 81)
}