import sgleam/check
import gleam/list
import gleam/string

/// Transforma a string *data* que está no formato "dia/mes/ano"
/// para o formato "ano/mes/dia".
/// Requer que o dia e o mês tenham dois dígitos e que
/// o ano tenha quatro dígitos.



pub fn dma_para_amd(data: String) -> String {
    let lista: List(String) = string.split(data, on: "/")
    let data_lista: List(String) = list.reverse(lista)
    let data: String = string.join(data_lista, with: "/")
}


pub fn dma_para_amd_examples() {
    check.eq(dma_para_amd("19/07/2023"), "2023/07/19")
    check.eq(dma_para_amd("01/01/1980"), "1980/01/01")
    check.eq(dma_para_amd("02/02/2002"), "2002/02/02")
}