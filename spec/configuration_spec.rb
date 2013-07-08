require 'configuration'
require 'board'
require 'io'


describe Configuration do
  before do
    board = Board.new
    io = Io.new
    ai = Ai.new(board)
    game = Game.new(board, io, ai)
    configuration = Configuration.new(board,ai,game)
  end

  it "configures board width" do
    board = Board.new
    io = mock.as_null_object
    ai = Ai.new(board)
    game = Game.new(board, io, ai)
    configuration = Configuration.new(board,ai,game)
#     configuration.configure_width
#     game.io.should_receive(:get_width_of_board)
#     game.io.should_receive(:get_input)
  end

  it "asks for and receives opponent type" do
#     io.should_receive(:ask_for_opponent)
#     io.should_receive(:get_input)
#     configuration.configure_opponent
  end

  it "configures the type of game pieces used" do
#     io.should_receive(:ask_for_marker_type)
#     io.should_receive(:get_marker_type)
#    configuration.configure_markers
  end
  
  it "rejects integers as game pieces" do
    
  end
  
  it "rejects input longer than one character" do
  
  end


end