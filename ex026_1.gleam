import sgleam/check
import gleam/float


///Essa função verifica a quantidade total de azuleijos necessários para azuleijar
/// uma parede, considerando que um azuleijo tem 20 cm de largura e altura, e que
/// recortes de azuleijos não são reaproveitados.
/// A altura e largura da parede devem ser passadas em cm.

pub fn quantidade_azuleijos(altura_parede: Float, largura_parede: Float) -> Int {
    let azuleijos_largura = float.truncate(float.ceiling(largura_parede /. 20.0))
    let azuleijos_altura = float.truncate(float.ceiling(altura_parede /. 20.0))

    azuleijos_altura * azuleijos_largura
}

pub fn quantidade_azuleijos_examples() {
    check.eq(quantidade_azuleijos(100.0, 60.0), 15)
    check.eq(quantidade_azuleijos(200.0, 300.0), 150)
    check.eq(quantidade_azuleijos(250.0, 310.0), 208)
    check.eq(quantidade_azuleijos(50.0, 70.0), 12)
}