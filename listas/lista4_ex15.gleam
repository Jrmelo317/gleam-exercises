import sgleam/check
import gleam/string
import gleam/int
import gleam/list

pub opaque type Data {
    Data(dia: Int, mes: Int, ano: Int)
}

pub fn data(data: String) -> Result(Data, String) {
    let data_listada = string.split(data, "/")

    case list.length(data_listada) != 3 {
        True -> Error("Erro, não conta com 3 campos")

        False -> case int.parse(at(data_listada, 0)) {

            Ok(dia) -> case int.parse(at(data_listada, 1)) {

                Ok(mes) -> case int.parse(at(data_listada, 2)) {
                    Ok(ano) -> Ok(Data(dia, mes, ano))
                    Error(_) -> Error("Erro, terceiro campo não foi possível fazer o parse")
                }

                Error(_) -> Error("Erro, segundo campo não foi possível realizar o parse")
            }

            Error(_) -> Error("Erro, primeiro campo não foi possível realizar o parse")
        }
    }
}

/// Essa função verifica se uma determinada data é o último dia de algum ano, para isso considera
/// que a data precisa estar no mês 12 e dia 31, o ano pode ser qualquer um

pub fn ultimo_dia_ano(data: Data) {
    case data {
        Data(dia, mes, ano) -> dia == 31 && mes == 12
        _ -> False
    }
}

pub fn ultimo_dia_ano_examples() {
    let data1 = data("22/10/2025")
    let data2 = data("31/12/2000")
    let data3 = data("03/10/2005")
    let data4 = data("31/12/0000")

    case data1 {
        Ok(data_res1) -> check.eq(ultimo_dia_ano(data_res1), False)
        _ -> True
    }
    case data2 {
        Ok(data_res2) -> check.eq(ultimo_dia_ano(data_res2), True)
        _ -> False
    }
    case data3 {
        Ok(data_res3) -> check.eq(ultimo_dia_ano(data_res3), False)
        _ -> True
    }
    case data4 {
        Ok(data_res4) -> check.eq(ultimo_dia_ano(data_res4), True)
        _ -> False
    }
}


pub fn get_data(data: Data) -> String {
    case data {
        Data(dia, mes, ano) -> {
            let dia_string = int.to_string(dia)
            let mes_string = int.to_string(mes)
            let ano_string = int.to_string(ano)
            string.join([dia_string, mes_string, ano_string], "/")
        }
    }
}

pub fn imprime_str(str: String) {
    str
}

pub fn data_examples() {
    let data1 = data("22/10/2025")
    let data2 = data("4a/444/32342834")

    case data1 {
        Ok(data_res1) -> check.eq(get_data(data_res1), "22/10/2025")
        _ -> False
    }
    case data2 {
        Error(str) -> check.eq(imprime_str(str), "Erro, primeiro campo não foi possível realizar o parse")
        _ -> False
    }
}

/// Esta função tem como objetico pegar um elemento em uma posição específica de uma lista,
/// fazendo isso através de seu index. O papel desta função será auxiliar a verificação das
/// datas, então podemos considerar apenas números inteiros, como válidos.

pub fn at(lista: List(String), pos: Int) -> String {
  case lista {
    [] -> ""

    [primeiro, ..resto] -> {
      case pos == 0 {
        True -> primeiro
        False -> at(resto, pos - 1)
      }
    }
  }
}

/// Essa função deve receber duas datas e verificar se a primeira data vem antes
/// da segunda, ou seja, é mais antiga.
/// 
/// 22-10-2025   31-10-2025

pub fn see_older(d1: Data, d2: Data) -> Bool {
    case d1, d2 {
        Data(dia1, mes1, ano1), Data(dia2, mes2, ano2) -> case ano1 < ano2 {
            True -> True
            False -> case ano1 != ano2 {
                True -> False
                False -> case mes1 < mes2 {
                    True -> True
                    False -> case mes1 != mes2 {
                        True -> False
                        False -> dia1 < dia2
                    }
                }
            }
        }
        _, _ -> False 
    }
}

pub fn see_older_examples() {
    let data1 = data("22/10/2024")
    let data2 = data("22/10/2023")
    let data3 = data("22/11/2024")
    let data4 = data("21/10/2024")

    case data1, data2 {
        Ok(data_res1), Ok(data_res2) -> check.eq(see_older(data_res1, data_res2), False)
        _, _ -> False
    }
    case data1, data3 {
        Ok(data_res1), Ok(data_res3) -> check.eq(see_older(data_res1, data_res3), True)
        _, _ -> False
    }
    case data1, data4 {
        Ok(data_res1), Ok(data_res4) -> check.eq(see_older(data_res1, data_res4), False)
        _, _ -> False
    }
    case data2, data1 {
        Ok(data_res2), Ok(data_res1) -> check.eq(see_older(data_res2, data_res1), True)
        _, _ -> False
    }
}