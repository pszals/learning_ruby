require 'game'
require 'board'
require 'io'
require 'player'

describe Game do
  it "initializes game with a board and two players" do
    board = Board.new
    io = Io.new
    game = Game.new(board, io)
    game.player_1.marker.should ==  'X'
    game.player_2.marker.should ==  'O'    
    game.board.current_board.should == ['1', '2', '3', 
                                          '4', '5', '6', 
                                          '7', '8', '9'] 
  end
  
  it "initializes game with IO class" do
    board = Board.new
    io = Io.new
    game = Game.new(board, io)
    game.io.should_receive(:get_input)
    game.io.get_input
  end

  it "places marker by setting square 5 to 'X'" do
    board = Board.new
    io = Io.new
    game = Game.new(board, io)
    board.set_square(5, 'X')
    game.board.current_board.should == ['1', '2', '3', 
                                          '4', 'X', '6', 
                                          '7', '8', '9'] 
  end
      
  it "returns 'X' if it is X's turn" do
    board = Board.new
    io = Io.new
    game = Game.new(board, io)
    empty_squares = 9
    game.whose_turn.should == 'X'
  end

  it "calls restart if selection is 1" do
    board = Board.new
    io = Io.new
    game = Game.new(board, io)
    game.should_receive(:play_game)
    game.restart?(1)
  end
  
  it "exits if restart? selection is not 1" do
    board = Board.new
    io = Io.new
    game = Game.new(board, io)
    game.should_receive(:exit)
    game.restart?(2)
  end
  
  it "tells the user whose turn it is, print board and ask for square" do
    board = Board.new
    io = mock.as_null_object
    game = Game.new(board, io)
    game.io.should_receive(:puts_turn)
    game.io.should_receive(:ask_for_square_to_mark)
    game.io.should_receive(:print_board)
    game.should_receive(:place_marker)
    game.select_square
  end
  
  it "declares the start of a turn" do
    board = Board.new
    io = mock.as_null_object
    marker = 'X'
    game = Game.new(board, io)
    game.io.should_receive(:puts_turn)
    game.io.should_receive(:ask_for_square_to_mark)
    game.io.should_receive(:print_board)
    game.declare_turn(marker)
  end
  
  it "puts marker error, ask for, and get square if square entered is invalid" do
    board = Board.new
    io = mock.as_null_object
    game = Game.new(board, io)
    board.current_board = ['X', 'O', '3', 
                           '4', '5', '6', 
                           '7', '8', '9'] 
    game.io.should_receive(:marker_error)
    game.should_receive(:select_square).exactly(2).times
    game.place_marker(1, 'X')
  end  
  
  it "ends and restarts the game" do
    board = Board.new
    io = mock.as_null_object
    game = Game.new(board, io)
    game.io.should_receive(:ask_to_restart)
    game.io.should_receive(:print_board)    
    game.io.should_receive(:get_input)
    game.should_receive(:restart?)
    game.game_over(io.puts_winner('X'))
  end
    
  it "checks for a winner on board" do
    board = Board.new
    io = mock.as_null_object
    game = Game.new(board, io)
    board.should_receive(:winner_on_board?)
    game.should_receive(:exit)
    game.find_winner
  end
  
  it "takes turn if there is no winner on board" do
    board = Board.new
    io = mock.as_null_object
    game = Game.new(board, io)
    game.should_receive(:select_square)
    game.find_winner
  end
    
  it "checks that the board is open" do
    board = Board.new
    io = mock.as_null_object
    game = Game.new(board, io)
    board.should_receive(:board_open?)
    game.should_receive(:restart?)    
    game.find_winner      
  end
  
  it "puts out that there is a tie, asks to restart and gets choice" do
    board = Board.new
    io = mock.as_null_object
    game = Game.new(board, io)
    board.current_board = ['X', 'O', 'X', 
                           'O', 'O', 'X', 
                           'X', 'X', 'O']
    game.io.should_receive(:puts_tie)
    game.io.should_receive(:ask_to_restart)
    game.io.should_receive(:print_board)    
    game.io.should_receive(:get_input)
    game.should_receive(:restart?)
    game.find_winner  
  end
  
  it "puts out the winner" do
    board = Board.new
    io = mock.as_null_object
    game = Game.new(board, io)
    board.current_board = ['X', 'O', 'X', 
                           'O', 'X', 'O', 
                           'O', 'O', 'X']
    game.io.should_receive(:puts_winner)
    game.io.should_receive(:print_board)
    game.should_receive(:exit)
    game.find_winner
  end

  it "asks to restart and gets input to restart" do
    board = Board.new
    io = mock.as_null_object
    game = Game.new(board, io)
    board.current_board = ['X', 'O', 'X', 
                           'O', 'O', 'X', 
                           'X', 'X', 'X']
    game.io.should_receive(:ask_to_restart)
    game.io.should_receive(:get_input)
    game.should_receive(:exit)
    game.find_winner
  end

  it "starts game on empty board" do
    board = Board.new
    io = Io.new
    game = Game.new(board, io)
    game.should_receive(:select_square)
    game.should_receive(:configure_opponent)
    game.play_game
  end
  
  it "asks and receives opponent type" do
    board = Board.new
    io = Io.new
    game = Game.new(board, io)
    game.io.should_receive(:ask_for_opponent)
    game.io.should_receive(:get_input)
    game.configure_opponent
  end
end