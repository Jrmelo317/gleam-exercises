import gleam/io

pub fn verifica_valores(preco_alcool: Float, preco_gasolina: Float) -> String {
    let valor = preco_alcool /. preco_gasolina
    case valor >. 0.7 {
        True -> "Abasteça com gasolina"
        False -> 
        case valor == 0.7 {
            True -> "Tanto faz abastecer com álcool ou gasolina"
            False ->
            case valor <. 0.7 {
                True -> "Abasteça com álcool"
                False -> "Erro nos valores"
            }
        }
    }
}

pub fn main() {
    let preco_alcool = 4.50
    let preco_gasolina = 6.50

    let resultado = verifica_valores(preco_alcool, preco_gasolina)
    io.debug(resultado)
}