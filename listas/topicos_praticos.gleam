import sgleam/check
import gleam/int

/// Primeiro Exercício
/// Esse é um tipo árvore que defini o que é uma árvore

pub type Arvore(a) {
    Vazio
    No(value: a, dir: Arvore(a), esq: Arvore(a))
}

/// Essa função deve processar o uma árvore de modo que some os valores
/// de todos os seus nós, sendo que presumimos que seus nós armazenam
/// valores inteiros. Fazemos isso usando um processamento in-ordem, 
/// ou seja, verificamos esquerda, depois o Nó, depois a direita.

pub fn soma_arv(arv: Arvore(Int)) -> Int {
    case arv {
        Vazio -> 0
        No(value, dir, esq) -> soma_arv(esq) + value + soma_arv(dir)
    }
}

pub fn soma_arv_examples() {
    check.eq(soma_arv(Vazio), 0)
    check.eq(soma_arv(No(5, Vazio, Vazio)), 5)
    check.eq(soma_arv(No(10, No(5, Vazio, Vazio), No(15, Vazio, Vazio))), 30)
    check.eq(soma_arv(No(1, No(2, No(3, Vazio, Vazio), Vazio), Vazio)), 6)
    check.eq(soma_arv(No(8, No(3, No(1, Vazio, Vazio), No(6, Vazio, Vazio)), No(10, Vazio, No(14, Vazio, Vazio)))), 42)
}

/// Segundo Exercício
/// Essa função tem como objetico achar a altura de uma árvore, para 
/// fazer isso precisamos achar a altura máxima entre direita e esquerda
/// da árvore. Para isso devermos considerar apenas um nó na árvore
/// como a altura 0.

pub fn altura(arv: Arvore(a)) -> Int {
    case arv {
        Vazio -> -1
        No(value, dir, esq) -> 1 + int.max(altura(dir), altura(esq))
    }
}

pub fn altura_examples() {
    check.eq(altura(Vazio), -1)
    check.eq(altura(No(5, Vazio, Vazio)), 0)
    check.eq(altura(No(10, No(5, Vazio, Vazio), Vazio)), 1)
    check.eq(altura(No(10, No(5, Vazio, Vazio), No(15, Vazio, Vazio))), 1)
    check.eq(altura(No(8, No(3, No(1, Vazio, Vazio), No(6, Vazio, Vazio)), No(10, Vazio, No(14, Vazio, Vazio)))), 2)
}