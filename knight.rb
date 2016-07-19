require_relative 'stepable.rb'

class Knight < Piece
  include Stepable



  MOVES = {
    left_up: [-1, -2],
    left_down: [1, -2],
    right_up: [-1, 2],
    right_down: [1, 2],
    up_left: [-2, -1],
    up_right: [-2, 1],
    down_left: [2, -1]
    down_right: [2, 1]
  }

  def symbol
  end

  def move_diffs

  end
end
