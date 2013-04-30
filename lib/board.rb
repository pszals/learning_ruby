class Board
	
	def initialize
	  @board = any_size_board(set_width_of_board(3))
	  @width = 3
	end
	
	def any_size_board(width)
	  integer_board = (1..width**2).to_a
	  string_board = integer_board.map {|square| square.to_s}
	  string_board
	end
	
	def any_size_string_board(board)
	  output_board = ""
	  while board.last != nil
      row = board.slice!(0, @width)
      output_board += row.join(' ')
      output_board += "\n"
    end
    output_board
  end
	
	def set_width_of_board(width) 
	  @width = width
	end
	
	def reset_any_size_board
	  @board = any_size_board(set_width_of_board(3))
	end
	
	def reset_board
	  integer_board = (1..9).to_a
	  string_board = integer_board.map {|square| square.to_s}
	  string_board
	end
	
	def get_state_of_board
    @board
	end
	
	def get_state_of_square(square)
    @board[square - 1]
	end
	
	def set_square(square, marker)
	  @board[square - 1] = marker
	end
	
  def square_empty?(board, square) # board should be @board
    board[square - 1] == reset_board[square - 1]? true : false
  end

  def board_open?(board)
    number_of_empty_squares = 0
    empty_board = reset_board
    board.map { |square| number_of_empty_squares += 1 if square == empty_board[square.to_i - 1]}
    number_of_empty_squares >= 1? true : false
  end	

  def winner_on_board?(board)
    winning_marker = false
    combos = [
              [0, 1, 2],
              [3, 4, 5],
              [6, 7, 8],
              [0, 3, 6],
              [1, 4, 7],
              [2, 5, 8],
              [0, 4, 8],
              [6, 4, 2]
             ]
    combos.each do |combo|
      marker = board[combo[0]]
      winner = []
      winner << board[combo[0]] and winner << board[combo[1]] and winner << board[combo[2]]
      if winner.all? { |square| square == marker }
        winning_marker = marker
      end
    end
    return winning_marker
  end

  def number_of_markers(board)
    count = 0
    board.each do |square| 
      if square == 'X' || square == 'O'
      count += 1
      end
    end
    count
  end

end