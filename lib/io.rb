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

  def puts_winner(winning_marker)
    winner = winning_marker
    puts "Player #{winner} wins"
  end
end