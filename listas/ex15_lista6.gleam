import sgleam/check

/// Devemos verificar se uma árvore binária é considerada cheia. Uma árvore para ser considerada 
/// cheia deve possuir apenas nós de grau 0 e 2.

pub type Arvore(a) {
    Vazia
    No(valor: a, dir: Arvore(a), esq: Arvore(a))
}

pub fn arv_cheia(raiz: Arvore(a)) -> Bool {
    case raiz {
        No(_, Vazia, Vazia) -> True
        No(_, Vazia, _) -> False
        No(_, _, Vazia) -> False
        Vazia -> True
        No(_, dir, esq) -> True && arv_cheia(dir) && arv_cheia(esq)
    }
}

pub fn arv_cheia_examples() {
    check.eq(arv_cheia(No(1, Vazia, Vazia)), True)
    check.eq(arv_cheia(Vazia), True)
    check.eq(arv_cheia(No(1, No(1, Vazia, Vazia), Vazia)), False)
    check.eq(arv_cheia(No(1, Vazia, No(1, Vazia, Vazia))), False)
    check.eq(arv_cheia(No(1, No(1, Vazia, Vazia), No(1, Vazia, Vazia))), True)
}