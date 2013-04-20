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
    runner.check_if_square_is_empty(board_with_marked_square_one, 1).should == false
  end  

  it "should return true if square 1 is empty" do
    empty_square = 1
    runner = Runner.new
    board = runner.get_board
    current_state_of_board = board.get_state_of_board
    runner.check_if_square_is_empty(current_state_of_board, empty_square).should == true
  end
  
  it "should return true if there is an open square on the board" do
    runner = Runner.new
    board = Board.new
    state = board.reset_board
    runner.check_if_board_is_open(state).should == true
  end
  
  it "should return false if there are no open squares on the board" do
    runner = Runner.new
    board = Board.new
    state = ['X', 'O', 'O', 'X', 'X', 'O', 'X', 'X', 'O']
    runner.check_if_board_is_open(state).should == false  
  end
  
  it "should return true if top row is all X’s" do
    runner = Runner.new
    board = Board.new
    state = ['X', 'X', 'X', 'X', 'X', 'O', 'X', 'X', 'O']
    runner.check_top_row(state).should == true
  end
  
  it "should return false if top row is not homogeneous" do
    runner = Runner.new
    board = Board.new
    state = ['O', 'O', 'X', 'X', 'X', 'O', 'X', 'X', 'O']
    runner.check_top_row(state).should == false
  end
  
  it "should return true if second row is all X's or all O's" do
    runner = Runner.new
    board = Board.new
    state = ['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'O']
    runner.check_second_row(state).should == true
  end

  it "should return false if second row is not homogeneous" do
    runner = Runner.new
    board = Board.new
    state = ['O', 'O', 'X', 'X', 'X', 'O', 'X', 'X', 'O']
    runner.check_second_row(state).should == false
  end
  
  it "should return true if third row is all X's or all O's" do
    runner = Runner.new
    board = Board.new
    state = ['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X']
    runner.check_third_row(state).should == true
  end

  it "should return true if first column is all X's or all O's" do
    runner = Runner.new
    board = Board.new
    state = ['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X']
    runner.check_first_column(state).should == true
  end
  
  it "should return true if second column is all X's or all O's" do
    runner = Runner.new
    board = Board.new
    state = ['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X']
    runner.check_second_column(state).should == true
  end

  it "should return true if third column is all X's or all O's" do
    runner = Runner.new
    board = Board.new
    state = ['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X']
    runner.check_third_column(state).should == true
  end

  it "should return true if diagonal down is all X's or all O's" do
    runner = Runner.new
    board = Board.new
    state = ['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X']
    runner.check_diagonal_down(state).should == true
  end

  it "should return true if diagonal up is all X's or all O's" do
    runner = Runner.new
    board = Board.new
    state = ['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X']
    runner.check_diagonal_up(state).should == true
  end
end