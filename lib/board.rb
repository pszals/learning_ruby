class Board

  attr_accessor :board_width, :game_state
	
	def initialize
	  @board_width = 3
	  @game_state = any_size_board(@board_width)
	end
	
	def any_size_board(width)
	  integer_board = (1..width**2).to_a
	  string_board = integer_board.map {|square| square.to_s}
	  string_board
	end
	
	def output_board
	  output_board = ""
	  while @game_state.last != nil
      row = @game_state.slice!(0, @board_width)
      output_board += row.join(' ')
      output_board += "\n"
    end
    output_board
  end
		
	def reset_any_size_board
	  @board = any_size_board(@board_width)
	end
	
	def reset_board
	  integer_board = (1..9).to_a
	  string_board = integer_board.map {|square| square.to_s}
	  string_board
	end
	
	def get_state_of_square(square)
    @game_state[square - 1]
	end
	
	def set_square(square, marker)
	  @game_state[square - 1] = marker
	end
	
  def square_empty?(square)
    @game_state[square - 1] == reset_board[square - 1]? true : false
  end

  def board_open?
    number_of_empty_squares = 0
    empty_board = reset_board
    @game_state.map { |square| number_of_empty_squares += 1 if square == empty_board[square.to_i - 1]}
    number_of_empty_squares >= 1? true : false
  end	

  def winner_on_board?
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
      marker = @game_state[combo[0]]
      winner = []
      winner << @game_state[combo[0]] and winner << @game_state[combo[1]] and winner << @game_state[combo[2]]
      if winner.all? { |square| square == marker }
        winning_marker = marker
      end
    end
    return winning_marker
  end

  def number_of_markers
    count = 0
    @game_state.each do |square| 
      if square == 'X' || square == 'O'
      count += 1
      end
    end
    count
  end

end