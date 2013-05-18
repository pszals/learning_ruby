require 'runner'
require 'board'
require 'io'
require 'player'

describe Runner do
  it "should initialize game with a board and two players" do
    board = Board.new
    io = Io.new
    runner = Runner.new(board, io)
    runner.player_1.marker.should ==  'X'
    runner.player_2.marker.should ==  'O'    
    runner.board.current_board.should == ['1', '2', '3', '4', '5', '6', '7', '8', '9'] 
  end
  
  it "should initialize game with IO class" do
    board = Board.new
    io = Io.new
    runner = Runner.new(board, io)
    runner.io.should_receive(:get_input)
    runner.io.get_input
  end

  it "should place marker by setting square 5 to 'X'" do
    board = Board.new
    io = Io.new
    runner = Runner.new(board, io)
    board.set_square(5, 'X')
    runner.board.current_board.should == ['1', '2', '3', '4', 'X', '6', '7', '8', '9'] 
  end
      
  it "should return 'X' if it is X's turn" do
    board = Board.new
    io = Io.new
    runner = Runner.new(board, io)
    empty_squares = 9
    runner.whose_turn?.should == 'X'
  end

  it "should call restart if selection is 1" do
    board = Board.new
    io = Io.new
    runner = Runner.new(board, io)
    runner.should_receive(:play_game)
    runner.restart?(1)
  end
  
  it "should exit if restart? selection is not 1" do
    board = Board.new
    io = Io.new
    runner = Runner.new(board, io)
    runner.should_receive(:exit)
    runner.restart?(2)
  end
  
  it "should tell the user whose turn it is, print board and ask for square" do
    board = Board.new
    io = mock.as_null_object
    runner = Runner.new(board, io)
    runner.io.should_receive(:puts_turn)
    runner.io.should_receive(:ask_for_square_to_mark)
    runner.io.should_receive(:print_board)
    runner.should_receive(:find_winner).at_least(1).times
    runner.take_turn
  end
  
  it "declares the start of a turn" do
    board = Board.new
    io = mock.as_null_object
    marker = 'X'
    runner = Runner.new(board, io)
    runner.io.should_receive(:puts_turn)
    runner.io.should_receive(:ask_for_square_to_mark)
    runner.io.should_receive(:print_board)
    runner.declare_turn(marker)
  end
  
  it "should put marker error, ask for, and get square if square entered is invalid" do
    board = Board.new
    io = mock.as_null_object
    runner = Runner.new(board, io)
    board.set_square(1, 'X')
    board.set_square(1, 'X')
    runner.io.should_receive(:marker_error)
    runner.io.should_receive(:ask_for_square_to_mark)
    runner.io.should_receive(:get_square_to_mark)
    runner.should_receive(:find_winner).at_least(1).times
    runner.take_turn
  end  

  it "places marker on board, then checks board (find_winner) if inputed square is empty" do
    board = Board.new
    io = mock.as_null_object
    runner = Runner.new(board, io)
    board.set_square(1, 'X')
    board.should_receive(:set_square)
    runner.should_receive(:find_winner).at_least(1).times
    runner.take_turn  
  end
  
  it "ends and restarts the game" do
    board = Board.new
    io = mock.as_null_object
    runner = Runner.new(board, io)
    runner.io.should_receive(:ask_to_restart)
    runner.io.should_receive(:print_board)    
    runner.io.should_receive(:get_input)
    runner.should_receive(:restart?)
    runner.game_over(true, io.puts_winner('X'))
  end
    
  it "checks for a winner on board" do
    board = Board.new
    io = mock.as_null_object
    runner = Runner.new(board, io)
    board.should_receive(:winner_on_board?)
    runner.should_receive(:exit)
    runner.find_winner
  end
  
  it "takes turn if there is no winner on board" do
    board = Board.new
    io = mock.as_null_object
    runner = Runner.new(board, io)
    runner.should_receive(:take_turn)
    runner.find_winner
  end
    
  it "checks that the board is open" do
    board = Board.new
    io = mock.as_null_object
    runner = Runner.new(board, io)
    board.should_receive(:board_open?)
    runner.should_receive(:restart?)    
    runner.find_winner      
  end
  
  it "puts out that there is a tie, asks to restart and gets choice" do
    board = Board.new
    io = mock.as_null_object
    runner = Runner.new(board, io)
    board.current_board = ['X', 'O', 'X', 
                        'O', 'O', 'X', 
                        'X', 'X', 'O']
    runner.io.should_receive(:puts_tie)
    runner.io.should_receive(:ask_to_restart)
    runner.io.should_receive(:print_board)    
    runner.io.should_receive(:get_input)
    runner.should_receive(:restart?)
    runner.find_winner  
  end
  
  it "puts out the winner" do
    board = Board.new
    io = mock.as_null_object
    runner = Runner.new(board, io)
    board.current_board = ['X', 'O', 'X', 
                           'O', 'X', 'O', 
                           'O', 'O', 'X']
    runner.io.should_receive(:puts_winner)
    runner.io.should_receive(:print_board)
    runner.should_receive(:exit)
    runner.find_winner
  end

  it "asks to restart and gets input to restart" do
    board = Board.new
    io = mock.as_null_object
    runner = Runner.new(board, io)
    board.current_board = ['X', 'O', 'X', 
                           'O', 'O', 'X', 
                           'X', 'X', 'X']
    runner.io.should_receive(:ask_to_restart)
    runner.io.should_receive(:get_input)
    runner.should_receive(:exit)
    runner.find_winner
  end

  it "should start game on empty board" do
    board = Board.new
    io = Io.new
    runner = Runner.new(board, io)
    runner.should_receive(:take_turn)#.and_return("5", 7, 8)
    runner.should_receive(:configure_opponent)
    runner.play_game
  end
  
  it "asks and receives opponent type" do
    board = Board.new
    io = Io.new
    runner = Runner.new(board, io)
    runner.io.should_receive(:ask_for_opponent)
    runner.io.should_receive(:get_input)
    runner.configure_opponent
  end
end