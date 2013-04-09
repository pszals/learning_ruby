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
  
  
end