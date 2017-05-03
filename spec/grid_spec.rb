require File.expand_path('../../lib/grid', __FILE__)

describe Grid, "behaviour" do
  let (:input) { "5 5\n1 2 N\nLMLMLMLMM 3 3 E MMRMMRMRRM" }

  before :each do
    @grid = Grid.new input
  end

  it "initializes_correctly" do
    expect(@grid).not_to be_nil
    #@grid.should_not be_nil
  end

  it "sets up the grid map" do

    expect(@grid.cell_x).to eq(5)
    expect(@grid.cell_y).to eq(5)
    #@grid.cell_x.should eq(5)
    #@grid.cell_y.should eq(5)
  end

  it "sets the rovers to their initial state" do
    expect(@grid.rovers.count).to eq(2)
    #@grid.rovers.count.should eq(2)
    expect(@grid.rovers[0].rover).to eq(x: 1, y: 2, dir: 'N')
    expect(@grid.rovers[1].rover).to eq(x: 3, y: 3, dir: 'E')
  end

  it "move the rovers according to the instruction" do
    @grid.move_rovers
    expect(@grid.rovers[0].rover).to eq(x: 1, y: 3, dir: 'N')
    expect(@grid.rovers[1].rover).to eq(x: 5, y: 1, dir: 'E')
  end

  it "prints out the final position of the rover" do
    @grid.move_rovers
    expect(@grid.to_s).to eq("1 3 N\n5 1 E")
  end
end
