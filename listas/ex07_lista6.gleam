import sgleam/check

/// Essa função recebe como parâmetro um número natural n e um valor v,
/// sendo estes dois inteiros. Retorna uma lista de Int com n repetições do
/// valor v.


pub fn cria_lista(quantidade: Int, valor: Int) -> List(Int) {
    case quantidade {
        _ if quantidade == 0 -> []
        _ -> [valor, ..cria_lista(quantidade - 1, valor)]
    }
}

pub fn cria_lista_examples() {
    check.eq(cria_lista(3, 5), [5, 5, 5])
    check.eq(cria_lista(0, 10), [])
    check.eq(cria_lista(5, 5), [5, 5, 5, 5, 5])
}