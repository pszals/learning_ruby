require 'board'

class Io

  def initialize(board)
    @board = board
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