require 'colorize'

class Piece
  def initialize(color, board, position)
    @color = color
    @board = board
    @position = postion
  end

  def to_s

  end

  def empty?
  end

  def symbol
    "#"
  end

  def valid_moves
  end

  def move_into_check?(to_position)
  end
end
