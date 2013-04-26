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

  [
    # will become list of squares because markers are built into switching players
    [1, 'X']
  
  ].each do |square, marker|
    it "should place marker by setting #{square} to #{marker}" do
      runner = Runner.new
      runner.place_marker(square, marker)
      runner.get_board.get_state_of_square(square).should == marker
    end
  end

  it "should place marker by setting square 5 to 'X'" do
    runner = Runner.new 
    runner.place_marker(5, 'X')
    runner.get_board.get_state_of_board.should == ['1', '2', '3', '4', 'X', '6', '7', '8', '9'] 
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
  
  it "should return marker type of winner of top row game" do
    runner = Runner.new
    board = ['X', 'X', 'X', 'O', 'O', '6', '7', '8', '9']
    runner.get_winner(board).should == 'X'
  end
  
  #it "should return false (not true) if there are three blanks in a row" do
  #  runner = Runner.new
  #  board = ['', '', '', 'O', 'O', 'X', 'O', 'X', 'O']
  #  runner.winner_on_board?(board).should == false
  #end
  
  it "should randomly decide if X or O goes first if board is empty" do
    runner = Runner.new
    board = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
    runner.whose_turn?(board).should == 'X'
  end
  
  it "should return 'X' if it is X's turn" do
    runner = Runner.new
    board = ['X', 'O', '3', '4', '5', '6', '7', '8', '9']
    runner.whose_turn?(board).should == 'X'
  end
  
  it "should return 'O' if it is O's turn" do
    runner = Runner.new
    board = ['X', 'O', 'X', '4', '5', '6', '7', '8', '9']
    runner.whose_turn?(board).should == 'O'
  end
  
  it "should have a method play that calls the print_board method" do
    io = Io.new
    runner = Runner.new
    state = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
    runner.play.should == io.print_whole_board(state)
  end
  
  it "should return true if 1 is selected" do
    runner = Runner.new
    input = 1
    runner.restart?(input).should == true
  end

end