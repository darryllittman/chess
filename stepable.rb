require_relative 'board'

module Stepable

  def moves

  end

  def own_piece?(position)
    @board[position].color == @color
  end

  private
  def move_diffs

  end
end
