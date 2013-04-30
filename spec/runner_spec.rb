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
      
  it "should return false if there is no winner on board" do
    runner = Runner.new
    board = ['O', 'O', 'X', 'X', 'X', 'O', 'O', 'X', 'O']
    runner.get_winner(board).should == false
  end

  it "should return 'X' if it is X's turn" do
    runner = Runner.new
    empty_squares = 9
    runner.whose_turn?(empty_squares).should == 'X'
  end
  
  it "should return 6 as the number of empty squares" do
    runner = Runner.new
    board = ['X', 'O', 'X', '4', '5', '6', '7', '8', '9']
    runner.number_of_empty_squares(board).should == 6
  end
  
  it "should return 'X' if it is X's turn" do
    board = ['X', 'O', '3', '4', '5', '6', '7', '8', '9']
    runner = Runner.new
    empty_squares = 7
    runner.whose_turn?(empty_squares).should == 'X'
  end

  
#  it "should have a method play that calls the print_board method" do
#    io = Io.new(double)
#    runner = Runner.new
#    state = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
#    runner.should_receive(:play).with(:print_board)
#    runner.play
#  end

  it "should call restart if selection is 1" do
    runner = Runner.new
    runner.should_receive(:restart)
    runner.restart?(1)
  end
  
  it "should exit if restart? selection is not 1" do
    runner = Runner.new
    runner.should_receive(:exit)
    runner.restart?(2)
  end

end