require 'runner'
require 'board'
require 'io'
require 'game'

describe Runner do
  it "starts up the game" do
    runner = Runner.new
    runner.should_receive(:start_game)
    runner.start_game
  end  
end
