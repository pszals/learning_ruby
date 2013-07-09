require 'game'
require 'board'
require 'io'
require 'player'

describe Game do
  
  let(:player_1) { Player.new('X')                             }
  let(:player_2) { Player.new('O')                             }
  let(:board)    { Board.new(player_1, player_2)               }
  let(:io)       { Io.new                                      }
  let(:ai)       { Unbeatable_AI.new                           }
  let(:game)     { Game.new(board, io, ai, player_1, player_2) }
  
  
  it "initializes game with a board and two players" do
    game.player_1.marker.should ==  'X'
    game.player_2.marker.should ==  'O'    
    game.board.current_board.should == ['1', '2', '3', 
                                        '4', '5', '6', 
                                        '7', '8', '9'] 
  end
  
  it "initializes game with IO class" do
    game.io.should_receive(:get_input)
    game.io.get_input
  end

  it "places marker by setting square 5 to 'X'" do
    board.set_square(5, 'X')
    game.board.current_board.should == ['1', '2', '3', 
                                        '4', 'X', '6', 
                                        '7', '8', '9'] 
  end
        
  it "returns 'X' if it is X's turn" do
    empty_squares = 9
    game.whose_turn.should == 'X'
  end

  it "calls restart if selection is 1" do
    game.runner.should_receive(:call)
    game.restart?(1)
  end
  
  it "exits if restart? selection is not 1" do
    game.should_receive(:exit)
    game.restart?(2)
  end
    
  it "declares the start of a turn" do
    marker = 'X'
    game.io.should_receive(:puts_turn)
    game.io.should_receive(:ask_for_square_to_mark)
    game.io.should_receive(:print_board)
    game.declare_turn(marker)
  end
  
  it "puts marker error, ask for, and get square if square entered is invalid" do
    board.current_board = ['X', 'O', '3', 
                           '4', '5', '6', 
                           '7', '8', '9'] 
    game.io.should_receive(:marker_error)
    game.should_receive(:select_square).exactly(2).times
    game.place_marker(1, 'X')
  end  
  
  it "ends and restarts the game" do
    game.io.should_receive(:ask_to_restart)
    game.io.should_receive(:print_board)    
    game.io.should_receive(:get_input)
    game.should_receive(:restart?)
    game.game_over(io.puts_winner('X'))
  end
    
  it "checks for a winner on board" do
    board.should_receive(:winner_on_board?)
    game.io.should_receive(:gets).and_return('3')
    game.io.should_receive(:print_board)
    game.io.should_receive(:ask_to_restart)    
    game.should_receive(:exit)
    game.find_winner
  end
  
  it "takes turn if there is no winner on board" do
    game.should_receive(:select_square)  
    game.find_winner
  end
    
  it "checks that the board is open" do
    board.should_receive(:board_open?)
    game.should_receive(:restart?) 
    game.io.should_receive(:gets).and_return('3')
    game.io.should_receive(:print_board)
    game.io.should_receive(:ask_to_restart)
    game.find_winner      
  end
  
  it "puts out that there is a tie, asks to restart and gets choice" do
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
    board.current_board = ['X', 'O', 'X', 
                           'O', 'X', 'O', 
                           'O', 'O', 'X']
    game.io.should_receive(:puts_winner)
    game.io.should_receive(:print_board)
    game.io.should_receive(:gets).and_return('3')
    game.io.should_receive(:ask_to_restart)
    game.should_receive(:exit)
    game.find_winner
  end

  it "asks to restart and gets input to restart" do
    board.current_board = ['X', 'O', 'X', 
                           'O', 'O', 'X', 
                           'X', 'X', 'X']
    game.io.should_receive(:ask_to_restart)
    game.io.should_receive(:print_board)
    game.io.should_receive(:get_input)
    game.should_receive(:exit)
    game.find_winner
  end

  it "plays the game after a fresh start" do
    game.should_receive(:select_square)
    game.play_game
  end

end