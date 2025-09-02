import gleam/io

pub fn ordem(a: Int, b: Int, c: Int) -> String {
    case a <= b && b <= c {
        True -> "crescente"
        False -> 
        case a >= b && b >= c {
            True -> "decrescente"
            False -> "não está em ordem"
        }
    }
}

pub fn main() {
    io.debug(ordem(3, 8, 12))
    io.debug(ordem(3, 1, 4))
    io.debug(ordem(3, 1, 0))
}