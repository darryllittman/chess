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
    valid = MOVES.map do |move|
      [@cursor_pos[0] + move[0], @cursor_pos[1] + move[1]]
    end

    valid.select { |coords| coords.all? { |i| i.between?(0,7) } }
  end

  def move_into_check?(to_position)
  end
end
