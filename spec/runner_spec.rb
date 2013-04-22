require 'runner'
require 'board'
require 'io'
require 'player'

describe Runner do
  it "should initialize game with a board and two players" do
    runner = Runner.new
    runner.get_player_x.get_marker.should ==  'X'
    runner.get_player_o.get_marker.should ==  'O'    
    runner.get_board.get_state_of_board.should == ['1', '2', '3', '4', '5', '6', '7', '8', '9'] 
  end
  
=begin it "should decide whether player_x or player_o goes first" do
      runner = Runner.new
      runner.decide_first_mover.should  == random_number
    end
=end
  [
    # will become list of squares because markers are built into switching players
    [1, 'X']
  
  ].each do |square, marker|
    it "should take turn by setting #{square} to #{marker}" do
      runner = Runner.new
      runner.take_turn(square, marker)
      runner.get_board.get_state_of_square(square).should == marker
    end
  end

  it "should take turn by setting square 5 to 'X'" do
    runner = Runner.new 
    runner.take_turn(5, 'X')
    runner.get_board.get_state_of_board.should == ['1', '2', '3', '4', 'X', '6', '7', '8', '9'] 
  end
    
  it "should return false if square 1 is marked" do
    runner = Runner.new
    runner.take_turn(1, 'X')
    board_with_marked_square_one = runner.get_board.get_state_of_board
    runner.square_empty?(board_with_marked_square_one, 1).should == false
  end  

  it "should return true if square 1 is empty" do
    empty_square = 1
    runner = Runner.new
    board = runner.get_board
    current_state_of_board = board.get_state_of_board
    runner.square_empty?(current_state_of_board, empty_square).should == true
  end
  
  it "should return true if there is an open square on the board" do
    runner = Runner.new
    board = Board.new
    board = board.reset_board
    runner.board_open?(board).should == true
  end

  it "should return false if board is tied" do
    runner = Runner.new
    board = ['X', 'O', 'X', 'O', 'O', 'X', 'X', 'X', 'O']
    runner.board_open?(board).should == false
  end
    
  it "should return false if there are no open squares on the board" do
    runner = Runner.new
    board = ['X', 'O', 'O', 'X', 'X', 'O', 'X', 'X', 'O']
    runner.board_open?(board).should == false  
  end
  
  it "should return true if top row is all X’s" do
    runner = Runner.new
    board = Board.new
    board = ['X', 'X', 'X', 'X', 'X', 'O', 'X', 'X', 'O']
    runner.check_top_row(board).should == true
  end
  
  it "should return false if top row is not homogeneous" do
    runner = Runner.new
    board = ['O', 'O', 'X', 'X', 'X', 'O', 'X', 'X', 'O']
    runner.check_top_row(board).should == false
  end
  
  it "should return true if second row is all X's or all O's" do
    runner = Runner.new
    board = ['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'O']
    runner.check_second_row(board).should == true
  end

  it "should return false if second row is not homogeneous" do
    runner = Runner.new
    board = ['O', 'O', 'X', 'X', 'X', 'O', 'X', 'X', 'O']
    runner.check_second_row(board).should == false
  end
  
  it "should return true if third row is all X's or all O's" do
    runner = Runner.new
    board = ['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X']
    runner.check_third_row(board).should == true
  end

  it "should return true if first column is all X's or all O's" do
    runner = Runner.new
    board = ['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X']
    runner.check_first_column(board).should == true
  end
  
  it "should return true if second column is all X's or all O's" do
    runner = Runner.new
    board = ['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X']
    runner.check_second_column(board).should == true
  end

  it "should return true if third column is all X's or all O's" do
    runner = Runner.new
    board = ['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X']
    runner.check_third_column(board).should == true
  end

  it "should return true if diagonal down is all X's or all O's" do
    runner = Runner.new
    board = ['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X']
    runner.check_diagonal_down(board).should == true
  end

  it "should return true if diagonal up is all X's or all O's" do
    runner = Runner.new
    board = ['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X']
    runner.check_diagonal_up(board).should == true
  end
  
  it "should return marker type of winner on board" do
    runner = Runner.new
    board = ['X', 'X', 'X', 'O', 'O', 'X', 'O', 'X', 'O']
    runner.winner_on_board?(board).should == 'X'
  end
  
  #it "should return false (not true) if there are three blanks in a row" do
  #  runner = Runner.new
  #  board = ['', '', '', 'O', 'O', 'X', 'O', 'X', 'O']
  #  runner.check_all_combos(board).should == false
  #end
  
  it "should pass winner of top row game" do
    runner = Runner.new
    board = ['X', 'X', 'X', 'O', 'O', '6', '7', '8', '9']
    runner.winner_name(board).should == 'X'
  end
  
  it "should pass marker type 'X' if it is X's turn" do
    runner = Runner.new
    board = ['O', 'X', '3', '4', 'X', '6', '7', '8', '9'] 
  end
  
  it "should randomly decide if X or O goes first if board is empty" do
    runner = Runner.new
    board = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
    runner.decide_first_player(board).should == 'X'
  end
  
  it "should return 'X' if it is O's turn" do
    runner = Runner.new
    board = ['X', 'O', '3', '4', '5', '6', '7', '8', '9']
    runner.whos_turn?(board).should == 'X'
  end
end