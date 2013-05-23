require 'runner'
require 'board'
require 'io'
require 'game'

describe Runner do
  it "calls the play_game method with board, io, and game classes to start the game" do
    runner = Runner.new
    runner.should_receive(:start_game)
    runner.start_game
  end  
end
