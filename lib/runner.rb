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
    if current_board[square - 1] == @board.reset_board[square - 1]
      true
    else
      false
    end
  end
  
  def check_if_board_is_open(state)
    number_of_empty_squares = 0
    empty_board = @board.reset_board
    state.map { |square| number_of_empty_squares += 1 if square == empty_board[square - 1]}
      if number_of_empty_squares >= 1
        true
      end
  end

end