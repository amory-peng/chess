module SlidingPiece
  def moves(direction)
    out = []

    case direction
    when "diagonal"
      out = right_up + left_up + right_down + left_down
    when "straight"
      out = up + down + right + left
    when "both"
      out = right_up + left_up + right_down + left_down + up
        + down + right + left
    end
    out
  end

  def collision(pos)
    !@board[pos].value.nil?
  end

  def right_up(pos)
    out = []
    idx = 1
    new_pos = pos
    until !board.in_bounds(new_pos) || collision(new_pos)
      new_pos = [pos[0] - idx, pos[1] + idx]
      out << new_pos
    end
    out
  end

  def right_down(pos)
    out = []
    idx = 1
    new_pos = pos
    until !board.in_bounds(new_pos) || collision(new_pos)
      new_pos = [pos[0] + idx, pos[1] + idx]
      out << new_pos
    end
    out
  end


  def left_up(pos)
    out = []
    idx = 1
    new_pos = pos
    until !board.in_bounds(new_pos) || collision(new_pos)
      new_pos = [pos[0] - idx, pos[1] - idx]
      out << new_pos
    end
    out
  end


  def left_down(pos)
    out = []
    idx = 1
    new_pos = pos
    until !board.in_bounds(new_pos) || collision(new_pos)
      new_pos = [pos[0] + idx, pos[1] - idx]
      out << new_pos
    end
    out
  end

  def up(pos)
    out = []
    idx = 1
    new_pos = pos
    until !board.in_bounds(new_pos) || collision(new_pos)
      new_pos = [pos[0] - idx, pos[1]]
      out << new_pos
    end
    out
  end

  def down(pos)
    out = []
    idx = 1
    new_pos = pos
    until !board.in_bounds(new_pos) || collision(new_pos)
      new_pos = [pos[0] + idx, pos[1]]
      out << new_pos
    end
    out
  end


  def left(pos)
    out = []
    idx = 1
    new_pos = pos
    until !board.in_bounds(new_pos) || collision(new_pos)
      new_pos = [pos[0], pos[1] - idx]
      out << new_pos
    end
    out
  end


  def right(pos)
    out = []
    idx = 1
    new_pos = pos
    until !board.in_bounds(new_pos) || collision(new_pos)
      new_pos = [pos[0], pos[1] + idx]
      out << new_pos
    end
    out
  end
end
