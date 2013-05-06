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
    
    square = @io.get_square_to_mark
    if @board.square_empty?(board, square) == false # How do I change and test this as a while loop?
      @io.marker_error
      @io.ask_for_square_to_mark?
      square = @io.get_square_to_mark
    end
    if
      @board.square_empty?(board, square) == true
      place_marker(square, marker)
    end
  end
  
  def setup
    @io.ask_for_width_of_board
  end

  def play_game(board)
    winner = @board.winner_on_board?(board)
    open_board = @board.board_open?(board)
    if winner == false and open_board == true # How do I change and test this as a while loop?
      take_turn(board)
    elsif winner != false
      @io.puts_winner(winner)
    else
      @io.puts_tie
      @io.ask_to_restart?
      choice = @io.get_input
      restart?(choice)
    end
  end  
end
  
  