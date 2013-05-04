require 'runner'
require 'board'
require 'io'
require 'player'

describe Runner do
  it "should initialize game with a board and two players" do
    board = Board.new
    io = Io.new
    runner = Runner.new(board, io)
    runner.player_x.get_marker.should ==  'X'
    runner.player_o.get_marker.should ==  'O'    
    runner.board.get_state_of_board.should == ['1', '2', '3', '4', '5', '6', '7', '8', '9'] 
  end
  
  it "should initialize game with IO class" do
    board = Board.new
    io = Io.new
    runner = Runner.new(board, io)
    runner.io.should_receive(:get_input)
    runner.io.get_input
  end

  [
    [1, 'X']  
  ].each do |square, marker|
    it "should place marker by setting #{square} to #{marker}" do
      board = Board.new
      io = Io.new
      runner = Runner.new(board, io)
      runner.place_marker(square, marker)
      runner.board.get_state_of_square(square).should == marker
    end
  end

  it "should place marker by setting square 5 to 'X'" do
    board = Board.new
    io = Io.new
    runner = Runner.new(board, io)
    runner.place_marker(5, 'X')
    runner.board.get_state_of_board.should == ['1', '2', '3', '4', 'X', '6', '7', '8', '9'] 
  end
      
  it "should return false if there is no winner on board" do
    board = Board.new
    io = Io.new
    runner = Runner.new(board, io)
    board = ['O', 'O', 'X', 'X', 'X', 'O', 'O', 'X', 'O']
    runner.get_winner(board).should == false
  end

  it "should return 'X' if it is X's turn" do
    board = Board.new
    io = Io.new
    runner = Runner.new(board, io)
    empty_squares = 9
    runner.whose_turn?(empty_squares).should == 'X'
  end
  
  it "should return 6 as the number of empty squares" do
    board = Board.new
    io = Io.new
    runner = Runner.new(board, io)
    board = ['X', 'O', 'X', '4', '5', '6', '7', '8', '9']
    runner.number_of_empty_squares(board).should == 6
  end
  
#  it "should have a method play that calls the print_board method" do
#    io = Io.new(double)
#    runner = Runner.new
#    state = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
#    runner.should_receive(:play).with(:print_board)
#    runner.play
#  end

  it "should call restart if selection is 1" do
    board = Board.new
    io = Io.new
    runner = Runner.new(board, io)
    runner.should_receive(:setup)
    runner.restart?(1)
  end
  
  it "should exit if restart? selection is not 1" do
    board = Board.new
    io = Io.new
    runner = Runner.new(board, io)
    runner.should_receive(:exit)
    runner.restart?(2)
  end
  
  it "should ask for width of board from user" do
    board = Board.new
    io = Io.new
    runner = Runner.new(board, io)
    runner.io.should_receive(:ask_for_width_of_board)
    runner.setup
  end
  
  it "should tell the user whose turn it is and asks for square" do
    board_class = Board.new
    io = mock.as_null_object
    runner = Runner.new(board_class, io)
    board = board_class.get_state_of_board
    runner.io.should_receive(:puts_turn)
    runner.io.should_receive(:ask_for_square_to_mark?)
    runner.take_turn(board, 1)
  end
  
  it "should put marker error, ask for, and get square if square entered is invalid" do
    board_class = Board.new
    io = mock.as_null_object
    runner = Runner.new(board_class, io)
    board = board_class.get_state_of_board
    runner.place_marker(1, 'X')
    runner.place_marker(1, 'X')
    runner.io.should_receive(:marker_error)
    runner.io.should_receive(:ask_for_square_to_mark?).exactly(2).times
    runner.take_turn(board, 1)
  end  

  it "places marker on board if inputed square is empty" do
    board_class = Board.new
    io = mock.as_null_object
    runner = Runner.new(board_class, io)
    board = board_class.get_state_of_board
    runner.place_marker(1, 'X')    
  end
end