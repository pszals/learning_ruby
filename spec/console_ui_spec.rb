require 'console_ui'
require 'player'
require 'board'

describe Console_UI do

  let(:player_1) { Player.new('X')               }
  let(:player_2) { Player.new('O')               }
  let(:board)    { Board.new(player_1, player_2) }
  let(:ui)       { Console_UI.new(board)         }

  it "prints 'It's X's turn" do
    ui.should_receive(:put_to_console)
    ui.puts_turn("X")
  end

  it "gets the width of the board" do
    ui.should_receive(:get_input)
    ui.get_width_of_board
  end  
    
  it "gets the square number to be marked from user" do
    ui.should_receive(:get_input)
    ui.get_square_to_mark
  end
  
  it "asks for the marker type" do
    ui.should_receive(:put_to_console)
    ui.ask_for_marker_type
  end
  
  it "asks for the square number to be marked" do
    ui.should_receive(:put_to_console)
    ui.ask_for_square_to_mark
  end

  it "declares the start of a turn" do
    marker = 'X'
    board  = ['1', '2', '3',
              '4', '5', '6',
              '7', '8', '9'
             ]
    ui.should_receive(:puts_turn)
    ui.should_receive(:ask_for_square_to_mark)
    ui.should_receive(:print_board)
    ui.declare_turn(marker, board)
  end

  it "prints error message if square is marked or improper input" do
    ui.should_receive(:put_to_console)
    ui.marker_error
  end
  
  it "prints the winning piece" do
    ui.should_receive(:put_to_console)
    ui.puts_winner("X")
  end
  
  it "prints out that the game is tied" do
    ui.should_receive(:put_to_console)
    ui.puts_tie
  end
  
  it "asks for first to play" do
    ui.should_receive(:put_to_console)
    ui.ask_for_first_player
  end
  
  it "gets player type of first player" do
    ui.should_receive(:get_input)
    ui.get_first_player
  end  
  
  it "asks for 1 to restart or any key to exit" do
    ui.should_receive(:put_to_console)
    ui.ask_to_restart
  end
  
  it "asks for width of board" do
    ui.should_receive(:put_to_console)
    ui.ask_for_width_of_board
  end
    
  it "prints the board" do
    board = "board"
    ui.should_receive(:put_to_console)
    ui.print_board(board)
  end
  
  it "asks if user wants to play against a computer" do
    ui.should_receive(:put_to_console)
    ui.ask_for_opponent
  end
  
  it "gets opponent type" do
    ui.should_receive(:get_input)
    ui.get_opponent
  end
  
  it "returns square board to be printed of 3x3 size" do
    ui.display_board.should == " 1 | 2 | 3 \n"\
                                  "---|---|---\n"\
                                  " 4 | 5 | 6 \n"\
                                  "---|---|---\n"\
                                  " 7 | 8 | 9 \n"
  end

  it "returns square board to be printed of 4x4 size" do
    board.width = 4
    board.current_board = board.board_to_strings
    ui.display_board.should == 
                                  " 1 | 2 | 3 | 4 \n"\
                                  "---|---|---|---\n"\
                                  " 5 | 6 | 7 | 8 \n"\
                                  "---|---|---|---\n"\
                                  " 9 | 10 | 11 | 12 \n"\
                                  "---|---|---|---\n"\
                                  " 13 | 14 | 15 | 16 \n"
  end
end
