require 'board'

class Io

  def initialize(board)
    @board = board
  end

  def print_row_one
 	  # Consider refactoring to use each_slice
    board = @board.get_state_of_board
    row_one = board[0..2].join(' ')
    row_one += "\n"    
    row_one
  end
  
  def print_row_two
    board = @board.get_state_of_board
    row_two = board[3..5].join(' ')
    row_two += "\n"    
    row_two
  end

  def print_row_three
    board = @board.get_state_of_board
    row_three = board[6..8].join(' ')   
    row_three
  end

  def get_square
    get_input
  end  
  
  def get_input
    gets
  end
  
  def puts_turn(marker_type)
    marker = marker_type 
    put_to_console("It is #{marker}'s turn")
  end
  
  def puts_winner(winning_marker)
    winner = winning_marker
    put_to_console("Player #{winner} wins")
  end
  
  def marker_error
    put_to_console('That is either not a square on the board or that square is filled')
  end
  
  def put_to_console(output)
    puts output
  end
  
  def ask_for_first_player?
    put_to_console("Enter 'X' or 'O'")
  end
  
  def get_first_player
    get_input
  end
  
  def ask_to_restart?
    put_to_console("Enter 1 to restart or any key to exit")
  end
end