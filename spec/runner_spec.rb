require 'runner'
require 'board'
require 'game'
require 'configuration'

describe Runner do

  let(:runner) { Runner.new(ui) }
  let(:ui)     { double.as_null_object }

  it "starts up the game" do
    runner.should_receive(:start_game)
    runner.start_game
  end
end