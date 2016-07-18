require_relative 'empty_piece'
require_relative 'piece'
class Board
  attr_accessor :board, :grid

  def initialize
    @grid = Array.new(8) { Array.new(8,EmptyPiece.instance) }
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end
end


if __FILE__ == $PROGRAM_NAME
  a = Board.new
  p a
end
