import sgleam/check

///Essa função recebe três números como parâmetros e retorna 
/// o maior entre eles


pub fn max_tres(x1: Int, x2: Int, x3: Int) -> Int {
    case x1 >= x2 && x1 >= x3 {
        True -> x1
        False -> case x2 >= x1 && x2 >= x3 {
            True -> x2
            False -> x3
        }
    }
}

pub fn msx_tres_examples() {
    check.eq(max_tres(1, 2, 3), 3)
    check.eq(max_tres(3, 2, 1), 3)
    check.eq(max_tres(1, 3, 2), 3)
    check.eq(max_tres(3, 3, 3), 3)
    check.eq(max_tres(3, 2, 3), 3)
    check.eq(max_tres(2, 3, 3), 3)
    check.eq(max_tres(3, 3, 2), 3)
}