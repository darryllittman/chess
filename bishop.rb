require_relative 'slideable'
require_relative 'piece'
require_relative 'board'

class Bishop < Piece
  include Slideable


  def initialize(color, board, position)
    @diagonal = true

    super
  end

  def symbol
  end

  def move_dirs
  end
end
