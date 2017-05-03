require File.expand_path('../../lib/grid', __FILE__)
require File.expand_path('../../lib/rover', __FILE__)

describe Rover, "behaviour" do
  let (:input) { ['1', '2', 'N', 'LMLMLMLMM'] }

  before :each do
    @grid = Grid.new "5 5\n1 2 N\nLMLMLMLMM 3 3 E MMRMMRMRRM"
    @rover = Rover.new input, @grid
  end

  it "turns the rover left when L instruction is given" do
    @rover.act 'L'
    expect(@rover.rover[:dir]).to eq('W')
  end

  it "turns the rover left when R instruction is given" do
    @rover.act 'R'
    expect(@rover.rover[:dir]).to eq('E')
  end

  it "moves to the required next cell when M instruction is given" do
    @rover.act 'M'
    expect(@rover.rover[:x]).to eq(1)
    expect(@rover.rover[:y]).to eq(3)

    @rover.act 'R'
    @rover.act 'M'
    expect(@rover.rover[:x]).to eq(2)
    expect(@rover.rover[:y]).to eq(3)

    @rover.act 'R'
    @rover.act 'M'
    expect(@rover.rover[:x]).to eq(2)
    expect(@rover.rover[:y]).to eq(2)

    @rover.act 'R'
    @rover.act 'M'
    expect(@rover.rover[:x]).to eq(1)
    expect(@rover.rover[:y]).to eq(2)
  end

  it " tells the rover to follow the instructions" do
    @rover.instructions
    expect(@rover.rover).to eq(x: 1, y: 3, dir: 'N')
  end

  it "converts to string" do
    @rover.instructions
    expect(@rover.to_s).to eq('1 3 N')
  end

  it "checks the boundary of the grid" do
    5.times { @rover.act 'M' }
    @rover.act 'R'
    5.times { @rover.act 'M' }

    expect(@rover.rover).to eq(x: 5, y: 5, dir: 'E')

    @rover.act 'R'
    8.times { @rover.act 'M' }
    @rover.act 'R'
    8.times { @rover.act 'M' }

    expect(@rover.rover).to eq(x: 0, y: 0, dir: 'W')
  end
end
