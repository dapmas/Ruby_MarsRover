require 'enumerator'
require File.expand_path('../rover', __FILE__)

class Grid
  attr_accessor :cell_x, :cell_y, :rovers

  def initialize(input)
    @attributes = input.split
    @rovers = []

    parse_grid
    parse_rovers
  end

  def move_rovers
    @rovers.each &:instructions
  end


  def to_s
    strings = @rovers.each(&:to_s).join("\n")
  end

  def is_inside?(x, y)
    x >= 0 and x <= @cell_x and
    y >= 0 and y <= @cell_y
  end

  private

  def parse_grid
    @cell_x = @attributes.shift.to_i
    @cell_y = @attributes.shift.to_i
  end

  def parse_rovers
    @attributes.each_slice(4) do |x, y, dir, instruction|
      @rovers << Rover.new([x, y, dir, instruction], self)
    end
  end
end
