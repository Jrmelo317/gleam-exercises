import gleam/io

pub fn custo_combustivel(distancia: Float, preco_litro: Float, rendimento: Float) -> Float {
  {distancia /. rendimento} *. preco_litro
}

pub fn main() {
  let distancia = 400.0
  let preco_litro = 5.0
  let rendimento = 10.0

  let custo = custo_combustivel(distancia, preco_litro, rendimento)
  io.debug(custo)
}