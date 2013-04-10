require 'runner'
require 'board'
require 'io'
require 'player'

describe Runner do
  it "should initialize game with a board and two players" do
    runner = Runner.new
    runner.get_player_x.get_marker.should ==  'X'
    runner.get_player_o.get_marker.should ==  'O'    
    runner.get_board.get_state_of_board.should == (1..9).to_a
  end
  
  # it "should decide whether player_x or player_o goes first" do

  # end
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
    runner.get_board.get_state_of_board.should == [1, 2, 3, 4, 'X', 6, 7, 8, 9] 
  end
  
  it "should return true if square 1 is empty" do
    empty_square = 1
    runner = Runner.new
    board = runner.get_board
    current_state_of_board = board.get_state_of_board
    runner.check_if_square_is_empty(current_state_of_board, empty_square).should == true
  end  
  
  
end