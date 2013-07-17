# require 'io'
# 
# describe Io do
# 
#   it "prints 'It's X's turn" do
#     io = Io.new
#     io.should_receive(:put_to_console)
#     io.puts_turn("X")
#   end
# 
#   it "gets the width of the board" do
#     io = Io.new
#     io.should_receive(:get_input)
#     io.get_width_of_board
#   end  
#     
#   it "gets the square number to be marked from user" do
#     io = Io.new
#     io.should_receive(:get_input)
#     io.get_square_to_mark
#   end
#   
#   it "asks for the marker type" do
#     io = Io.new
#     io.should_receive(:put_to_console)
#     io.ask_for_marker_type
#   end
#   
#   it "asks for the square number to be marked" do
#     io = Io.new
#     io.should_receive(:put_to_console)
#     io.ask_for_square_to_mark
#   end
# 
#   it "prints error message if square is marked or improper input" do
#     io = Io.new
#     io.should_receive(:put_to_console)
#     io.marker_error
#   end
#   
#   it "prints the winning piece" do
#     io = Io.new
#     io.should_receive(:put_to_console)
#     io.puts_winner("X")
#   end
#   
#   it "prints out that the game is tied" do
#     io = Io.new
#     io.should_receive(:put_to_console)
#     io.puts_tie
#   end
#   
#   it "asks for first to play" do
#     io = Io.new    
#     io.should_receive(:put_to_console)
#     io.ask_for_first_player
#   end
#   
#   it "gets player type of first player" do
#     io = Io.new
#     io.should_receive(:get_input)
#     io.get_first_player
#   end  
#   
#   it "asks for 1 to restart or any key to exit" do
#     io = Io.new
#     io.should_receive(:put_to_console)
#     io.ask_to_restart
#   end
#   
#   it "asks for width of board" do
#     io = Io.new
#     io.should_receive(:put_to_console)
#     io.ask_for_width_of_board
#   end
#     
#   it "prints the board" do
#     io = Io.new
#     board = "board"
#     io.should_receive(:put_to_console)
#     io.print_board(board)
#   end
#   
#   it "asks if user wants to play against a computer" do
#     io = Io.new
#     io.should_receive(:put_to_console)
#     io.ask_for_opponent
#   end
#   
#   it "gets opponent type" do
#     io = Io.new
#     io.should_receive(:get_input)
#     io.get_opponent
#   end
#   
# end
