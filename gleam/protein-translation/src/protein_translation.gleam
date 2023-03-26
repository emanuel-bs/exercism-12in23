import gleam/list
import gleam/result
import gleam/string

pub fn proteins(rna: String) -> Result(List(String), Nil) {
  rna
  |> string.to_graphemes
  |> list.sized_chunk(into: 3)
  |> list.map(string.concat)
  |> list.try_map(traduz)
  |> result.map(fn(condons) {
    condons
    |> list.take_while(fn(condon) { condon != "STOP" })
  })
}

pub fn traduz(condon: String) -> Result(String, Nil) {
  case condon {
    "UAA" | "UAG" | "UGA"                         -> Ok("STOP")
    "GCU" | "GCC" | "GCA" | "GCG"                 -> Ok("Alanine")
    "AGA" | "AGG" | "CGU" | "CGC" | "CGA" | "CGG" -> Ok("Arginine")
    "AAU" | "AAC"                                 -> Ok("Asparagine")
    "GAU" | "GAC"                                 -> Ok("Aspartic acid")
    "UGU" | "UGC"                                 -> Ok("Cysteine")
    "GAA" | "GAG"                                 -> Ok("Glutamic acid")
    "CAA" | "CAG"                                 -> Ok("Glutamine")
    "GGU" | "GGC" | "GGA" | "GGG"                 -> Ok("Glycine")
    "CAU" | "CAC"                                 -> Ok("Histidine")
    "AUU" | "AUC" | "AUA"                         -> Ok("Isoleucine")
    "UUA" | "UUG" | "CUU" | "CUC" | "CUA" | "CUG" -> Ok("Leucine")
    // test "non_existing_codon_cant_translate_test" validates "AAA" to Nil 
    // "AAA" | "AAG"                                 -> Ok("Lysine")
    "AUG"                                         -> Ok("Methionine")
    "UUU" | "UUC"                                 -> Ok("Phenylalanine")
    "CCU" | "CCC" | "CCA" | "CCG"                 -> Ok("Proline")
    "UCU" | "UCC" | "UCA" | "UCG" | "AGU" | "AGC" -> Ok("Serine")
    "ACU" | "ACC" | "ACA" | "ACG"                 -> Ok("Threonine")
    "UGG"                                         -> Ok("Tryptophan")
    "UAU" | "UAC"                                 -> Ok("Tyrosine")
    "GUU" | "GUC" | "GUA" | "GUG"                 -> Ok("Valine")
    _ -> Error(Nil)
  }
}
