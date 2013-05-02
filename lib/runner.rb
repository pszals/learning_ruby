require 'player'
require 'board'
require 'io'

class Runner
  
  def initialize(board, io)
    @player_x = Player.new('X')
    @player_o = Player.new('O')
    @board = board
    @io = io
  end
  
  def get_io
    @io
  end
  
  def get_player_x
    @player_x    
  end
  
  def get_player_o
    @player_o
  end
  
  def get_board
    @board
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
    empty_squares%2 == 0 ? get_player_o.get_marker : get_player_x.get_marker
  end
  
  def restart?(input)
    input == 1 ? setup : exit  
  end
  
  def play_game
    board = @board.get_state_of_board
    empty_squares = number_of_empty_squares(board)
    marker = whose_turn?(empty_squares)
    @io.puts_turn(marker)
    @io.ask_for_square_to_mark?
    
    square = @io.get_square_to_mark
    if @board.square_empty?(board, square) == false
      @io.marker_error
    end
  
  end
  
  def setup
    @io.ask_for_width_of_board
  end
  
end
  
  