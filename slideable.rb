require 'byebug'

module Slideable
  attr_accessor :moves

  HOR_MOVES = {
    left: [0,-1],
    up: [-1, 0],
    right: [0,1],
    down: [1,0]
  }

  DIA_MOVES = {
    down_right: [1,1],
    left_up: [-1, -1],
    down_left: [1,-1],
    up_right: [-1,1]
  }

  def moves
    possible_moves = []

    if @horizontal
      possible_moves += horizontal_dirs
    end

    possible_moves += diagonal_dirs if @diagonal
    possible_moves
  end

  private
  def move_dirs

  end



  def horizontal_dirs
    dx, dy = @position
    hor_moves = []
    (dx...7).each do |i|
        if @board[[i + 1, dy]].class != EmptyPiece
          if @board[[i + 1, dy]].color != @color
            hor_moves << [i + 1, dy]
            break
          else
            break
          end
        end

        hor_moves << [i + 1, dy]
    end

    (-1...dx-1).each do |i|
      if @board[[i + 1, dy]].class != EmptyPiece
        if @board[[i + 1, dy]].color != @color
          hor_moves << [i + 1, dy]
          break
        else
          break
        end
      end

      hor_moves << [i + 1, dy]
    end

    (dy...7).each do |i|
      if @board[[dx, 1 + i]].class != EmptyPiece
        if @board[[dx, 1 + i]].color != @color
          hor_moves << [dx, 1 + i]
          break
        else
          break
        end
      end

      hor_moves << [dx, i + 1]
    end

    (-1...dy-1).each do |i|
      if @board[[dx, 1 + i]].class != EmptyPiece
        if @board[[dx, 1 + i]].color != @color
          hor_moves << [dx, 1 + i]
          break
        else
          break
        end
      end

      hor_moves << [dx, i + 1]
    end

    hor_moves
  end

  def diagonal_dirs
    dx, dy = @position
    diag_moves = []
    i = 1


    while (dx + i).between?(0, 7) && (dy + i).between?(0, 7)
      if @board[[dx + i, dy + i]].class != EmptyPiece
        if @board[[dx + i, dy + i]].color != @color
          diag_moves << [dx + i, dy + i]
          break
        else
          break
        end
      end

      diag_moves << [dx + i, dy + i]
      i += 1
    end
    i = 1


    while (dx - i).between?(0, 7) && (dy - i).between?(0, 7)
      if @board[[dx - i, dy - i]].class != EmptyPiece
        if @board[[dx - i, dy - i]].color != @color
          diag_moves << [dx - i, dy - i]
          break
        else
          break
        end
      end

      i += 1
    end


    i = 1
    while (dx - i).between?(0, 7) && (dy + i).between?(0, 7)
      if @board[[dx - i, dy + i]].class != EmptyPiece
        if @board[[dx - i, dy + i]].color != @color
          diag_moves << [dx - i, dy + i]
          break
        else
          break
        end
      end

      i += 1
    end

    i = 1
    while (dx + i).between?(0, 7) && (dy - i).between?(0, 7)
      if @board[[dx + i, dy - i]].class != EmptyPiece
        if @board[[dx + i, dy - i]].color != @color
          diag_moves << [dx + i, dy - i]
          break
        else
          break
        end
      end
      i += 1
    end


    diag_moves.uniq
  end

  def grow_unblocked_moves_in_dir(dx, dy)
  end
end
