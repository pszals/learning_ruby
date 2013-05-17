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
	  output = ""
	  gs = @game_state.dup
	  while gs.last != nil
      row = gs.slice!(0, @board_width)
      output += row.join(' ')
      output += "\n"
    end
    output
  end
		
	def reset_any_size_board
	  @game_state = any_size_board(@board_width)
	end
		
	def set_square(square, marker)
	  @game_state[square - 1] = marker
	end
	
  def square_empty?(square)
    @game_state[square - 1] == square.to_s ? true : false
  end
  
  def number_of_empty_squares
    empty_squares = 0
    @game_state.map do |square| 
      empty_squares += 1 if square_empty?(square.to_i) == true
    end
    empty_squares  
  end

  def board_open?
    number_of_empty_squares = 0
    @game_state.map do |square| 
      number_of_empty_squares += 1 if square_empty?(square.to_i) == true  
    end
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
      winner << @game_state[combo[0]]
      winner << @game_state[combo[1]]
      winner << @game_state[combo[2]]
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