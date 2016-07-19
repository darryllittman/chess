require_relative 'slideable'
require_relative 'piece'
require_relative 'board'

class Queen < Piece
  include Slideable

  def initialize(color, board, position)
    @horizontal = true
    @diagonal = true
    super
  end


  def symbol
  end

  def move_dirs

  end
end
