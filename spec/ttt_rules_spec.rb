require 'ttt_rules'
require 'board'
require 'player'

describe TTTRules do
  let(:player_1) { Player.new('X')               }
  let(:player_2) { Player.new('O')               }
  let(:board)    { Board.new(player_1, player_2) }
  let(:rules)    { TTTRules.new(board)           }

  it "gets whose turn" do
    board.current_board = ['1', 'O', 'O', 
                           'X', 'X', 'O', 
                           'O', 'O', 'X']
    rules.whose_turn.should == 'X'  
  end

  it "gets whose turn" do
    board.current_board = ['1', '2', 'O', 
                           'X', 'X', 'O', 
                           'O', 'O', 'X']
    rules.whose_turn.should == 'O'  
  end

  it "gets opponent's marker" do
    rules.get_opponent.should == 'O'  
  end
  
  it "returns array of squares that are open" do
    board.current_board = ['X', 'O', 'O', 
                           'X', 'X', 'O', 
                           'X', 'X', '9']
    rules.list_of_open_squares.should == ['9']  
  end

  it "returns the right length of empty squares" do
    board.current_board = ['X', 'O', 'O', 
                           'X', 'X', 'O', 
                           'X', 'X', '9']
    rules.number_of_empty_squares.should be 1
  end

  it "returns array of squares that are open" do
    board.current_board = ['1', '2', 'O', 
                           'X', 'X', 'O', 
                           'X', '8', '9']
    rules.list_of_open_squares.should == ['1', '2', '8', '9']  
  end
  
  it "returns an empty array if no squares are open" do
    board.current_board = ['X', 'O', 'O', 
                           'X', 'X', 'O', 
                           'X', 'X', 'X']
    rules.list_of_open_squares.should == []  
  end

  it "returns the number of empty squares" do
    board.current_board = ['X', 'O', 'X', 
                           '4', '5', '6', 
                           '7', '8', '9']
    rules.number_of_empty_squares.should == 6
  end
	
  it "returns true if there is an open square on the board" do
    board.reset_board
    rules.board_open?.should == true
  end

  it "returns false if there are no open squares on the board" do
    board.current_board = ['X', 'O', 'O', 
                           'X', 'X', 'O', 
                           'X', 'X', 'O']
    rules.board_open?.should == false  
  end

  it "returns false if board is tied" do
    board.current_board = ['X', 'O', 'X', 
                           'O', 'O', 'X', 
                           'X', 'X', 'O']
    rules.board_open?.should == false
  end

  it "returns false if square 1 is marked" do
    board.current_board = ['X', '2', '3', 
      '4', '5', '6', 
      '7', '8', '9']
    rules.square_empty?(1).should == false
  end  

  it "returns true if square 1 is empty" do
    board.current_board = ['1', '2', '3', 
      '4', '5', '6', 
      '7', '8', '9']
    rules.square_empty?(1).should == true
  end

  it "returns marker type of winner on board" do
    board.width = 4
    board.current_board = [ 'X', 'X', 'X', 'X', 
                            'X', '6', '7', '8', 
                            'X', '10', '11', '12', 
                            'X', '14', '15', '16']
    rules.winner.should == 'X'
  end

  it "returns marker type of winner on board" do
    board.width = 4
    board.current_board = [ 'O', 'X', 'X', 'X', 
                            'O', '6', '7', '8', 
                            'O', '10', '11', '12', 
                            'O', '14', '15', '16']
    rules.winner.should == 'O'
  end

  it "returns true if game is over" do
    board.current_board = ['X', 'O', 'O', 
                           'X', 'X', 'O', 
                           'X', 'X', 'X']
    rules.game_over?.should == true    
  end

  it "returns true if game is won by a given marker" do
    board.current_board = ['X', 'O', 'O', 
                           'X', 'X', 'O', 
                           'X', 'X', 'X']
    rules.game_won?.should == true    
  end

  it "returns marker type of winner on board" do
    board.current_board = ['1', '2', '3', 
      '4', '5', '6', 
                           'X', 'X', 'X']
    rules.winner.should == 'X'
  end
  it "returns marker type of winner on board" do
    board.current_board = ['1', '2', '3', 
                           '4', '5', '6', 
                           'X', 'X', 'X']
    rules.game_won?.should == true
  end
  
  it "returns marker type of winner on board" do
    board.width = 4
    board.current_board = [ 'X', 'X', 'X', 'X', 
                            'X', '6', '7', '8', 
                            'X', '10', '11', '12', 
                            'X', '14', '15', '16']
    rules.game_won?.should == true
  end

  it "slices board by row" do
    board.width = 3
    rules.rows.class.should == Enumerator 
  end

  it "algorithmically provides a list of winning rows for any size board" do
    board.width = 3
    rules.winning_rows.should == [
                                    [0, 1, 2],
                                    [3, 4, 5],
                                    [6, 7, 8],
                                  ]

  end
  
  it "generates a column for any size board" do
    board.width = 3
    rules.generate_column(0).should == [0,3,6]
    rules.generate_column(1).should == [1,4,7]
    rules.generate_column(2).should == [2,5,8]
    rules.width = 4
    rules.generate_column(0).should == [0,4,8,12]
  end
    
  it "returns false if there is no winner on board" do
    board.current_board = ['1', '2', '3', 
                           '4', '5', '6', 
                           'O', 'X', 'X']
    rules.game_won?.should == false
  end
  it "provides a list of winning columns for any size board" do
    board.width = 3
    rules.winning_columns.should == [
                                      [0, 3, 6],
                                      [1, 4, 7],
                                      [2, 5, 8]
                                    ]
  end
  
  it "generates diagonal down from left to right for any size board" do
    board.width = 3
    rules.diagonal_down.should == [0,4,8]  
  end

  it "generates diagonal up from left to right for any size board" do
    board.width = 3
    rules.diagonal_up.should == [2,4,6]  
  end
  
  it "gathers winning board combinations for 3x3" do
    board.width = 3
    rules.gather_winning_combinations.should ==  [
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
    rules.gather_winning_combinations.should ==  [
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
