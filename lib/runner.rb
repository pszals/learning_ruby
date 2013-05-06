require 'player'
require 'board'
require 'io'

class Runner
  
  attr_reader :io, :board, :player_x, :player_o

  def initialize(board, io)
    @player_x = Player.new('X')
    @player_o = Player.new('O')
    @board = board
    @io = io
  end
    
  def place_marker(square, marker)
    @board.set_square(square, marker)
  end
      
  def get_winner(board)
    @board.winner_on_board?(board)
  end
  
  def number_of_empty_squares(board)
    empty_squares = 0
    empty_board = @board.reset_board
    board.map do |square| 
      empty_squares += 1 if square == empty_board[square.to_i - 1]
    end
    empty_squares  
  end
  
  def whose_turn?(empty_squares)
    empty_squares%2 == 0 ? player_o.marker : player_x.marker
  end
  
  def restart?(input)
    input == 1 ? setup : exit  
  end
  
  def take_turn(board)
    empty_squares = number_of_empty_squares(board)
    marker = whose_turn?(empty_squares)
    @io.puts_turn(marker)
    @io.ask_for_square_to_mark? 
    @io.print_board(@board.output_board(board))
            
    square = @io.get_square_to_mark.to_i
    if @board.square_empty?(board, square) == false
      @io.marker_error
      @io.ask_for_square_to_mark?
      play_game(board)
    end
    place_marker(square, marker)
    play_game(@board.board)
  end

  def play_game(board) # Should maybe rename function to "check_board"?
    winner = @board.winner_on_board?(board)
    open_board = @board.board_open?(board)

    if winner == false and open_board == true
      take_turn(board)
    elsif winner != false
      @io.puts_winner(winner) # <--- Add code for restarting here
    else
      @io.puts_tie
      @io.ask_to_restart?
      choice = @io.get_input
      restart?(choice)
    end
  end
  
  def setup
    board_class = Board.new
    io = Io.new
    board = board_class.board
    runner = Runner.new(board, io)
    play_game(board)
  end  
end

#board = Board.new
#io = Io.new
#runner = Runner.new(board, io)
#game_board = board.board
#runner.play_game(game_board)