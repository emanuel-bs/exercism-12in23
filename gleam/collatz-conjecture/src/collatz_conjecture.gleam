pub type Error {
  NonPositiveNumber
}

pub fn steps(number: Int) -> Result(Int, Error) {
  case number > 0 {
    False -> Error(NonPositiveNumber)
    True -> Ok(proximo(0, number))
  }
}

pub fn proximo(passo: Int, number: Int) -> Int {
  case number % 2 {
    _ if number == 1 -> passo
    0 -> proximo(passo + 1, number / 2)
    _ -> proximo(passo + 1, number * 3 + 1)
  }
}
