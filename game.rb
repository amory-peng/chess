class Game
  def initialize
    @board = Board.new


  end

  def run
    while true
      play_turn
    end

  end

end
