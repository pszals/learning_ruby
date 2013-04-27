require 'io'
require 'board'
require 'runner'

describe Io do
  it "should print the first row of current state of the board" do
    board = Board.new
    io = Io.new(board)
    io.print_row_one.should == "1 2 3\n"
  end
  
  it "should print the second row of current state of the board" do
    board = Board.new
    io = Io.new(board)
    io.print_row_two.should == "4 5 6\n"  
  end

  it "should print the third row of current state of the board" do
    board = Board.new
    io = Io.new(board)
    io.print_row_three.should == "7 8 9"
  end
  
#  it "should print the whole board" do
#    board = Board.new
#    io = Io.new(double)
#    io.should_receive(:put_to_console).with("1 2 3\n4 5 6\n7 8 9")
#    io.puts_whole_board
#  end
  
  it "should print 'It's X's turn" do
    io = Io.new(double)
    io.should_receive(:put_to_console).with("It is X's turn")
    io.puts_turn("X")
  end
  
  it "should get the square number to be marked from user" do
    io = Io.new(double)
    io.should_receive(:get_input)
    io.get_square
  end

  it "prints error message if square is marked or improper input" do
    io = Io.new(double)
    io.should_receive(:put_to_console).with('That is either not a square on the board or that square is filled')
    io.marker_error
  end
  
  it "prints the winning piece" do
    io = Io.new(double)
    io.should_receive(:put_to_console).with("Player X wins")
    io.puts_winner("X")
  end
  
  it "asks for first to play" do
    io = Io.new(double)    
    io.should_receive(:put_to_console).with("Enter 'X' or 'O'")
    io.ask_for_first_player?
  end
  
  it "gets player type of first player" do
    io = Io.new(double)
    io.should_receive(:get_input)
    io.get_first_player
  end  
  
  it "asks for 1 to restart or any key to exit" do
    io = Io.new(double)
    io.should_receive(:put_to_console).with("Enter 1 to restart or any key to exit")
    io.ask_to_restart?
  end
  
end
