class Piece
  attr_accessor :color, :pos, :board
  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
  end

  def valid_moves
    moves.reject {|pos| move_into_check?(pos)}
  end

  def move_into_check(pos)

  end
end
