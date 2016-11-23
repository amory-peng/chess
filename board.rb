require_relative 'piece'
require_relative 'null_piece'
require_relative 'bishop'
require_relative 'rook'
require_relative 'queen'
require_relative 'pawn'
require_relative 'king'
require_relative 'knight'

class Board
  attr_accessor :board, :place_holder, :current_player
  def initialize
    @place_holder = NullPiece.new
    @board = Array.new(8) { Array.new(8, place_holder) }
    @current_player = "white"
    @next_player = "black"
  end

  def fill_board
    @board[0][0] = Rook.new("black", [0, 0], self)
    @board[0][1] = Knight.new("black", [0, 1], self)
    @board[0][2] = Bishop.new("black", [0, 2], self)
    @board[0][3] = Queen.new("black", [0, 3], self)
    @board[0][4] = King.new("black", [0, 4], self)
    @board[0][5] = Bishop.new("black", [0, 5], self)
    @board[0][6] = Knight.new("black", [0, 6], self)
    @board[0][7] = Rook.new("black", [0, 7], self)

    @board[1][0] = Pawn.new("black", [1, 0], self)
    @board[1][1] = Pawn.new("black", [1, 1], self)
    @board[1][2] = Pawn.new("black", [1, 2], self)
    @board[1][3] = Pawn.new("black", [1, 3], self)
    @board[1][4] = Pawn.new("black", [1, 4], self)
    @board[1][5] = Pawn.new("black", [1, 5], self)
    @board[1][6] = Pawn.new("black", [1, 6], self)
    @board[1][7] = Pawn.new("black", [1, 7], self)

    @board[7][0] = Rook.new("white", [7, 0], self)
    @board[7][1] = Knight.new("white", [7, 1], self)
    @board[7][2] = Bishop.new("white", [7, 2], self)
    @board[7][3] = Queen.new("white", [7, 3], self)
    @board[7][4] = King.new("white", [7, 4], self)
    @board[7][5] = Bishop.new("white", [7, 5], self)
    @board[7][6] = Knight.new("white", [7, 6], self)
    @board[7][7] = Rook.new("white", [7, 7], self)

    @board[6][0] = Pawn.new("white", [6, 0], self)
    @board[6][1] = Pawn.new("white", [6, 1], self)
    @board[6][2] = Pawn.new("white", [6, 2], self)
    @board[6][3] = Pawn.new("white", [6, 3], self)
    @board[6][4] = Pawn.new("white", [6, 4], self)
    @board[6][5] = Pawn.new("white", [6, 5], self)
    @board[6][6] = Pawn.new("white", [6, 6], self)
    @board[6][7] = Pawn.new("white", [6, 7], self)
  end


  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    return if piece.color != @current_player
    return if !piece.move_dirs.include?(end_pos)
    if self[end_pos].nil?
      self[end_pos] = piece
      self[start_pos] = @place_holder
      piece.pos = end_pos

    elsif self[end_pos].color != piece.color
      self[end_pos] = piece
      self[start_pos] = @place_holder
      piece.pos = end_pos
    end
    swap_current_player
  end

  def swap_current_player
    @current_player, @next_player = @next_player, @current_player
  end

  def in_check?(player)
    enemy_moves = []
    king_pos = []
    @board.each do |row|
      row.each do |col|
        king_pos = col.pos if col.is_a?(King) && col.color == @current_player
        enemy_moves += col.move_dirs unless col.nil? || col.color == @current_player
      end
    end
    #enemy_moves
    enemy_moves.include?(king_pos)
  end

  def checkmate?(player)
    enemy_moves = []
    king_possible_moves = []
    @board.each do |row|
      row.each do |col|
        king_possible_moves = col.move_dirs if col.is_a?(King) && col.color == @current_player
        enemy_moves += col.move_dirs unless col.nil? || col.color == @current_player
      end
    end
    p king_possible_moves
    p enemy_moves
    in_check?(@current_player) && king_possible_moves.all? {|el| enemy_moves.include?(el)}
  end

  def [](pos)
    x, y = pos
    @board[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @board[x][y] = value
  end

  def in_bounds(pos)
    x, y = pos
    x.between?(0, 7) && y.between?(0, 7)
  end
end

# board = Board.new
# bishop = Bishop.new("black", [5,5], board)
# board = Board.new
# rook = Rook.new("black", [4,5], board)
board = Board.new
