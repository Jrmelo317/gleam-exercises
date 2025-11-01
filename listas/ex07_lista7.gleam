import sgleam/check

/// Essa função deve verificar se uma lista tem mais elementos que outra. Para isso recebe como parâmtro
/// duas listas, se a primeira tiver mais elementos retorna True, se não, retorna False. Faz isso sem
/// utilizar de operações aritméticas.

pub fn fisrt_longer_second(l1: List(a), l2: List(b)) -> Bool {
    case l1, l2 {
        [], [] -> False
        [p1, ..r1], [p2, ..r2] -> True && fisrt_longer_second(r1, r2)
        [p1, ..r1], [] -> True
        [], [p2, ..r2] -> False
    }
}

pub fn fisrt_longer_second_examples() {
    check.eq(fisrt_longer_second([], []), False)
    check.eq(fisrt_longer_second([1, 2, 3], [1, 2, 3]), False)
    check.eq(fisrt_longer_second([1, 2, 3, 4], [1, 2, 3]), True)
}