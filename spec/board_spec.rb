require "board"

describe Board do

  it "should (re)set board to initial state" do
    board = Board.new
    board.reset_board.should == (1..9).to_a
  end
	
	it "should return an array of 9 board places" do
		board = Board.new
		board.get_state_of_board.should == [1,2,3,4,5,6,7,8,9]
	end
	
	
  board = Board.new
  [
    [1, 1],
    [2, 2],
    [3, 3],
    [4, 4],
    [5, 5],
    [6, 6],
    [7, 7],
    [8, 8],
    [9, 9],
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
end
