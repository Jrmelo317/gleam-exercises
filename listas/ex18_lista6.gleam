import sgleam/check

/// Essa função busca um elemento em uma árvore binária de busca, desta forma parte do presuposto
/// que já esta sendo usado em uma árvore binária de busca.

pub type Arvore(a) {
    Vazia
    No(val: a, esq: Arvore(a), dir: Arvore(a))
}

pub fn busca_elem(arv: Arvore(Int), elem: Int) -> Bool {
    case arv {
        Vazia -> False
        No(val, esq, dir) if val > elem -> busca_elem(esq, elem)
        No(val, esq, dir) if val < elem -> busca_elem(dir, elem)
        _ -> True
    }
}

pub fn busca_elem_examples() {
    check.eq(busca_elem(No(1, Vazia, Vazia), 1), True)
    check.eq(busca_elem(No(1, Vazia, Vazia), 0), False)
    check.eq(busca_elem(No(1, No(-1, Vazia, Vazia), Vazia), -1), True)
    check.eq(busca_elem(No(1, No(-1, Vazia, Vazia), No(2, Vazia, Vazia)), 2), True)
    check.eq(busca_elem(No(1, No(-2, No(-4, Vazia, Vazia), No(-1, Vazia, Vazia)), Vazia), -1), True)
}