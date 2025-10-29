import sgleam/check

pub type Voto {
    C1
    C2
    Branco
}

/// Para este problema devemos definir qual o candidato vencedor de uma eleição, para
/// isso ele precisa ter a maioria dos votos. Caso 50% ou mais dos votos sejam em
/// branco uma nova eleição é feita, o mesmo ocorre no caso de empate dos votos.

/// Função que conta o total de votos do primeiro candidato

pub fn count_whites(lista: List(Voto)) -> Int {
    case lista {
        [] -> 0
        [Branco, ..resto] -> 1 + count_whites(resto)
        [_, ..resto] -> count_whites(resto)
    }
}

/// Função que conta o total de votos do segundo candidato
 
pub fn count_c1(lista: List(Voto)) -> Int {
    case lista {
        [] -> 0
        [C1, ..resto] -> 1 + count_c1(resto)
        [_, ..resto] -> count_c1(resto)
    }
}

/// Função que conta o total de votos em branco

pub fn count_c2(lista: List(Voto)) -> Int {
    case lista {
        [] -> 0
        [C2, ..resto] -> 1 + count_c2(resto)
        [_, ..resto] -> count_c2(resto)
    }
}

/// Função de testes unitários para todos os tipos de count

pub fn count_examples() {
    check.eq(count_whites([]), 0)
    check.eq(count_whites([C1, C1, C2, C2, C1, C2]), 0)
    check.eq(count_whites([Branco, C1, Branco, Branco, C2]), 3)

    check.eq(count_c1([]), 0)
    check.eq(count_c1([C1, C1, C2, C2, C1, C2]), 3)
    check.eq(count_c1([Branco, C2, Branco, Branco, C2]), 0)

    check.eq(count_c2([]), 0)
    check.eq(count_c2([C1, C1, C2, C2, C1, C2]), 3)
    check.eq(count_c2([Branco, C1, Branco, Branco, C1]), 0)
}

/// Função que processa o resultado da eleição. Retorna Ok se tivessos um campeão,
/// e error caso seja necessário refazer a eleição.

pub fn eletion(lista: List(Voto)) -> Result(Voto, Nil) {
    let brancos = count_whites(lista)
    let c1 = count_c1(lista)
    let c2 = count_c2(lista)

    case brancos, c1, c2 {
        _, c1, c2 if c1 == c2 -> Error(Nil)
        b, c1, c2 if b >= c1 + c2 -> Error(Nil)
        _, c1, c2 if c1 > c2 -> Ok(C1)
        _, c1, c2 if c2 > c1 -> Ok(C2)
        _, _, _ -> Error(Nil)
    }
}

pub fn eletion_examples() {
    check.eq(eletion([C1, C1, C2, C2]), Error(Nil))
    check.eq(eletion([]), Error(Nil))
    check.eq(eletion([C1, C1, C2, C2, Branco, Branco, Branco, Branco]), Error(Nil))
    check.eq(eletion([C1, C1, C2]), Ok(C1))
    check.eq(eletion([C2, C1, C2]), Ok(C2))
}