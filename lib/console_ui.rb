class Console_UI
  
  def ask_for_width_of_board
    put_to_console("Enter 3 for a 3x3 board or 4 for a 4x4 board.")
  end

  def get_width_of_board
    get_input
  end
  
  def ask_for_first_player
    put_to_console("Enter 'X' or 'O.'")
  end
  
  def ask_for_marker_type
    put_to_console("Enter a character A-Z to serve as your marker type")
  end
  
  def get_marker_type
    gets.chomp
  end
  
  def get_first_player
    get_input
  end
  
  def ask_for_opponent
    put_to_console("Enter 1 for computer opponent or any key for human opponent")
  end
  
  def get_opponent
    get_input
  end

  def puts_turn(marker) 
    put_to_console("It is #{marker}'s turn.")
  end

  def ask_for_square_to_mark
    put_to_console('Pick an empty square to mark: ')
  end
    
  def marker_error
    put_to_console("Input error.")
  end
  
  def get_square_to_mark
    get_input
  end

  def puts_winner(winning_marker)
    put_to_console("Player #{winning_marker} wins!")
  end

  def puts_tie
    put_to_console("Tie Game!")
  end

  def ask_to_restart
    put_to_console("Enter 1 to restart or any key to exit.")
  end
  
  def print_board(board)
    put_to_console(board)
  end

  def put_to_console(output)
    puts output
  end  

  def get_input
    gets.chomp.to_i
  end

end