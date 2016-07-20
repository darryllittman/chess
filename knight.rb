require_relative 'stepable.rb'
require_relative 'piece'
require_relative 'board'

class Knight < Piece
  include Stepable

  MOVES = {
    left_up: [-1, -2],
    left_down: [1, -2],
    right_up: [-1, 2],
    right_down: [1, 2],
    up_left: [-2, -1],
    up_right: [-2, 1],
    down_left: [2, -1],
    down_right: [2, 1]
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
