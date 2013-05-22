require 'runner'
require 'board'
require 'io'
require 'game'

describe Runner do
  it "calls the play_game method with board, io, and game classes to start the game" do
    runner = Runner.new
    board = Board.new
    io = Io.new
    game = Game.new(board, io)
    game.should_receive(:play_game)
    io.should_receive(:get_input)
    runner.start_game
  end  
end
