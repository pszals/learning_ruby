require 'board'

class Io

  def initialize(board)
    @board = board
  end
    
  def ask_for_width_of_board
    put_to_console("Enter 3 for a 3x3 board or 4 for a 4x4 board")
  end

  def get_size_of_board
    get_input
  end
  
  def ask_for_first_player?
    put_to_console("Enter 'X' or 'O'")
  end
  
  def get_first_player
    get_input
  end

  def get_input
    gets
  end

  def puts_turn(marker_type)
    marker = marker_type 
    put_to_console("It is #{marker}'s turn")
  end

  def ask_for_square_to_mark?
    put_to_console('Pick an empty square to mark')
  end
    
  def marker_error
    put_to_console("That square is already taken or not on the board")
  end
  
  def put_to_console(output)
    puts output
  end
  
  def get_square_to_mark
    get_input
  end

  def puts_winner(winning_marker)
    winner = winning_marker
    put_to_console("Player #{winner} wins")
  end

  def ask_to_restart?
    put_to_console("Enter 1 to restart or any key to exit")
  end

end