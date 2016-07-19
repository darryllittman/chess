require_relative 'board'

module Stepable

  def moves

  end

  def own_piece?(position)
    #true if position passed in has its own piece
    debugger
    # p @board[position].class
    p @color
    @board[position].color == @color
  end

  private
  def move_diffs

  end
end
