import sgleam/check

/// Essas duas funções utilizam de recursão indireta, isto é, uma função chama a outra que por sua 
/// vez faz o mesmo, até chegarem em um dos dois casos base. Assim, se analisa se um número
/// natural n é par ou impar, retorna a depender da função chamada um booleano, indicando 
/// o resultado da operação.

pub fn par(n: Int) -> Bool {
    case n {
        _ if n == 0 -> True
        _ -> impar(n - 1)
    }
}

pub fn impar(n: Int) -> Bool {
    case n {
        _ if n == 0 -> False
        _ -> par(n - 1)
    }
}

pub fn par_impar_examples() {
    check.eq(par(10), True)
    check.eq(par(11), False)
    check.eq(par(12), True)
    check.eq(par(13), False)
    check.eq(par(14), True)
    check.eq(impar(10), False)
    check.eq(impar(11), True)
    check.eq(impar(12), False)
    check.eq(impar(13), True)
    check.eq(impar(14), False)
}