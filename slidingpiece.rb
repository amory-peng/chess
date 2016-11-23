module SlidingPiece
  $dirs2 = {
    bishop: [
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1]
    ],

    rook: [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1]
    ],

    queen: [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1],
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1]
    ]
  }
  def moves(symbol)

    generate_possible_moves($dirs2[symbol])

  end


  def collision(pos)
    !@board[pos].nil?
  end


  def generate_possible_moves(dirs)

    out = []
    dirs.each do |dir|
      new_pos = @pos.dup
      loop do
        new_pos = [new_pos[0] + dir[0], new_pos[1] + dir[1]]
        out << new_pos
        break if !@board.in_bounds(new_pos) || collision(new_pos)
      end
    end
    out.reject { |pos| !@board.in_bounds(pos) || (collision(pos) && @color == @board[pos].color)}

  end










end



# module SlidingPiece
#   def moves(direction)
#     out = []
#     case direction
#     when "diagonal"
#       out = right_up + left_up + right_down + left_down
#     when "straight"
#       out = up + down + right + left
#     when "both"
#       out = right_up + left_up + right_down + left_down + up + down + right + left
#     end
#     out
#   end
#
#   def collision(pos)
#
#     !@board[pos].nil?
#   end
#
#   def right_up
#     out = []
#     new_pos = @pos
#     loop do
#       new_pos = [new_pos[0] - 1, new_pos[1] + 1]
#       out << new_pos
#       break if !@board.in_bounds(new_pos) || collision(new_pos)
#     end
#     out.pop if !@board.in_bounds(out.last)
#     # out.pop if !out.empty? && @board[out.last].color == @color
#     # out
#     if !out.empty?
#       out.reject { |pos| @color == @board[pos].color}
#     end
#     out
#   end
#
#   def right_down
#     out = []
#     new_pos = @pos
#     loop do
#       new_pos = [new_pos[0] + 1, new_pos[1] + 1]
#       out << new_pos
#       break if !@board.in_bounds(new_pos) || collision(new_pos)
#     end
#     out.pop if !@board.in_bounds(out.last)
#     if !out.empty?
#       out.reject { |pos| collision(pos) && @color == @board[pos].color}
#     end
#     out
#   end
#
#
#   def left_up
#     out = []
#     new_pos = @pos
#     loop do
#       new_pos = [new_pos[0] - 1, new_pos[1] - 1]
#       out << new_pos
#       break if !@board.in_bounds(new_pos) || collision(new_pos)
#     end
#     out.pop if !@board.in_bounds(out.last)
#     if !out.empty?
#       out.reject { |pos|  @color == @board[pos].color}
#     end
#     out
#   end
#
#
#   def left_down
#     out = []
#     new_pos = @pos
#     loop do
#       new_pos = [new_pos[0] + 1, new_pos[1] - 1]
#       out << new_pos
#       break if !@board.in_bounds(new_pos) || collision(new_pos)
#     end
#     out.pop if !@board.in_bounds(out.last)
#     if !out.empty?
#       out.reject { |pos| @color == @board[pos].color}
#     end
#     out
#   end
#
#   def up
#     out = []
#     new_pos = @pos
#
#     loop do
#       new_pos = [new_pos[0] - 1, new_pos[1]]
#       out << new_pos
#       break if !@board.in_bounds(new_pos) || collision(new_pos)
#
#     end
#     out.pop if !@board.in_bounds(out.last)
#     if !out.empty?
#       out.reject { |pos| @color == @board[pos].color}
#     end
#     out
#
#   end
#
#   def down
#     out = []
#     new_pos = @pos
#     loop do
#       new_pos = [new_pos[0] + 1, new_pos[1]]
#       out << new_pos
#       break if !@board.in_bounds(new_pos) || collision(new_pos)
#     end
#     out.pop if !@board.in_bounds(out.last)
#     if !out.empty?
#       out.reject { |pos| @color == @board[pos].color}
#     end
#     out
#   end
#
#
#   def left
#     out = []
#     new_pos = @pos
#     loop do
#       new_pos = [new_pos[0], new_pos[1] - 1]
#       out << new_pos
#       break if !@board.in_bounds(new_pos) || collision(new_pos)
#     end
#   out.pop if !@board.in_bounds(out.last)
#     if !out.empty?
#       out.reject { |pos| @color == @board[pos].color}
#     end
#     out
#   end
#
#
#   def right
#     out = []
#     new_pos = @pos
#     loop do
#       new_pos = [new_pos[0], new_pos[1] + 1]
#       out << new_pos
#       break if !@board.in_bounds(new_pos) || collision(new_pos)
#     end
#     out.pop if !@board.in_bounds(out.last)
#     if !out.empty?
#       out.reject { |pos| @color == @board[pos].color}
#     end
#     out
#   end
#
# end
