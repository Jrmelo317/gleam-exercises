import sgleam/check

pub type Pos {
    Pos(x: Int, y: Int, z: Int)
}

pub type Mov {
    Mov(x: Bool, y: Bool, z: Bool)
}

/// Essa função processa uma sequência de deslocamentos em um jogo a partir de um primeiro deslocamento.
/// Para isso ela recebe um ponto inicial na qual se localiza no mapa, e uma lista, cada valor da lista
/// possui um valor x,y,z, sendo que cada valor será booleano, e receberá sempre apenas um True, o resto
/// será False. A posição que for True, anda um movimento.

pub fn list_mov(pos: Pos, movs: List(Mov)) -> Pos {
    list.fold(movs, pos, fn(acc, mov) {
        case mov {
            True, _, _ -> acc.x + 1
            _, True, _ -> acc.y + 1
            _, _, True -> acc.z + 1
            _, _, _ -> acc
        }
    })
}

pub fn list_mov_examples() {
    let pos0 = Pos(0, 0, 0)
    let mov_x = Mov(True, False, False)
    let mov_y = Mov(False, True, False)
    let mov_z = Mov(False, False, True)

    check.eq(list_mov(pos0, []), Pos(0, 0, 0))
    check.eq(list_mov(pos0, [mov_x]), Pos(1, 0, 0))
    check.eq(list_mov(pos0, [mov_y]), Pos(0, 1, 0))
    check.eq(list_mov(pos0, [mov_z]), Pos(0, 0, 1))
    check.eq(list_mov(pos0, [mov_x, mov_y, mov_z]), Pos(1, 1, 1))
    check.eq(list_mov(Pos(2, 3, 4), [mov_x, mov_x, mov_z]), Pos(4, 3, 5))
}