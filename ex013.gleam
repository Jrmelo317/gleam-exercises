import gleam/io
import gleam/string
import gleam/int

pub fn eh_par(x: Int) -> Bool {
    case x % 2 == 0 {
        True -> True
        False -> False
    }
}

pub fn verifica_positivo(x: Int) -> Bool {
    case x >= 0 {
        True -> True
        False -> False
    }
}

pub fn bool_to_string(b: Bool) -> String {
  case b {
    True -> "True"
    False -> "False"
  }
}

pub fn main() {
    let teste1 = 3
    let teste2 = 6

    let resultado1 = eh_par(teste1)
    let resultado2 = eh_par(teste2)

    io.debug(string.concat(["O número ", int.to_string(teste1), " é par: ", bool_to_string(resultado1)]))
    io.debug(string.concat(["O número ", int.to_string(teste2), " é par: ", bool_to_string(resultado2)]))
}