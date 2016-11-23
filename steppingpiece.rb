module SteppingPiece

  $dirs = {
    knight: [
      [1, 2],
      [2, 1],
      [1, -2],
      [2, -1],
      [-1, 2],
      [-2, 1],
      [-1, -2],
      [-2, -1]
    ],

    king: [
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
    generate_possible_moves($dirs[symbol])

  end


  def collision(pos)
    !@board[pos].nil?
  end

  def generate_possible_moves(dirs)
    out = []
    dirs.each do |dir|
      new_pos = [@pos[0] + dir[0], @pos[1] + dir[1]]
      out << new_pos
    end
    out.reject { |pos| !@board.in_bounds(pos) || (collision(pos) && @color == @board[pos].color)}

  end
end
