import sgleam/check

///Essa função deve calcular o imposto que um cidadão de um determinado país deve pagar.
///A regra de imposto é: 5% para quem recebe até 1000. Para quem recebe até 5000, paga 5% sobre 1000
///e 10% sobre o excedente. Para quem recebe mais de 5000, paga 5% sobre 1000, 10% sobre o excedente até 5000
///e 20% sobre o excedente.

type Dinheiro = Float

pub fn calcula_imposto(valor: Dinheiro) -> Dinheiro {
    case valor <=. 1000.0 {
        True -> {valor /. 100.0} *. 5.0
        False -> case valor <=. 5000.0 {
            True -> {{1000.0 /. 100.0} *. 5.0 +. {{valor -. 1000.0} /. 100.0 *. 10.0}}
            False -> {{1000.0 /. 100.0} *. 5.0 +. {{5000.0 -. 1000.0} /. 100.0 *. 10.0} +. {valor -. 5000.0} /. 100.0 *. 20.0}
        }
    }
}

pub fn calcula_imposto_examples() {
    check.eq(calcula_imposto(800.0), 40.0)
    check.eq(calcula_imposto(3_000.0), 250.0)
    check.eq(calcula_imposto(10_000.0), 1_450.0)
    check.eq(calcula_imposto(1_000.0), 50.0)
    check.eq(calcula_imposto(5_000.0), 450.0)
}