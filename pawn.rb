require_relative 'piece'
require_relative 'stepable'
require_relative 'slideable'
require_relative 'board'

class Pawn < Piece
include Stepable
include Slideable



  def symbol
  end

  def moves
    forward_dir
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
  end
end
