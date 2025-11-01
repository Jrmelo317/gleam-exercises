import sgleam/check
import gleam/list

pub fn seleciona(nomes: List(String), booleanos: List(Bool)) -> Result(List(String), Nil) {
    let tam_nomes = list.length(nomes)
    let tam_booleanos = list.length(booleanos)

    case nomes, booleanos {
        _, _ if tam_nomes != tam_booleanos -> Error(Nil)
        [], [] -> Error(Nil)
        [pn, ..rn], [pb, ..rb] if pb == True -> Ok([pn, ..seleciona_aux(rn, rb)])
        [pn, ..rn], [pb, ..rb] -> Ok(seleciona_aux(rn, rb))
        [pn, ..rn], [] -> Error(Nil)
        [], [pb, ..rb] -> Error(Nil)
    }
}

pub fn seleciona_examples() {
    check.eq(seleciona([], []), Error(Nil))
    check.eq(seleciona(["Paulo", "Jr", "Ideraldo"], [False, True, False]), Ok(["Jr"]))
    check.eq(seleciona(["Paulo", "Jr", "Ideraldo"], [False, False, False]), Ok([]))
    check.eq(seleciona(["Paulo", "Jr", "Ideraldo"], [True, True, True]), Ok(["Paulo", "Jr", "Ideraldo"]))
}

pub fn seleciona_aux(nomes: List(String), bools: List(Bool)) -> List(String) {
    case nomes, bools {
        [], [] -> []
        [pn, ..rn], [pb, ..rb] if pb == True -> [pn, ..seleciona_aux(rn, rb)]
        [pn, ..rn], [pb, ..rb] -> seleciona_aux(rn ,rb)
        [pn, ..rn], [] -> []
        [], [pb, ..rb] -> []
    }
}

pub fn seleciona_aux_examples() {
    check.eq(seleciona_aux([], []), [])
    check.eq(seleciona_aux(["Paulo", "Jr", "Ideraldo"], [True, False]), ["Paulo"])
    check.eq(seleciona_aux(["Paulo", "Jr", "Ideraldo"], [True, True, True]), ["Paulo", "Jr", "Ideraldo"])
    check.eq(seleciona_aux(["Paulo", "Jr", "Ideraldo"], [False, False, False]), [])
    check.eq(seleciona_aux(["Paulo", "Jr", "Ideraldo"], [True, False, False, True]), ["Paulo"])
}