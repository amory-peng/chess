require_relative "piece"

class NullPiece < Piece
  attr_accessor :symbol, :value
  def initialize
    #@value = nil
    @color = nil
    @symbol = "."
    @value = nil
  end

  def nil?
    true
  end

end
