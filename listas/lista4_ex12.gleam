import sgleam/check
import gleam/int


/// Esse tipo tem como função representar a resoluçaõ de uma tela
/// com altura e largura em pixels

pub opaque type Resolucao {
    Resolucao(
        altura: Int,
        largura: Int
    )
}

/// Essa função cria uma instância do tipo Resolucao, para isso verifica
/// o par de Altura e Largura, e ve se eles condizem com altura e largura
/// validas.

pub fn resolucao(altura: Int, largura: Int) -> Result(Resolucao, String) {
    case altura, largura {
        1024, 768 -> Ok(Resolucao(altura, largura))
        1280, 720 -> Ok(Resolucao(altura, largura))
        1920, 1080 -> Ok(Resolucao(altura, largura))
        2560, 1080 -> Ok(Resolucao(altura, largura))
        2560, 1440 -> Ok(Resolucao(altura, largura))
        3840, 2160 -> Ok(Resolucao(altura, largura))
        _, _ -> Error("O par valor altura e largura não são válidos")
    }
}

pub fn resolucao_examples() {
    let a0 = 1024
    let l0 = 768

    let a1 = 1280
    let l1 = 720

    let a2 = 1920
    let l2 = 1080

    let a3 = 2560
    let l3 = 1440

    let a4 = 3840
    let l4 = 2160

    check.eq(resolucao(a0, l0), Ok(Resolucao(1024, 768)))
    check.eq(resolucao(a1, l1), Ok(Resolucao(1280, 720)))
    check.eq(resolucao(a2, l2), Ok(Resolucao(1920, 1080)))
    check.eq(resolucao(a3, l3), Ok(Resolucao(2560, 1440)))
    check.eq(resolucao(a4, l4), Ok(Resolucao(3840, 2160)))
    check.eq(resolucao(1720, 1500), Error("O par valor altura e largura não são válidos"))
}

/// Métodos get para recuperar os campos dentro do tipo composto resolução

pub fn get_altura(resolucao: Resolucao) -> Int {
    resolucao.altura
}

pub fn get_largura(resolucao: Resolucao) -> Int {
    resolucao.largura
}

pub fn gets_examples() {
    let res = resolucao(1280, 720)
    case res {
        Ok(res_valida) -> {
            check.eq(get_altura(res_valida), 1280)
            check.eq(get_largura(res_valida), 720)
            }
        Error(mensagem) -> panic as mensagem
    }
}

/// Essa função deve receber uma instância de resolução e calcular quantos mega pixels
/// essa determinada resolução possui. Sendo que o número de mega pixels é dado
/// pela multiplicação da altura e largura dividido por 1 milhão.

pub fn calcula_mega_pixels(altura: Int, largura: Int) -> Float {
    int.to_float(int.multiply(altura, largura)) /. 1_000_000.0
}

pub fn calcula_mega_pixels_examples() {
        let res1 = resolucao(1280, 720)
        let res2 = resolucao(1920, 1080)
        let res3 = resolucao(2560, 1440)
        let res4 = resolucao(3840, 2160)

    case res1 {
        Ok(res1v) -> check.eq(calcula_mega_pixels(get_altura(res1v), get_largura(res1v)), 0.9216)
        Error(_) -> False
    }
    case res2 {
        Ok(res2v) -> check.eq(calcula_mega_pixels(get_altura(res2v), get_largura(res2v)), 2.0736)
        Error(_) -> False
    }
    case res3 {
        Ok(res3v) -> check.eq(calcula_mega_pixels(get_altura(res3v), get_largura(res3v)), 3.6864)
        Error(_) -> False
    }
    case res4 {
        Ok(res4v) -> check.eq(calcula_mega_pixels(get_altura(res4v), get_largura(res4v)), 8.2944)
        Error(_) -> False
    }
}

pub type Aspect {
    Aspecto4x3
    Aspecto16x9
    Outro
}

/// Essa função é a responsável por calcular o aspecto ratio de uma resolução,
/// faz isso utilizando a formulá altura*aspecto == largura*aspecto

pub fn calcula_aspect(altura: Int, largura: Int) -> Aspect {
    case altura * 9 == largura * 16 {
        True -> Aspecto16x9
        False -> case altura * 3 == largura * 4 {
            True -> Aspecto4x3
            False -> Outro
        }
    }
}

pub fn calcula_aspect_examples() {
    let res1 = resolucao(1024, 768)
    let res2 = resolucao(1920, 1080)
    let res3 = resolucao(2560, 1080)

    case res1 {
        Ok(res1v) -> check.eq(calcula_aspect(get_altura(res1v), get_largura(res1v)), Aspecto4x3)
        Error(_) -> False
    }
    case res2 {
        Ok(res2v) -> check.eq(calcula_aspect(get_altura(res2v), get_largura(res2v)), Aspecto16x9)
        Error(_) -> False
    }
    case res3 {
        Ok(res3v) -> check.eq(calcula_aspect(get_altura(res3v), get_largura(res3v)), Outro)
        Error(_) -> False
    }
}

/// Essa função deve receber duas resoluções, uma de uma imagem e outra de uma tela, 
/// a função deve informar se a imagem pode ser exibida completamente na tela sem a 
/// necessidade de rotação ou mudança de tamanho. Para isso, a função deve comparar os
/// tamanhos das resoluções, para ver se cabe ou não.

pub fn verifica_exibicao_imagem(altura_im: Int, largura_im: Int, altura_tela: Int, largura_tela: Int) -> Bool {
    altura_im <= altura_tela && largura_im <= largura_tela
}

pub fn verifica_exibicao_imagem_examples() {
    check.eq(verifica_exibicao_imagem(1080, 1920, 1080, 2560), True)
    check.eq(verifica_exibicao_imagem(1440, 1920, 1080, 2560), False)
}