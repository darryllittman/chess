require_relative 'piece'
require_relative 'stepable'
require_relative 'board'

class King < Piece
  include Stepable

  MOVES = { left: [0, -1],
            left_up: [-1, -1],
            up: [-1, 0],
            up_right: [-1, 1],
            right: [0, 1],
            down_right: [1, 1],
            down: [1, 0],
            down_left: [1, -1]
  }

  def symbol
  end

  def moves
    moves = []

    valid = MOVES.map do |direction, coords|
      if [@position[0] + coords[0], @position[1] + coords[1]].all? { |i| i.between?(0,7) }
        moves << [@position[0] + coords[0], @position[1] + coords[1]]
      end
    end

    moves
  end
end
