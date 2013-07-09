require 'runner'
require 'board'
require 'io'
require 'game'
require 'configuration'

describe Runner do

  let(:runner) { Runner.new }

  it "starts up the game" do
    runner.should_receive(:start_game)
    runner.start_game
  end  
end
