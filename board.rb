require_relative 'piece'
require_relative 'null_piece'
class Board
  attr_accessor :board, :place_holder
  def initialize
    @place_holder = NullPiece.new
    @board = Array.new(8) {Array.new(8, place_holder)}
  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    raise "null piece" if piece.nil?
    self[end_pos] = piece
    self[start_pos] = @place_holder
  end

  def [](pos)
    x, y = pos
    @board[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @board[x][y] = value
  end



  def in_bounds(pos)
    x, y = pos
    x.between?(0, 7) && y.between?(0, 7)
  end
end
