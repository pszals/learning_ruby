require 'console_ui'

describe Console_UI do

  let(:ui) {Console_UI.new}

  it "prints 'It's X's turn" do
    ui = Console_UI.new
    ui.should_receive(:put_to_console)
    ui.puts_turn("X")
  end

  it "gets the width of the board" do
    ui = Console_UI.new
    ui.should_receive(:get_input)
    ui.get_width_of_board
  end  
    
  it "gets the square number to be marked from user" do
    ui = Console_UI.new
    ui.should_receive(:get_input)
    ui.get_square_to_mark
  end
  
  it "asks for the marker type" do
    ui = Console_UI.new
    ui.should_receive(:put_to_console)
    ui.ask_for_marker_type
  end
  
  it "asks for the square number to be marked" do
    ui = Console_UI.new
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
    ui = Console_UI.new
    ui.should_receive(:put_to_console)
    ui.marker_error
  end
  
  it "prints the winning piece" do
    ui = Console_UI.new
    ui.should_receive(:put_to_console)
    ui.puts_winner("X")
  end
  
  it "prints out that the game is tied" do
    ui = Console_UI.new
    ui.should_receive(:put_to_console)
    ui.puts_tie
  end
  
  it "asks for first to play" do
    ui = Console_UI.new    
    ui.should_receive(:put_to_console)
    ui.ask_for_first_player
  end
  
  it "gets player type of first player" do
    ui = Console_UI.new
    ui.should_receive(:get_input)
    ui.get_first_player
  end  
  
  it "asks for 1 to restart or any key to exit" do
    ui = Console_UI.new
    ui.should_receive(:put_to_console)
    ui.ask_to_restart
  end
  
  it "asks for width of board" do
    ui = Console_UI.new
    ui.should_receive(:put_to_console)
    ui.ask_for_width_of_board
  end
    
  it "prints the board" do
    ui = Console_UI.new
    board = "board"
    ui.should_receive(:put_to_console)
    ui.print_board(board)
  end
  
  it "asks if user wants to play against a computer" do
    ui = Console_UI.new
    ui.should_receive(:put_to_console)
    ui.ask_for_opponent
  end
  
  it "gets opponent type" do
    ui = Console_UI.new
    ui.should_receive(:get_input)
    ui.get_opponent
  end
  
end
