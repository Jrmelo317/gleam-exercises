import sgleam/check
import gleam/list
import gleam/string
import gleam/int

/// Essa função tem como objetivo utilizar a função map2. Essa função basicamente recebe
/// duas listas e uma função e aplica a função a cada elemento combinado das duas listas.
/// Assim, para map2 funcionar as duas funções devem possuir a mesma quantidade de elementos
/// e serem do mesmo tipo. A saída é outra lista, com a combinação resultante das duas listas
/// na função. Exemplo: map2([1], [3], add) deve retornar 4.

pub fn apply_map2(lst1: List(a), lst2: List(a), f: fn(a, a) -> d) -> Result(List(d), Nil) {
    let tam1 = list.length(lst1)
    let tam2 = list.length(lst2)

    case tam1, tam2 {
        _, _ if tam1 != tam2 -> Error(Nil)
        _, _ -> Ok(list.map2(lst1, lst2, f))
    }
}

pub fn apply_map2_examples() {
    check.eq(apply_map2(["Ratzam Ajadari Araba JAJA"], ["Araba"], string.crop), Ok(["Araba JAJA"]))
    check.eq(apply_map2([1, 2, 3], [3, 2, 1], int.add), Ok([4, 4, 4]))
    check.eq(apply_map2([5, 5, 5], [3, 3, 5], int.multiply), Ok([15, 15, 25]))
    check.eq(apply_map2([1, 2, 3], [1, 2], int.add), Error(Nil))
}

/// Essa função busca aplicar a função filter_map, executa a mesma coisa que uma função map,
/// ou seja, aplica determinada função a uma lista inteira. Mas a função aplicada deve retornar
/// result, e nesta parte que ela se diferencia, aplicando filter, retornando apenas as funções
/// que deram Ok, ou seja, remove os erros da lista.

pub fn apply_filter_map(list: List(a), f: fn(a) -> Result(b, e)) -> List(b) {
    list.filter_map(list, f)
}

pub fn apply_filter_map_examples() {
    check.eq(apply_filter_map(["2", "4", "6", "CDE", "8", "10", "ABC"], int.parse), [2, 4, 6, 8, 10])
    check.eq(apply_filter_map([4, -7, -8, 9, -20, 16, 25], int.square_root), [2.0, 3.0, 4.0, 5.0])
    check.eq(apply_filter_map(["", "", "ABD", "BCD", "", "CDE"], string.first), ["A", "B", "C"])
}

/// Essa função busca aplicar a função fold_until, esa função basicamente usa o fold a esquerda,
/// porém ela para antes de executar totalmente a função, com uma condição de parada.

pub fn add_pos(lst: List(Int)) -> Int {
    lst |> list.fold_until(0, fn(acc, x) {
        case x {
            _ if x > 0 -> list.Continue(acc + x)
            _ -> list.Stop(acc)
        }
    })
}

pub fn add_pos_examples() {
    check.eq(add_pos([1, 2, 3, -4, 5, 4, 2]), 6)
    check.eq(add_pos([0, 1, 2, 3, 4]), 0)
    check.eq(add_pos([-1, 1, 2, 3, 4]), 0)
    check.eq(add_pos([1, 5, -1, 3, -2, 5]), 6)
}