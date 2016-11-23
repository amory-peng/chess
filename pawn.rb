require_relative "piece"
#require 'byebug'
class Pawn < Piece
  attr_accessor :symbol, :possible_move

  def initialize(color, pos, board)
    super
    case color
    when "white"
      @symbol = "♙"
    when "black"
      @symbol = "♟"
    end
  end

  def collision(pos)
    #debugger
    #p "collision check"
    #p pos
    #p @board[pos]
    !@board[pos].nil?
  end

  def move_dirs
    #white on bottom
    case color
    when "white"
      dir = [[-1, 0], [-2, 0], [-1, -1], [-1, 1]]
      if pos[0] != 6
        dir.delete([-2, 0])
      end

      right_up = [pos[0] - 1, pos[1] + 1]
      if !collision(right_up) || @board[right_up].color == @color
        dir.delete([-1, 1])
      end

      left_up = [pos[0] - 1, pos[1] - 1]
      if !collision(left_up) || @board[left_up].color == @color
        dir.delete([-1, -1])
      end

      if collision([pos[0] - 1, pos[1]])
        dir.delete([-1, 0])
      end
    # end

    when "black"
      dir = [[1, 0], [2, 0], [1, 1], [1, -1]]
      if pos[0] != 1
        dir.delete([2, 0])
      end

      right_down = [pos[0] + 1, pos[1] + 1]
      if !collision(right_down) || @board[right_down].color == @color
        dir.delete([1, 1])
      end

      left_down = [pos[0] + 1, pos[1] - 1]
      if !collision(left_down) || @board[left_down].color == @color
        dir.delete([1, -1])
      end

      if collision([pos[0] + 1, pos[1]])
        dir.delete([1, 0])
      end
    end

    out = []
    dir.each do |move|
      out << [@pos[0] + move[0], @pos[1] + move[1]]
    end

    out
  end
end
