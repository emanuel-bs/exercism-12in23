import gleam/string

// import gleam/list

pub type Robot {
  Robot(direction: Direction, position: Position)
}

pub type Direction {
  North
  East
  South
  West
}

pub type Position {
  Position(x: Int, y: Int)
}

pub fn create(direction: Direction, position: Position) -> Robot {
  Robot(direction, position)
}

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  case string.pop_grapheme(instructions) {
    Ok(#(head, tail)) ->
      case head {
        "R" -> move(turn_right(direction), position, tail)
        "L" -> move(turn_left(direction), position, tail)
        "A" -> move(direction, advance(direction, position), tail)
      }
    Error(Nil) -> create(direction, position)
  }
}

pub fn turn_right(direction: Direction) -> Direction {
  case direction {
    North -> East
    East -> South
    South -> West
    West -> North
  }
}

pub fn turn_left(direction: Direction) -> Direction {
  case direction {
    North -> West
    East -> North
    South -> East
    West -> South
  }
}

pub fn advance(direction: Direction, position: Position) -> Position {
  case direction {
    North -> Position(position.x, position.y + 1)
    East -> Position(position.x + 1, position.y)
    South -> Position(position.x, position.y - 1)
    West -> Position(position.x - 1, position.y)
  }
}
