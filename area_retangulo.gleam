import gleam/io
import gleam/float
import gleam/string

pub fn area_retangulo(largura: Float, altura: Float) -> Float {
    // Calcula a área de um retângulo a partir da largura e altura fornecidas
    largura *. altura
}

pub fn main() {
    let largura1 = 3.0
    let altura1 = 5.0

    let largura2 = 2.0
    let altura2 = 2.5

    let area1 = area_retangulo(largura1, altura1)
    let area2 = area_retangulo(largura2, altura2)
    io.debug(string.concat(["A área do retângulo é: ", float.to_string(area1)]))
}