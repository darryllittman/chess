require_relative 'empty_piece'
require_relative 'piece'
# require_relative 'pawn'

class Board
  attr_accessor :board, :grid

  def initialize
    @grid = Array.new(8) { Array.new(8,EmptyPiece.instance) }
  end

  def in_bounds?(pos)
    pos.all? { |coord| coord.between?(0,7) }
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end

  def move_piece!(from_pos, to_pos)
    self[to_pos] = self[from_pos]
    self[from_pos] = EmptyPiece.instance
  end

  def in_check?(color)
    king_pos = nil

    @grid.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        king_pos = [i, j] if piece.color == color && piece.class == King
      end
    end
    p king_pos
    opp_piece_positions = []
    @grid.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        opp_piece_positions << [i, j] if piece.color != color && piece.color != nil && piece.class != King
      end
    end
    p opp_piece_positions
    valid_positions = []
    opp_piece_positions.each do |pos|
      self[pos].moves.each { |move| valid_positions << move }
    end
    p valid_positions.size
    valid_positions.include?(king_pos)
  end

end


if __FILE__ == $PROGRAM_NAME
  a = Board.new
  p a
end
