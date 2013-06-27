require "board"

describe Board do

  it "(re)sets board to initial state" do
    board = Board.new
    board.reset_board.should == ['1', '2', '3', 
                                 '4', '5', '6', 
                                 '7', '8', '9']
  end
	
	it "returns an array of 9 board places" do
		board_class = Board.new
		board_class.current_board.should == ['1', '2', '3', 
		                                     '4', '5', '6', 
		                                     '7', '8', '9']
	end
		
  it "returns 6 as the number of empty squares" do
    board = Board.new
    board.current_board = ['X', 'O', 'X', 
                           '4', '5', '6', 
                           '7', '8', '9']
    board.empty_squares.should == 6
  end
	
 it "returns false if square 1 is marked" do
    board_class = Board.new
    board_class.current_board = ['X', '2', '3', 
                                 '4', '5', '6', 
                                 '7', '8', '9']
    board_class.square_empty?(1).should == false
  end  

  it "returns true if square 1 is empty" do
    board_class = Board.new
    board_class.current_board = ['1', '2', '3', 
                                 '4', '5', '6', 
                                 '7', '8', '9']
    board_class.square_empty?(1).should == true
  end
  
  it "returns array of squares that are open" do
    board = Board.new
    board.current_board = ['X', 'O', 'O', 
                           'X', 'X', 'O', 
                           'X', 'X', '9']
    board.list_of_open_squares.should == ['9']  
  end

  it "returns array of squares that are open" do
    board = Board.new
    board.current_board = ['1', '2', 'O', 
                           'X', 'X', 'O', 
                           'X', '8', '9']
    board.list_of_open_squares.should == ['1', '2', '8', '9']  
  end
  
  it "returns an empty array if no squares are open" do
    board = Board.new
    board.current_board = ['X', 'O', 'O', 
                           'X', 'X', 'O', 
                           'X', 'X', 'X']
    board.list_of_open_squares.should == []  
  end
  
  it "returns true if there is an open square on the board" do
    board = Board.new
    board.reset_board
    board.board_open?.should == true
  end

  it "returns false if there are no open squares on the board" do
    board = Board.new
    board.current_board = ['X', 'O', 'O', 
                           'X', 'X', 'O', 
                           'X', 'X', 'O']
    board.board_open?.should == false  
  end

  it "returns false if board is tied" do
    board = Board.new
    board.current_board = ['X', 'O', 'X', 
                           'O', 'O', 'X', 
                           'X', 'X', 'O']
    board.board_open?.should == false
  end

  it "returns marker type of winner on board" do
    board = Board.new
    board.current_board = ['1', '2', '3', 
                           '4', '5', '6', 
                           'X', 'X', 'X']
    board.winner_on_board?.should == 'X'
  end
        
  it "returns false if there is no winner on board" do
    board = Board.new
    board.current_board = ['1', '2', '3', 
                           '4', '5', '6', 
                           'O', 'X', 'X']
    board.winner_on_board?.should == false
  end
  
  it "returns the number of markers present on board" do
    board = Board.new
    board.current_board = ['1', '2', '3', 
                           '4', '5', '6', 
                           'O', 'X', 'X']
    board.number_of_filled_squares.should == 3
  end
  
  it "creates a square board of any size" do
    board = Board.new
    board.board_width = 4
    board.squares_with_integers.should == ['1', '2', '3', '4', 
                                           '5', '6', '7', '8', 
                                           '9', '10', '11', '12', 
                                           '13', '14', '15', '16']
  end
  
  it "returns square board to be printed of any size" do
    board = Board.new
    board.display_board.should == " 1 | 2 | 3 \n"\
                                  "---|---|---\n"\
                                  " 4 | 5 | 6 \n"\
                                  "---|---|---\n"\
                                  " 7 | 8 | 9 \n"
  end
  
  it "undoes the placement of a marker" do
    board_class = Board.new
    board_class.current_board = ['X', '2', '3', 
                                 '4', '5', '6', 
                                 '7', '8', '9']
    board_class.undo_set_square(1)
    board_class.current_board.should == ['1', '2', '3', 
                                         '4', '5', '6', 
                                         '7', '8', '9']
  end
    
  it "sets the width of the board" do
    board = Board.new
    width = 3
    board.board_width.should == 3
  end

  it "makes a blank board" do
      board = Board.new
      board.reset_board.should == ['1', '2', '3', 
                                   '4', '5', '6', 
                                   '7', '8', '9']
  end
  
  it "returns true if game is over" do
    board = Board.new
    board.current_board = ['X', 'O', 'O', 
                           'X', 'X', 'O', 
                           'X', 'X', 'X']
    board.game_over?.should == true    
  end
  
  it "returns true if game is won by a given marker" do
    board = Board.new
    board.current_board = ['X', 'O', 'O', 
                           'X', 'X', 'O', 
                           'X', 'X', 'X']
    board.game_won?('X').should == true    
  end
end
