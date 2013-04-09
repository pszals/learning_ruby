class Board
	
	def initialize
	  @board = reset_board
	end
	
	def reset_board
	  (1..9).to_a
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
	
end