require "board"

describe Board do

  it "should (re)set board to initial state" do
    board = Board.new
    board.reset_board.should == ['1', '2', '3', '4', '5', '6', '7', '8', '9']
  end
	
	it "should return an array of 9 board places" do
		board = Board.new
		board.get_state_of_board.should == ['1', '2', '3', '4', '5', '6', '7', '8', '9']
	end
	
	
  board = Board.new
  [
    [1, '1'],
    [2, '2'],
    [3, '3'],
    [4, '4'],
    [5, '5'],
    [6, '6'],
    [7, '7'],
    [8, '8'],
    [9, '9'],
    [10, nil],
  ].each do |square, state|
    it "should check the state of each #{square}" do
	    board.get_state_of_square(square).should == state
    end
	end

# Should this class be moved to the Player class?
	board = Board.new
  [
    [1, "X"],
    [2, "O"],
    [3, "X"],
    [4, "X"],
    [5, "X"],
    [6, "X"],
    [7, "X"],
    [8, "X"],
    [9, "X"],
  ].each do |square, state|
    it "should set state of each #{square} to #{state}" do
	    board.set_square(square, state)
	    board.get_state_of_square(square).should == state
    end
	end
	
 it "should return false if square 1 is marked" do
    board = Board.new
    runner = Runner.new
    runner.take_turn(1, 'X')
    board_with_marked_square_one = runner.get_board.get_state_of_board
    board.square_empty?(board_with_marked_square_one, 1).should == false
  end  

  it "should return true if square 1 is empty" do
    empty_square = 1
    runner = Runner.new
    board = Board.new
    current_state_of_board = board.get_state_of_board
    board.square_empty?(current_state_of_board, empty_square).should == true
  end
  
end
