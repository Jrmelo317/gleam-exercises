import sgleam/check
import gleam/string
import gleam/int

/// Para fazer este projeto precisamos de uma função que acha o maior tamanho
/// de string de uma lista de strings.
/// 
/// Depois, para cada elemento da lista que não tiver o tamanho desejado, ou seja,
/// o tamanho máximo, acrescentamos caracteres vazios no final. Para isso criamos uma lista
/// de adiciona caracteres, que recebe a quantida de caracteres a se acrescentar e faz isso.
/// 
/// Assim podemos ter uma lista de nomes com quantidade total igual de caracteres.

/// Essa função é a responsável por achar o maior tamanho de um elemento em uma lista
/// de strings.

pub fn bigger_len(list: List(String)) -> Int {
    case list {
        [] -> 0
        [primeiro, ..resto] -> int.max(string.length(primeiro), bigger_len(resto))
    }
}

pub fn bigger_len_examples() {
    check.eq(bigger_len(["", "", ""]), 0)
    check.eq(bigger_len(["Joao", "Pao", "Pedro"]), 5)
    check.eq(bigger_len(["Pedro", "Joao", "Joao"]), 5)
    check.eq(bigger_len(["Joao", "Pedro", "Joao", "Pedro"]), 5)
}

/// Essa é a função que adiciona strings com um espaço ao final de uma palavra,
/// faz isso através de um número que ela recebe.

pub fn add_empty(word: String, num: Int) -> String {
    case num {
        0 -> word
        _ -> add_empty(word <> " ", num - 1)
    }
}

pub fn add_empty_examples() {
    check.eq(add_empty("Joao", 2), "Joao  ")
    check.eq(add_empty("", 3), "   ")
    check.eq(add_empty("Joao Aldo", 2), "Joao Aldo  ")
}

/// Essa agora é a função que combina as outras duas funções e faz com que uma lista
/// de diferentes strings possuam todas o mesmo tamanho.

pub fn same_size(list: List(String)) -> List(String) {
    let bigger = bigger_len(list)
    change_sizes(list, bigger)
}

pub fn same_size_examples() {
    check.eq(same_size(["Joao", "Pao", "ai"]), ["Joao", "Pao ", "ai  "])
    check.eq(same_size(["Joao", "Paul", "Andr"]), ["Joao", "Paul", "Andr"])
    check.eq(same_size(["A", "AAAAA"]), ["A    ", "AAAAA"])
}

/// Essa é a função responsável por mudar o tamanho de cada string na lista, faz isso
/// recebendo a lista e seu tamanho

pub fn change_sizes(list: List(String), bigger: Int) -> List(String) {
    case list {
        [] -> []
        [primeiro, ..resto] -> {
            let size_first = string.length(primeiro)
            case size_first < bigger {
                True -> [add_empty(primeiro, bigger - size_first), ..change_sizes(resto, bigger)]
                False -> [primeiro, ..change_sizes(resto, bigger)]
            }
        }
    }
}

pub fn change_sizes_examples() {
    check.eq(change_sizes(["Joao", "Pao", "ai"], 4), ["Joao", "Pao ", "ai  "])
    check.eq(change_sizes(["Joao", "Paul", "Andr"], 4), ["Joao", "Paul", "Andr"])
    check.eq(change_sizes(["A", "AAAAA"], 5), ["A    ", "AAAAA"])
}