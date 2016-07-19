require_relative 'board'
require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
  include Slideable

  def initialize(color, board, position)
    @horizontal = true
    @diagonal = false
    super
  end

  def symbol
  end

  def move_dirs
  end
end
