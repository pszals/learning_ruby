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
    runner.place_marker(1, 'X')
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
  
  it "should return true if there is an open square on the board" do
    board = Board.new
    mock_board = board.reset_board
    board.board_open?(mock_board).should == true
  end

  it "should return false if there are no open squares on the board" do
    board = Board.new
    mock_board = ['X', 'O', 'O', 'X', 'X', 'O', 'X', 'X', 'O']
    board.board_open?(mock_board).should == false  
  end

  it "should return false if board is tied" do
    board = Board.new
    mock_board = ['X', 'O', 'X', 'O', 'O', 'X', 'X', 'X', 'O']
    board.board_open?(mock_board).should == false
  end

  it "should return marker type of winner on board" do
    board = Board.new
    mock_board = ['1', '2', '3', '4', '5', '6', 'X', 'X', 'X']
    board.winner_on_board?(mock_board).should == 'X'
  end
        
  it "should return false if there is no winner on board" do
    board = Board.new
    mock_board = ['1', '2', '3', '4', '5', '6', 'O', 'X', 'X']
    board.winner_on_board?(mock_board).should == false
  end
  
  it "should return the number of markers present on board" do
    board = Board.new
    mock_board = ['1', '2', '3', '4', '5', '6', 'O', 'X', 'X']
    board.number_of_markers(mock_board).should == 3
  end
  
  it "should create a square board of any size" do
    board = Board.new
    board.any_size_board(4).should == ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16']
  end
  
  it "should return square board of any size" do
    board = Board.new
    board.any_size_string_board(board.any_size_board(3)).should == "1 2 3\n4 5 6\n7 8 9\n"
  end
  
  it "should return top row of square board of any size + linefeed" do
    board = Board.new
    board.top_row_any_size_string_board(board.any_size_board(3)).should == "1 2 3\n"
  end  
  
  it "should set the width of the board" do
    board = Board.new
    width = 3
    board.set_width_of_board(width).should == 3
  end
 
end
