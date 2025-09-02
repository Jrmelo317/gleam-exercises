import gleam/io
import gleam/string
import gleam/float

pub fn produto_anterior_posterior(x: Int) -> Int {
    let anterior = x - 1
    let posterior = x + 1
    x * anterior * posterior
}

pub fn main() {
    let numero1 = 3
    let resultado1 = produto_anterior_posterior(numero1)
    io.debug(resultado1)

    let numero2 = 1 
    let resultado2 = produto_anterior_posterior(numero2)
    io.debug(resultado2)

    let numero3 = -2 
    let resultado3 = produto_anterior_posterior(numero3)
    io.debug(resultado3)
}