require 'colorize'
require_relative 'cursorable'
require_relative 'board'
require 'byebug'
require_relative 'knight'
require_relative 'piece'

class Display
  include Cursorable
  attr_reader :board, :cursor_pos, :selected

  def initialize(board)
    @board = board
    @cursor_pos = [0, 0]
    @selected = false
  end

  def render
    to_display = []
    new_a = []
    @board.grid.each_with_index do |row, i|
      to_display = []
      row.each_with_index do |col, j|
        if [i,j] == @cursor_pos
          to_display << @board[[i, j]].symbol.colorize(:red)
        else
          to_display << @board[[i, j]].symbol
        end
        to_display.join("")
      end
      new_a << to_display
    end

    new_a.each do |line|
      puts line.join("")
    end
  end
end


if __FILE__ == $PROGRAM_NAME

  a = Display.new(Board.new)
  # until a.get_input
  #
  #   a.get_input
  #   a.render
  #   p a.selected
  # end
  knight = Knight.new("white", Board.new, [0,0])
  p knight.valid_moves

end
