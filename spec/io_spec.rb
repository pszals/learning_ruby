require 'io'
require 'board'

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
  
  it "should print the whole board" do
    board = Board.new
    io = Io.new(board)
    io.print_whole_board.should == "1 2 3\n4 5 6\n7 8 9"    
  end
  
  it "should query user for square on board to be marked" do
    board = Board.new
    io = Io.new(board)
    user_input = 1
    io.square_to_mark(user_input).should == 1
  end
  
  it "should print 'It's X's turn" do
    board = ['X', 'O', '3', '4', '5', '6', '7', '8', '9']
    io = Io.new(board)
    runner = Runner.new
    marker_type = runner.whos_turn?(board)
#    STDOUT.should_receive(:puts).with("It is X's turn")
    io.print_turn(marker_type).should == "It is X's turn"
  end

  it "should return 'X'" do
    board = ['X', 'O', '3', '4', '5', '6', '7', '8', '9']
    runner = Runner.new
    marker_type = runner.whos_turn?(board)
    marker_type.should == 'X'
  end
  
#  it "should get the square number to be marked from user" do
#    board = Board.new
#    io = Io.new(board)
#    user_input = 1
#    io.get_square(1).should == 1
#  end

  it "should print the winning marker type of the game" do
    board = ['X', 'X', 'X', 'O', 'O', '6', '7', '8', '9']
    io = Io.new(board)
    runner = Runner.new
    winning_marker = runner.winner_name(board)
    io.print_winner(winning_marker).should == 'Player X wins'
  end

  it "should print the winning marker type of the game" do
    board = ['O', 'O', 'O', 'X', 'X', '6', '7', '8', '9']
    io = Io.new(board)
    runner = Runner.new
    winning_marker = runner.winner_name(board)
    io.print_winner(winning_marker)
    STDOUT.should_recieve(:print).with("Player X wins")
  end

end
