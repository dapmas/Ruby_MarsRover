class Rover
  attr_accessor :rover

  def initialize(input, grid)
    @grid = grid

    @rover = {
      x: input.shift.to_i,
      y: input.shift.to_i,
      dir: input.shift
    }

    @instruction = input.join.split(//)
  end

  def act(action)
    case action
      when 'R' then rotate_right
      when 'L' then rotate_left
      when 'M' then move
    end
  end

  def instructions
    while (action = @instruction.shift)
      act(action)
    end
  end

  def to_s
    "#{@rover[:x]} #{@rover[:y]} #{@rover[:dir]}"
  end

  private

  def rotate_right
    @rover[:dir] = case @rover[:dir]
      when 'N' then 'E'
      when 'E' then 'S'
      when 'S' then 'W'
      when 'W' then 'N'
    end
  end

  def rotate_left
    @rover[:dir] = case @rover[:dir]
      when 'N' then 'W'
      when 'E' then 'N'
      when 'S' then 'E'
      when 'W' then 'S'
    end
  end

  def move
    x, y = case @rover[:dir]
      when 'N' then [0, 1]
      when 'E' then [1, 0]
      when 'S' then [0, -1]
      when 'W' then [-1, 0]
    end

    new_x = @rover[:x] + x
    new_y = @rover[:y] + y

    if @grid.is_inside?(new_x, new_y)
      @rover[:x] = new_x
      @rover[:y] = new_y

    end
  end
end
