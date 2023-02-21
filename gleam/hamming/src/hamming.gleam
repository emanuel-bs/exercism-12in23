import gleam/list
import gleam/string

pub fn distance(strand1: String, strand2: String) -> Result(Int, Nil) {
  case string.length(strand1) == string.length(strand2) {
    False -> Error(Nil)
    True -> Ok({
      list.zip(string.to_graphemes(strand1), string.to_graphemes(strand2))
      |> list.filter(fn (hamming_distance){ let #(l1,l2) = hamming_distance; l1 != l2 }) 
      |> list.length
    })
  }
}
