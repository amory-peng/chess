require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display
  attr_accessor :cursor
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render(pos = nil)
    #puts " 01234567"
    @board.board.each_with_index do |row, idx1|
      out = []
      row.each_with_index do |col, idx2|

        if @cursor.cursor_pos == [idx1, idx2]
          temp = col.symbol.colorize(:color => :yellow, :background => :blue)
          out << temp
        else
          temp = col.symbol.colorize(:color => :red)
          temp = temp.colorize(:background => :yellow) if [idx1, idx2] == pos
          out << temp

        end
      end
      puts "#{(out).join("")}"
    end
    puts "current player: #{@board.current_player}" if @board.current_player
    puts "#{@board.current_player} in check" if @board.in_check?(@board.current_player)
    puts "#{@board.current_player} in checkmate" if @board.checkmate?(@board.current_player)
    nil
  end

  def play_turn

    idx = 0
    system("clear")
    render
    until @cursor.selected
      @cursor.get_input
      system("clear")
      render
    end
    start_pos = @cursor.cursor_pos

    if @board[start_pos].nil?
      @cursor.selected = false
      play_turn
    end

    while @cursor.selected
      @cursor.get_input
      system("clear")
      render(start_pos)
      p @board[start_pos].move_dirs unless @board[start_pos].nil?
    end
    end_pos = @cursor.cursor_pos
    @board.move_piece(start_pos, end_pos)
    play_turn

    # render
  end
end

test = Board.new
test.fill_board

test2 = Display.new(test)
test2.play_turn
