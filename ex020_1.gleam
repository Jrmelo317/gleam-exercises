import sgleam/check
import gleam/string
import gleam/list

///determina se uma palavra precisa ter um traço no meio.
/// Se a palavra tiver um número par de caracteres terá traço,
/// se não, não.

pub fn determina_tem_traco_meio(palavra: String) -> Bool {
    !{string.starts_with(palavra, "-")} && !{string.ends_with(palavra, "-")} && {list.length(string.split(palavra, on: "-")) == 2}
}

pub fn determina_tem_traco_meio_examples() {
    check.eq(determina_tem_traco_meio("lero-lero"), True)
    check.eq(determina_tem_traco_meio("-inicio"), False)
    check.eq(determina_tem_traco_meio("fim-"), False)
    check.eq(determina_tem_traco_meio("du-p-la"), False)
    check.eq(determina_tem_traco_meio("Jo-ao"), True)
    check.eq(determina_tem_traco_meio("Parque-Inga"), True)
    check.eq(determina_tem_traco_meio("MataAtlantic-a"), True)
}