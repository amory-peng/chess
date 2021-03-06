require_relative "piece"
require_relative "slidingpiece"

class Bishop < Piece
  attr_accessor :symbol, :possible_moves
  include SlidingPiece

  def initialize(color, pos, board)
    super
    case color
    when "white"
      @symbol = "♗"
    when "black"
      @symbol = "♝"
    end

  end


  def move_dirs
    moves(:bishop)
  end
end
