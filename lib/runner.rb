require 'player'
require 'board'
require 'io'

class Runner
  
  def initialize
    @player_x = Player.new('X')
    @player_o = Player.new('O')
    @board = Board.new
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
  
  def whose_turn?(number_of_empty_squares)
    number_of_empty_squares%2 == 0 ? get_player_o.get_marker : get_player_x.get_marker
  end
  
  def play
    @board.print_board(get_board)
  end
  
  def restart?(input)
    input == 1 ? restart : exit  
  end
  
  def restart
  
  end
end
  
  