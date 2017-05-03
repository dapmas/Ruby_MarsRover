require File.expand_path('../../lib/grid', __FILE__)
class App
  def initialize(type, input = "")
    @type = type
    @input = input
  end

  def run
    if @type == :testcase
      grid = Grid.new @input

    else
      input = STDIN.read
      puts input
      grid = Grid.new input
    end

    grid.move_rovers

    puts grid
  end
end
