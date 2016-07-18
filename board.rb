require_relative 'empty_piece'
class Board
  attr_accessor :board

  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end
end
