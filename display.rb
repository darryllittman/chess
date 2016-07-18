require 'colorize'
require_relative 'cursorable'
require_relative 'board'
require 'byebug'

class Display
  include Cursorable
  attr_reader :board, :cursor, :selected

  def initialize(board)
    @board = board
    @cursor_pos = [4,4]
    @selected = false
  end

  def user_input

    @cursor_pos = get_input

  end

  def render
    to_display = []
    new_a = []
    @board.grid.each_with_index do |row, i|
      to_display = []
      row.each_with_index do |col, j|
        to_display << @board[[i, j]].symbol
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
  p a.get_input



end