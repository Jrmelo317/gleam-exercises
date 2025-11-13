import sgleam/check
import gleam/list
import gleam/int

/// Para resolver este problema criaremos um tipo de dados algébrico chamado Media,
/// toda Media tem um aluno especifico vinculado a ela e um nome.

pub type Media {
    Media(name: String, grade: Float)
}

/// Essa função soma todos os valores das notas dos alunos, e retorna esse valor

pub fn total_grade(list: List(Media)) -> Float {
    case list {
        [] -> 0.0
        [first, ..rest] -> first.grade +. total_grade(rest)
    }
}

pub fn total_grade_examples() {
    check.eq(total_grade([
        Media(name: "Ana", grade: 9.5),
        Media(name: "Bruno", grade: 7.0),
        Media(name: "Carla", grade: 8.2),
        Media(name: "Daniel", grade: 6.5),
        Media(name: "Elisa", grade: 10.0)
        ]), 41.2)
    check.eq(total_grade([
        Media(name: "Felipe", grade: 5.5),
        Media(name: "Gabriela", grade: 8.0),
        Media(name: "Heitor", grade: 7.5),
        Media(name: "Isabela", grade: 9.0),
        Media(name: "Jorge", grade: 6.8)
        ]), 36.8)
    check.eq(total_grade([
        Media(name: "Laura", grade: 8.8),
        Media(name: "Miguel", grade: 9.2),
        Media(name: "Natália", grade: 7.0),
        Media(name: "Otávio", grade: 6.1),
        Media(name: "Patrícia", grade: 8.5)]), 39.6)
}

/// Agora criaremos uma função que realiza a média da turma de nota.

pub fn class_avarage(lista: List(Media)) -> Float {
    let class_size = int.to_float(list.length(lista))
    total_grade(lista) /. class_size
}

pub fn class_avarage_examples() {
    check.eq(class_avarage([
        Media(name: "Ana", grade: 9.5),
        Media(name: "Bruno", grade: 7.0),
        Media(name: "Carla", grade: 8.2),
        Media(name: "Daniel", grade: 6.5),
        Media(name: "Elisa", grade: 10.0)
        ]), 8.24)
    check.eq(class_avarage([
        Media(name: "Felipe", grade: 5.5),
        Media(name: "Gabriela", grade: 8.0),
        Media(name: "Heitor", grade: 7.5),
        Media(name: "Isabela", grade: 9.0),
        Media(name: "Jorge", grade: 6.8)
        ]), 7.359999999999999)
    check.eq(class_avarage([
        Media(name: "Laura", grade: 8.8),
        Media(name: "Miguel", grade: 9.2),
        Media(name: "Natália", grade: 7.0),
        Media(name: "Otávio", grade: 6.1),
        Media(name: "Patrícia", grade: 8.5)]), 7.92)
}

/// Agora fazemos a função completa, que calcula a média da sala, e cria uma lista com
/// os alunos que são acima da média.

pub fn pub_above_avarage(list: List(Media)) -> List(Media) {
    let class_a = class_avarage(list)
    above_avarage(list, class_a)
}

/// Essa é a função above avarage que realmente cria a lista, mas para isso ela recebe
/// como argumento a média da sala.

pub fn above_avarage(list: List(Media), class_a: Float) -> List(Media) {
    case list {
        [] -> []
        [first, ..rest] if first.grade >=. class_a -> [first, ..above_avarage(rest, class_a)]
        [first, ..rest] -> above_avarage(rest, class_a) 
    }
}

pub fn above_avarage_examples() {
    check.eq(above_avarage([
        Media(name: "Ana", grade: 9.5),
        Media(name: "Bruno", grade: 7.0),
        Media(name: "Carla", grade: 8.2),
        Media(name: "Daniel", grade: 6.5),
        Media(name: "Elisa", grade: 10.0)
        ], 8.24), [Media(name: "Ana", grade: 9.5), Media(name: "Elisa", grade: 10.0)])
    check.eq(above_avarage([
        Media(name: "Felipe", grade: 5.5),
        Media(name: "Gabriela", grade: 8.0),
        Media(name: "Heitor", grade: 7.5),
        Media(name: "Isabela", grade: 9.0),
        Media(name: "Jorge", grade: 6.8)
        ], 7.359999999999999), [Media(name: "Gabriela", grade: 8.0), Media(name: "Heitor", grade: 7.5), Media(name: "Isabela", grade: 9.0)])
    check.eq(above_avarage([
        Media(name: "Laura", grade: 8.8),
        Media(name: "Miguel", grade: 9.2),
        Media(name: "Natália", grade: 7.0),
        Media(name: "Otávio", grade: 6.1),
        Media(name: "Patrícia", grade: 8.5)
        ], 7.92), [Media(name: "Laura", grade: 8.8), Media(name: "Miguel", grade: 9.2), Media(name: "Patrícia", grade: 8.5)])
}