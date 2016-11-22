require_relative "piece"

class NullPiece < Piece
  attr_accessor :symbol
  def initialize
    #@value = nil
    @color = nil
    @symbol = "x"
    @value = 2
  end

  def nil?
    test
  end

end
