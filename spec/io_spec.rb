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
    io.print_turn('X').should == "It is X's turn"
  end

  it "should return 'X'" do
    board = ['X', 'O', '3', '4', '5', '6', '7', '8', '9']
    runner = Runner.new
    marker_type = runner.whos_turn?(board)
    marker_type.should == 'X'
  end

end
