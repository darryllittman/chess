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
    # dx, dy = @position
    # grow_unblocked_moves_in_dir(dx, dy)
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
      hor_moves << [i + 1, dy]
    end

    (-1...dx-1).each do |i|
      hor_moves << [i + 1, dy]
    end

    (dy...7).each do |i|
      hor_moves << [dx, i + 1]
    end

    (-1...dy-1).each do |i|
      hor_moves << [dx, i + 1]
    end

    hor_moves
  end

  def diagonal_dirs
    dx, dy = @position
    # @moves ||= []
    diag_moves = []
    i = 1
    #down_right
    while (dx + i).between?(0, 7) && (dy + i).between?(0, 7)
      diag_moves << [(dx + i), (dy + i)]
      i += 1
    end
    # #up_left
    i = 1
    while (dx - i).between?(0, 7) && (dy - i).between?(0, 7)
      diag_moves << [(dx - i), (dy - i)]
      i += 1
    end

    #up_right
    i = 1
    while (dx - i).between?(0, 7) && (dy + i).between?(0, 7)
      diag_moves << [(dx - i), (dy + i)]
      i += 1
    end
    #down_left
    i = 1
    while (dx + i).between?(0, 7) && (dy - i).between?(0, 7)
      diag_moves << [(dx + i), (dy - i)]
      i += 1
    end

    diag_moves.uniq
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    # moves = []
    # (dx...7).each do |i|
    #   moves << [i + 1, dy]
    # end
    #
    # (0...dx-1).each do |i|
    #   moves << [i + 1, dy]
    # end
    #
    # (dy...7).each do |i|
    #   moves << [dx, i + 1]
    # end
    #
    # (0...dy-1).each do |i|
    #   moves << [dx, i + 1]
    # end
    #
    # moves
  end
end
