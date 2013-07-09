require "board"
require "player"

describe Board do

  let(:player_1) { Player.new('X')               }
  let(:player_2) { Player.new('O')               }
  let(:board)    { Board.new(player_1, player_2) }
    
  it "gets whose turn" do
    board.whose_turn.should == 'X'  
  end
  
  it "gets opponent's marker" do
    board.get_opponent.should == 'O'  
  end

  it "(re)sets board to initial state" do

    board.reset_board.should == ['1', '2', '3', 
                                 '4', '5', '6', 
                                 '7', '8', '9']
  end
	
	it "returns an array of 9 board places" do
		board.current_board.should == ['1', '2', '3', 
		                               '4', '5', '6', 
		                               '7', '8', '9']
	end
		
  it "returns 6 as the number of empty squares" do
    board.current_board = ['X', 'O', 'X', 
                           '4', '5', '6', 
                           '7', '8', '9']
    board.empty_squares.should == 6
  end
	
 it "returns false if square 1 is marked" do
    board.current_board = ['X', '2', '3', 
                           '4', '5', '6', 
                           '7', '8', '9']
    board.square_empty?(1).should == false
  end  

  it "returns true if square 1 is empty" do
    board.current_board = ['1', '2', '3', 
                           '4', '5', '6', 
                           '7', '8', '9']
    board.square_empty?(1).should == true
  end
  
  it "returns array of squares that are open" do
    board.current_board = ['X', 'O', 'O', 
                           'X', 'X', 'O', 
                           'X', 'X', '9']
    board.list_of_open_squares.should == ['9']  
  end

  it "returns array of squares that are open" do
    board.current_board = ['1', '2', 'O', 
                           'X', 'X', 'O', 
                           'X', '8', '9']
    board.list_of_open_squares.should == ['1', '2', '8', '9']  
  end
  
  it "returns an empty array if no squares are open" do
    board.current_board = ['X', 'O', 'O', 
                           'X', 'X', 'O', 
                           'X', 'X', 'X']
    board.list_of_open_squares.should == []  
  end
  
  it "returns true if there is an open square on the board" do
    board.reset_board
    board.board_open?.should == true
  end

  it "returns false if there are no open squares on the board" do
    board.current_board = ['X', 'O', 'O', 
                           'X', 'X', 'O', 
                           'X', 'X', 'O']
    board.board_open?.should == false  
  end

  it "returns false if board is tied" do
    board.current_board = ['X', 'O', 'X', 
                           'O', 'O', 'X', 
                           'X', 'X', 'O']
    board.board_open?.should == false
  end

  it "returns marker type of winner on board" do
    board.current_board = ['1', '2', '3', 
                           '4', '5', '6', 
                           'X', 'X', 'X']
    board.winner_on_board?.should == 'X'
  end
  
  it "returns marker type of winner on board" do
    board.width = 4
    board.current_board = [ 'X', 'X', 'X', 'X', 
                            'X', '6', '7', '8', 
                            'X', '10', '11', '12', 
                            'X', '14', '15', '16']
    board.winner_on_board?.should == 'X'
  end

        
  it "returns false if there is no winner on board" do
    board.current_board = ['1', '2', '3', 
                           '4', '5', '6', 
                           'O', 'X', 'X']
    board.winner_on_board?.should == false
  end
  
  it "returns the number of markers present on board" do
    board.current_board = ['1', '2', '3', 
                           '4', '5', '6', 
                           'O', 'X', 'X']
    board.number_of_filled_squares.should == 3
  end
  
  it "creates a 16-square board with a given width of 4" do
    board.width = 4
    board.squares_with_integers.should == ['1', '2', '3', '4', 
                                           '5', '6', '7', '8', 
                                           '9', '10', '11', '12', 
                                           '13', '14', '15', '16']
  end
  
  it "returns square board to be printed of 3x3 size" do
    board.display_board.should == " 1 | 2 | 3 \n"\
                                  "---|---|---\n"\
                                  " 4 | 5 | 6 \n"\
                                  "---|---|---\n"\
                                  " 7 | 8 | 9 \n"
  end

  it "returns square board to be printed of 4x4 size" do
    board.width = 4
    board.current_board = board.squares_with_integers
    board.display_board.should == 
                                  " 1 | 2 | 3 | 4 \n"\
                                  "---|---|---|---\n"\
                                  " 5 | 6 | 7 | 8 \n"\
                                  "---|---|---|---\n"\
                                  " 9 | 10 | 11 | 12 \n"\
                                  "---|---|---|---\n"\
                                  " 13 | 14 | 15 | 16 \n"
  end

#   it "returns square board to be printed of 4x4 size" do
#     board = Board.new
#     board.display_board.should == 
#                                   " 01 | 02 | 03 | 04 \n"\
#                                   "----|----|----|----\n"\
#                                   " 05 | 06 | 07 | 08 \n"\
#                                   "----|----|----|----\n"\
#                                   " 09 | 10 | 11 | 12 \n"\
#                                   "----|----|----|----\n"\
#                                   " 13 | 14 | 15 | 16 \n"
#   end
  
  it "undoes the placement of a marker" do
    board.current_board = ['X', '2', '3', 
                           '4', '5', '6', 
                           '7', '8', '9']
    board.undo_set_square(1)
    board.current_board.should == ['1', '2', '3', 
                                   '4', '5', '6', 
                                   '7', '8', '9']
  end
    
  it "sets the width of the board" do
    width = 3
    board.width.should == 3
  end

  it "makes a blank board" do
    board.reset_board.should == ['1', '2', '3', 
                                 '4', '5', '6', 
                                  '7', '8', '9']
  end
  
  it "returns true if game is over" do
    board.current_board = ['X', 'O', 'O', 
                           'X', 'X', 'O', 
                           'X', 'X', 'X']
    board.game_over?.should == true    
  end
  
  it "returns true if game is won by a given marker" do
    board.current_board = ['X', 'O', 'O', 
                           'X', 'X', 'O', 
                           'X', 'X', 'X']
    board.game_won?('X').should == true    
  end

  it "algorithmically provides a list of winning rows for any size board" do
    board.width = 3
    board.winning_rows.should == [
                                    [0, 1, 2],
                                    [3, 4, 5],
                                    [6, 7, 8],
                                  ]

  end
  
  it "generates a column for any size board" do
    board.width = 3
    board.generate_column(0).should == [0,3,6]
    board.generate_column(1).should == [1,4,7]
    board.generate_column(2).should == [2,5,8]
    board.width = 4
    board.generate_column(0).should == [0,4,8,12]
  end
    
  it "provides a list of winning columns for any size board" do
    board.width = 3
    board.winning_columns.should == [
                                      [0, 3, 6],
                                      [1, 4, 7],
                                      [2, 5, 8]
                                    ]
  end
  
  it "generates diagonal down from left to right for any size board" do
    board.width = 3
    board.diagonal_down.should == [0,4,8]  
  end

  it "generates diagonal up from left to right for any size board" do
    board.width = 3
    board.diagonal_up.should == [2,4,6]  
  end

  it "provides a list of winning diagonals for any size board" do
    board.width = 3
    board.winning_diagonals.should include(
                                        [0, 4, 8],
                                        [2, 4, 6]
                                      )
    board.width = 4
    board.winning_diagonals.should include(
                                            [0,5,10,15],
                                            [3,6,9,12]
                                      )
  end
  
  it "gathers winning board combinations for 3x3" do
    board.width = 3
    board.gather_winning_combinations.should ==  [
                                          [0, 1, 2],
                                          [3, 4, 5],
                                          [6, 7, 8],
                                          [0, 4, 8],
                                          [2, 4, 6],
                                          [0, 3, 6],
                                          [1, 4, 7],
                                          [2, 5, 8]
                                         ]
  end
  
  it "gathers winning board combinations for 4x4" do
    board.width = 4
    board.gather_winning_combinations.should ==  [
                                          [0, 1, 2, 3],
                                          [4, 5, 6, 7],
                                          [8, 9, 10, 11],
                                          [12, 13, 14, 15],
                                          [0, 5, 10, 15],
                                          [3, 6, 9, 12],
                                          [0, 4, 8, 12],
                                          [1, 5, 9, 13],
                                          [2, 6, 10, 14],
                                          [3, 7, 11, 15],
                                         ]
  end
end
