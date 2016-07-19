require 'singleton'
require_relative 'piece'
require 'colorize'

class EmptyPiece
  include Singleton

  def move

  end

  def color

  end

  def symbol
    "#"
  end

  def to_s

  end

  def empty?

  end
end
