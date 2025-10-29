import sgleam/check

/// Essa função deve receber um natural N e retornar o produto
/// dos números de n a 1. Exemplos: n = 5, 5 * 4 * 3 * 2 * 1 = 120

pub fn product_till_zero(n: Int) -> Int {
    case n {
        _ if n == 0 -> 1
        _ -> n * product_till_zero(n - 1)
    }
}

pub fn product_till_zero_examples() {
    check.eq(product_till_zero(0), 1)
    check.eq(product_till_zero(1), 1)
    check.eq(product_till_zero(2), 2)
    check.eq(product_till_zero(3), 6)
    check.eq(product_till_zero(4), 24)
    check.eq(product_till_zero(5), 120)
    check.eq(product_till_zero(6), 720)
}