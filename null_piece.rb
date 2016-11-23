require_relative "piece"

class NullPiece < Piece
  attr_accessor :symbol
  def initialize(color, pos, board)
    @symbol = "."
  end

  def nil?
    true
  end

end
