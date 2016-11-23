require_relative "piece"
require_relative "steppingpiece"

class King < Piece
  attr_accessor :symbol, :possible_moves
  include SteppingPiece

  def initialize(color, pos, board)
    super
    case color
    when "white"
      @symbol = "♔"
    when "black"
      @symbol = "♚"
    end
  end


  def move_dirs
    moves(:king)
  end
end
