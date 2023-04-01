import gleam/int
import gleam/list
import gleam/map
import gleam/result

pub type Category {
  Ones
  Twos
  Threes
  Fours
  Fives
  Sixes
  FullHouse
  FourOfAKind
  LittleStraight
  BigStraight
  Choice
  Yacht
}

pub type Dice =
  List(Int)

pub fn score(category: Category, dice: Dice) -> Int {
  case category {
    Ones -> sum_face(dice, 1)
    Twos -> sum_face(dice, 2)
    Threes -> sum_face(dice, 3)
    Fours -> sum_face(dice, 4)
    Fives -> sum_face(dice, 5)
    Sixes -> sum_face(dice, 6)
    FullHouse -> full_house(dice)
    FourOfAKind -> four_of_a_kind(dice)
    LittleStraight | BigStraight -> straight(dice, category)
    Choice -> int.sum(dice)
    Yacht -> yacht(dice)
  }
}

pub fn sum_face(dice: Dice, number: Int) -> Int {
  dice
  |> list.filter(fn(face) { face == number })
  |> int.sum
}

pub fn full_house(dice: Dice) -> Int {
  let groups =
    dice
    |> list.group(fn(dice) { dice })
    |> map.to_list
    |> list.map(fn(group) { list.length(group.1) })
    |> list.sort(int.compare)
  case groups {
    [2, 3] -> int.sum(dice)
    _ -> 0
  }
}

pub fn four_of_a_kind(dice: Dice) -> Int {
  let sorted = list.sort(dice, by: int.compare)
  case list.length(list.unique(sorted)) < 3 {
    False -> 0
    True ->
      case list.at(sorted, 1) == list.at(sorted, 3) {
        False -> 0
        True -> result.unwrap(list.at(sorted, 3), 0) * 4
      }
  }
}

pub fn straight(dice: Dice, category: Category) -> Int {
  case list.sort(dice, int.compare), category {
    [1, 2, 3, 4, 5], LittleStraight -> 30
    [2, 3, 4, 5, 6], BigStraight -> 30
    _, _ -> 0
  }
}

pub fn yacht(dice: Dice) -> Int {
  case list.unique(dice) {
    [_] -> 50
    _ -> 0
  }
}
