import sgleam/check
import gleam/list
import gleam/dict
import gleam/option
import gleam/int

/// Para resolver este problema precisaremos das seguintes funções: conta quantos de um elemento
/// existem em uma tabela, verifica se já está na lista, ordenar usando sort e selecionar apenas
/// os x primeiros usando take.

pub fn most_frequent(list: List(String), x: Int) -> List(#(String, Int)) {
    let dictonary = dict.new()
    back_most_frequent(list, x, dictonary)
}

pub fn back_most_frequent(lista: List(String), x: Int, dictonary: dict.Dict(String, Int)) -> List(#(String, Int)) {
    case lista {
        [] -> {
            let dictonary = dict.to_list(dictonary)
            let list_dict = list.sort(dictonary, fn(a, b) {
                let assert #(keya, valuea) = a
                let assert #(keyb, valueb) = b
                int.compare(valueb, valuea)
                })
            list.take(list_dict, x)
        }
        [first, ..rest] -> {
            let has_value = dict.has_key(dictonary, first)
            case has_value {
                True -> {
                    let dictonary = dict.upsert(dictonary, first, fn(x) {
                        let value = option.unwrap(x, 1)
                        value + 1
                        })
                    back_most_frequent(rest, x, dictonary)
                    }
                False -> {
                    let dictonary = dict.insert(dictonary, first, 1)
                    back_most_frequent(rest, x, dictonary)
                }
            }
        }
    }
}

pub fn most_frequent_examples() {
    check.eq(most_frequent(["gleam", "elixir", "gleam", "elixir", "elixir", "rust", "gleam"], 2), [#("gleam", 3), #("elixir", 3)])
    check.eq(most_frequent(["um", "dois", "tres", "um", "dois", "um", "quatro", "dois", "um"], 3), [#("um", 4), #("dois", 3), #("tres", 1)])
    check.eq(most_frequent(["sol", "lua", "sol", "sol", "lua"], 5), [#("sol", 3), #("lua", 2)])
    check.eq(most_frequent([], 2), [])
    check.eq(most_frequent(["a", "b", "a", "c", "a"], 2), [#("a", 3), #("b", 1)])
}