require 'runner'
require 'board'
require 'io'
require 'player'

describe Runner do
  it "should initialize game with a board and two players" do
    board = Board.new
    io = Io.new
    runner = Runner.new(board, io)
    runner.player_x.marker.should ==  'X'
    runner.player_o.marker.should ==  'O'    
    runner.board.game_state.should == ['1', '2', '3', '4', '5', '6', '7', '8', '9'] 
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
    runner.board.game_state.should == ['1', '2', '3', '4', 'X', '6', '7', '8', '9'] 
  end
      
  it "should return false if there is no winner on board" do
    board = Board.new
    io = Io.new
    runner = Runner.new(board, io)
    board.game_state = ['O', 'O', 'X', 'X', 'X', 'O', 'O', 'X', 'O']
    runner.get_winner.should == false
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
  
  it "should tell the user whose turn it is, print board and asks for square" do
    board_class = Board.new
    io = mock.as_null_object
    runner = Runner.new(board_class, io)
    board = board_class.board
    runner.io.should_receive(:puts_turn)
    runner.io.should_receive(:ask_for_square_to_mark?)
    runner.io.should_receive(:print_board)
    runner.should_receive(:check_board).at_least(2).times
    runner.take_turn(board)
  end
  
  it "should put marker error, ask for, and get square if square entered is invalid" do
    board_class = Board.new
    io = mock.as_null_object
    runner = Runner.new(board_class, io)
    board = board_class.board
    runner.place_marker(1, 'X')
    runner.place_marker(1, 'X')
    runner.io.should_receive(:marker_error)
    runner.io.should_receive(:ask_for_square_to_mark?).exactly(2).times
    runner.io.should_receive(:get_square_to_mark)
    runner.should_receive(:check_board).at_least(1).times
    runner.take_turn(board)
  end  

  it "places marker on board, then checks board (check_board) if inputed square is empty" do
    board_class = Board.new
    io = mock.as_null_object
    runner = Runner.new(board_class, io)
    board = board_class.board
    runner.place_marker(1, 'X')
    runner.should_receive(:place_marker)
    runner.should_receive(:check_board).at_least(1).times
    runner.take_turn(board)    
  end
    
  it "checks for a winner on board" do
    board_class = Board.new
    io = mock.as_null_object
    runner = Runner.new(board_class, io)
    board = board_class.board
    board_class.should_receive(:winner_on_board?)
    runner.should_receive(:exit)
    runner.check_board(board)
  end
  
  it "takes turn if there is no winner on board" do
    board_class = Board.new
    io = mock.as_null_object
    runner = Runner.new(board_class, io)
    board = board_class.board
    runner.should_receive(:take_turn)
    runner.check_board(board)  
  end
    
  it "checks that the board is open" do
    board_class = Board.new
    io = mock.as_null_object
    runner = Runner.new(board_class, io)
    board = board_class.board
    board_class.should_receive(:board_open?)
    runner.should_receive(:restart?)    
    runner.check_board(board)      
  end
  
  it "puts out that there is a tie, asks to restart and gets choice" do
    board_class = Board.new
    io = mock.as_null_object
    runner = Runner.new(board_class, io)
    board = ['X', 'O', 'X', 'O', 'O', 'X', 'X', 'X', 'O']
    runner.io.should_receive(:puts_tie)
    runner.io.should_receive(:ask_to_restart?)
    runner.io.should_receive(:get_input)
    runner.should_receive(:restart?)
    runner.check_board(board)  
  end
  
  it "puts out the winner" do
    board_class = Board.new
    io = mock.as_null_object
    runner = Runner.new(board_class, io)
    board = ['X', 'O', 'X', 'O', 'O', 'X', 'X', 'X', 'X']
    runner.io.should_receive(:puts_winner)
    runner.should_receive(:exit)
    runner.check_board(board)
  end

  it "asks to restart and gets input to restart" do
    board_class = Board.new
    io = mock.as_null_object
    runner = Runner.new(board_class, io)
    board = ['X', 'O', 'X', 'O', 'O', 'X', 'X', 'X', 'X']
    runner.io.should_receive(:ask_to_restart?)
    runner.io.should_receive(:get_input)
    runner.should_receive(:exit)
    runner.check_board(board)
  end

  it "should start game on board with width given by user" do
    board = Board.new
    io = Io.new
    runner = Runner.new(board, io)
    runner.should_receive(:check_board)
#    runner.should_receive(:reset_any_size_board)
    runner.setup
  end
end