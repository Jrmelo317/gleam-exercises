import gleam/io

pub fn maximo(x: Int, y: Int) -> Int {
    case x > y {
        True -> x
        False ->
        case x == y {
            True -> x
            False -> y
        }
    }
}


pub fn main() {
    let x1 = 3
    let y1 = 5

    let x2 = 8
    let y2 = 4

    let x3 = 6
    let y3 = 6

    io.debug(maximo(x1, y1))
    io.debug(maximo(x2, y2))
    io.debug(maximo(x3, y3))
}