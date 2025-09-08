import sgleam/check


/// Produz True se uma pessoa com *idade* é supercentenária,
/// isto é, tem 110 anos ou mais, False caso contrário.
pub fn supercentenario(idade: Int) -> Bool {
    case idade >= 110 {
        True -> True
        False -> False
    }
}


pub fn supercentenario_examples() {
    check.eq(supercentenario(101), False)
    check.eq(supercentenario(110), True)
    check.eq(supercentenario(112), True)
}