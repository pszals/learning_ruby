require "board"

describe Board do

  it "should (re)set board to initial state" do
    board = Board.new
    board.reset_board.should == ['1', '2', '3', '4', '5', '6', '7', '8', '9']
  end
	
	it "should return an array of 9 board places" do
		board_class = Board.new
		board_class.current_board.should == ['1', '2', '3', '4', '5', '6', '7', '8', '9']
	end
		
  it "should return 6 as the number of empty squares" do
    board = Board.new
    board.current_board = ['X', 'O', 'X', '4', '5', '6', '7', '8', '9']
    board.number_of_empty_squares.should == 6
  end
	
 it "should return false if square 1 is marked" do
    board_class = Board.new
    board_class.current_board = ['X', '2', '3', '4', '5', '6', '7', '8', '9']
    board_class.square_empty?(1).should == false
  end  

  it "should return true if square 1 is empty" do
    board_class = Board.new
    board_class.current_board = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
    board_class.square_empty?(1).should == true
  end
  
  it "should return true if there is an open square on the board" do
    board = Board.new
    board.reset_board
    board.board_open?.should == true
  end

  it "should return false if there are no open squares on the board" do
    board = Board.new
    board.current_board = ['X', 'O', 'O', 'X', 'X', 'O', 'X', 'X', 'O']
    board.board_open?.should == false  
  end

  it "should return false if board is tied" do
    board = Board.new
    board.current_board = ['X', 'O', 'X', 'O', 'O', 'X', 'X', 'X', 'O']
    board.board_open?.should == false
  end

  it "should return marker type of winner on board" do
    board = Board.new
    board.current_board = ['1', '2', '3', '4', '5', '6', 'X', 'X', 'X']
    board.winner_on_board?.should == 'X'
  end
        
  it "should return false if there is no winner on board" do
    board = Board.new
    board.current_board = ['1', '2', '3', '4', '5', '6', 'O', 'X', 'X']
    board.winner_on_board?.should == false
  end
  
  it "should return the number of markers present on board" do
    board = Board.new
    board.current_board = ['1', '2', '3', '4', '5', '6', 'O', 'X', 'X']
    board.number_of_markers.should == 3
  end
  
  it "should create a square board of any size" do
    board = Board.new
    board.board_width = 4
    board.squares_with_integers.should == ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16']
  end
  
  it "should return square board to be printed of any size" do
    board = Board.new
    board.board_to_string.should == "1 2 3\n4 5 6\n7 8 9\n"
  end
    
  it "should set the width of the board" do
    board = Board.new
    width = 3
    board.board_width.should == 3
  end

  it "should make a good clean new board" do
      board = Board.new
      board.reset_board.should == ['1', '2', '3', '4', '5', '6', '7', '8', '9']
  end
end
