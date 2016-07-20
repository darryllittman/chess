require_relative 'empty_piece'
require_relative 'piece'
require_relative 'pawn'

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

end


if __FILE__ == $PROGRAM_NAME
  a = Board.new
  p a
end
