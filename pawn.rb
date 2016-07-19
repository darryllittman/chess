require_relative 'piece'
require_relative 'stepable'
require_relative 'slideable'
require_relative 'board'
require 'byebug'

class Pawn < Piece
include Stepable
include Slideable



  def symbol
  end

  def moves
    forward_dir.concat(side_attacks)
  end



  protected
  def at_start_row?
    if @color == :black
      @position[0] == 1
    elsif @color == :white
      @position[0] == 6
    else
      false
    end
  end

  # def forward_dir
  # end

  def forward_dir
    dx, dy = @position
    vert_moves = []
    if @color == :black
      vert_moves << [dx + 1, dy] unless dx + 1 > 7
      vert_moves << [dx + 2, dy] if at_start_row?
    else
      vert_moves << [dx - 1, dy] unless dx - 1 < 0
      vert_moves << [dx - 2, dy] if at_start_row?
    end

    vert_moves
  end

  def forward_steps

  end

  def side_attacks
    vert = []
    dx, dy = @position

    b_right = @board[[dx + 1, dy + 1]].class
    b_left = @board[[dx + 1, dy - 1]].class
    w_right = @board[[dx - 1, dy + 1]].class
    w_left = @board[[dx -  1, dy - 1]].class

    vert << [dx+1, dy+1] if b_right != EmptyPiece && :black
    vert << [dx+1, dy-1] if b_left != EmptyPiece && :black

    vert << [dx-1, dy+1] if w_left != EmptyPiece && :white
    vert << [dx-1, dy-1] if w_left != EmptyPiece && :white

    vert
  end
end
