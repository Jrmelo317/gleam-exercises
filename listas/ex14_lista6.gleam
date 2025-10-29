import sgleam/check
import gleam/int
import gleam/list

/// Tipo árvore

pub type Arvore(a) {
    Vazia
    No(valor: a, esq: Arvore(a), dir: Arvore(a))
}

/// Devemos calcular em uma árvore binária quantos nós possuem grau 2. Para isso
/// quebraremos o problema em partes. Faremos uma função prévia que, calcula a altura
/// de um nó na árvore. Outra função que usa a primeira para calcular a altura de todos
/// os nós de uma árvore e adiciona-los a uma lista. E uma terceira função, que essa 
/// sim ve quantos nós tem altura 2, avaliando pela lista.

/// Função que calcula a altura de um nó da árvore binária

pub fn altura(raiz: Arvore(a)) -> Int {
    case raiz {
        Vazia -> -1
        No(_, esq, dir) -> 1 + int.max(altura(esq), altura(dir))
    }
}

pub fn altura_examples() {
    check.eq(altura(No(1, Vazia, Vazia)), 0)
    check.eq(altura(No(1, No(1, Vazia, Vazia), Vazia)), 1)
    check.eq(altura(No(1, No(1, No(1, Vazia, Vazia), Vazia), Vazia)), 2)
    check.eq(altura(No(1, No(1, No(1, No(1, Vazia, Vazia), Vazia), Vazia), Vazia)), 3)
}

/// Função para calcular quantos nós em uma árvore possuem grau 2, para possuir grau dois, os dois nós
/// filhos precisam ser nós, se um deles é vazio não é de grau dois. Da mesma forma se for vazio,
/// também não é de grau 2.

pub fn quantidade_grau2(raiz: Arvore(a)) -> Int {
    case raiz {
        Vazia -> 0
        No(_, Vazia, dir) -> quantidade_grau2(dir)
        No(_, esq, Vazia) -> quantidade_grau2(esq)
        No(_, Vazia, Vazia) -> 0
        No(_, esq, dir) -> 1 + quantidade_grau2(esq) + quantidade_grau2(dir)
    }
}

pub fn quantidade_grau2_examples() {
    check.eq(quantidade_grau2(No(1, Vazia, Vazia)), 0)
    check.eq(quantidade_grau2(No(1, No(1, Vazia, Vazia), Vazia)), 0)
    check.eq(quantidade_grau2(No(1, Vazia, No(1, Vazia, Vazia))), 0)
    check.eq(quantidade_grau2(No(1, No(1, Vazia, Vazia), No(1, Vazia, Vazia))), 1)
    check.eq(quantidade_grau2(No(1, No(1, No(1, Vazia, Vazia), No(1, Vazia, Vazia)), No(1, Vazia, Vazia))), 2)
}