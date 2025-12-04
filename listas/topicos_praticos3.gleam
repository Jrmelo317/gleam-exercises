import sgleam/check
import gleam/list
import gleam/int
import gleam/string
import gleam/result

/// Essa função tem como objetico somar uma lista de Inteiros usando o fold. 
/// Para isso usamos o fold left por ele usar recursão em cauda e economizar
/// processamento da memória.

pub fn sum_list(l: List(Int)) -> Int {
    list.fold(l, 0, fn(acc, x) {acc + x})
}

pub fn sum_list_examples() {
    check.eq(sum_list([]), 0)
    check.eq(sum_list([5]), 5)
    check.eq(sum_list([1, 2, 3]), 6)
    check.eq(sum_list([10, 20, 30, 40]), 100)
    check.eq(sum_list([-5, 5, -3, 3]), 0)
}

/// Essa função deve implementar a função map usando fold, uma map nada 
/// mais é do que aplicar uma função a todos os elementos de uma lista.

pub fn my_map(l: List(a), f: fn(a) -> b) -> List(b) {
    // Implementação de map usando fold (acumulador)
    list.fold(l, [], fn(acc, x) {
        list.append(acc, [f(x)])
    })
}

// Funções auxiliares para usar com my_map
pub fn inc(x: Int) -> Int { x + 1 }
pub fn double(x: Int) -> Int { x * 2 }
pub fn square(x: Int) -> Int { x * x }
pub fn to_string_int(x: Int) -> String { int.to_string(x) }

// Exemplos de uso de my_map
pub fn my_map_examples() {
    check.eq(my_map([], inc), [])
    check.eq(my_map([1], inc), [2])
    check.eq(my_map([1, 2, 3], inc), [2, 3, 4])
    check.eq(my_map([1, 2, 3], double), [2, 4, 6])
    check.eq(my_map([2, 3, 4], square), [4, 9, 16])
    check.eq(my_map([7, 8], to_string_int), ["7", "8"])
}

// Implementação de filter usando fold: mantém apenas elementos que satisfazem o predicado
pub fn my_filter(l: List(a), f: fn(a) -> Bool) -> List(a) {
    list.fold(l, [], fn(acc, x) {
        case f(x) {
            True -> list.append(acc, [x])
            False -> acc
        }
    })
}

// Predicados auxiliares para testes
pub fn is_even(x: Int) -> Bool { x % 2 == 0 }
pub fn is_positive(x: Int) -> Bool { x > 0 }
pub fn longer_than_3(s: String) -> Bool { string.length(s) > 3 }

// Exemplos de uso de my_filter
pub fn my_filter_examples() {
    check.eq(my_filter([], is_even), [])
    check.eq(my_filter([1], is_even), [])
    check.eq(my_filter([2], is_even), [2])
    check.eq(my_filter([1, 2, 3, 4, 5, 6], is_even), [2, 4, 6])
    check.eq(my_filter([-2, -1, 0, 1, 2], is_positive), [1, 2])
    check.eq(my_filter(["hi", "hello", "ok", "world"], longer_than_3), ["hello", "world"])
}

/// Essa função transforma duas strings em uma int e tenta somar, isso para
/// aplicar o açúcar sintático use.

pub fn soma_arquivos(a: String, b: String) -> Result(Int, Nil) {
    use x <- result.try(int.parse(a))
    use y <- result.try(int.parse(b))
    Ok(x + y)
}

pub fn soma_arquivos_examples() {
    check.eq(soma_arquivos("3", "4"), Ok(7))
    check.eq(soma_arquivos("10", "-2"), Ok(8))
    check.eq(soma_arquivos("x", "4"), Error(Nil))
    check.eq(soma_arquivos("3", "y"), Error(Nil))
    check.eq(soma_arquivos("x", "y"), Error(Nil))
}