require 'player'
require 'board'

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
  
  def take_turn(square, marker)
    @board.set_square(square, marker)
  end
  
  def check_if_square_is_empty(current_board, square)
    if current_board[square] == @board.reset_board[square]
      true
    end
  end
  
end