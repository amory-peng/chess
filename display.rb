require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display
  attr_accessor :cursor
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    #puts " 01234567"
    @board.board.each_with_index do |row, idx1|
      out = []
      row.each_with_index do |col, idx2|
        if @cursor.cursor_pos == [idx1, idx2]
          out << col.symbol.blue
        else
          out << col.symbol.red
        end
      end
      puts "#{(out).join("")}"
    end
    nil
  end

  def play_turn
    idx = 0
    render
    while true
      system("clear")
      p idx+=1

      render
      p @cursor.cursor_pos
      @cursor.get_input

    end
  end
end

test = Board.new
test2 = Display.new(test)
test2.play_turn
