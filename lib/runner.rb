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
    state.map { |square| number_of_empty_squares += 1 if square == empty_board[square.to_i - 1]}
    if number_of_empty_squares >= 1
      true
    else
      false
    end
  end
  
  def check_top_row(state)
    marker = state[0]
    if state[0..2].all? { |square| square == marker }
      true
    else
      false
    end
  end
  
  def check_second_row(state)
    marker = state[3]
    if state[3..5].all? { |square| square == marker }
      true
    else
      false
    end
  end

  def check_third_row(state)
    marker = state[6]
    if state[6..8].all? { |square| square == marker }
      true
    else
      false
    end
  end

  def check_first_column(state)
    marker = state[0]
    first_column = []
    first_column << state[0] and state[3] and state[6]
    if first_column.all? { |square| square == marker }
      true
    else
      false
    end
  end  

  def check_second_column(state)
    marker = state[1]
    column = []
    column << state[1] and state[4] and state[7]
    if column.all? { |square| square == marker }
      true
    else
      false
    end
  end  

  def check_third_column(state)
    marker = state[2]
    column = []
    column << state[2] and state[5] and state[8]
    if column.all? { |square| square == square }
      true
    else
      false
    end
  end  

  def check_diagonal_down(state)
    marker = state[0]
    diagonal = []
    diagonal << state[0] and state[4] and state[8]
    if diagonal.all? { |square| square == marker }
      true
    else
      false
    end
  end  

  def check_diagonal_up(state)
    marker = state[6]
    diagonal = []
    diagonal << state[6] and state[4] and state[2]
    if diagonal.all? { |square| square == marker }
      true
    else
      false
    end
  end  

end