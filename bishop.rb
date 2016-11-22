require_relative "piece"
require_relative "slidingpiece"

class Bishop < Piece
  attr_accessor :symbol, :possible_moves
  include SlidingPiece

  def initialize(color, pos, board)
    super(color, pos, board)
    @symbol = "B"
    @possible_moves = []
  end


  def move_dirs
    out = moves("diagonal")
    out.reject! do |pos|
      @board[pos].color == @color
    end
    @possible_moves = out
  end

end
