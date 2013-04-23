require 'board'

class Io

  def initialize(board)
    @board = board
  end

  def print_row_one
 	  # Consider refactoring to use each_slice
    state = @board.get_state_of_board
    row_one = state[0..2].join(' ')
    row_one += "\n"    
    row_one
  end
  
  def print_row_two
    state = @board.get_state_of_board
    row_two = state[3..5].join(' ')
    row_two += "\n"    
    row_two
  end

  def print_row_three
    state = @board.get_state_of_board
    row_three = state[6..8].join(' ')   
    row_three
  end
  
  def print_whole_board
    print_row_one + print_row_two + print_row_three
  end
  
  def square_to_mark(user_input)
    # puts "Pick an empty square to mark"
    # square = gets
    # square
    user_input
  end
  
  def print_turn(marker_type)
    marker = marker_type 
    "It is #{marker}'s turn"    
  end
  
  def get_square(square)
    square = gets.chomp
    return square
  end  

  def print_winner(winning_marker)
    winner = winning_marker
    "Player #{winner} wins"
  end
end