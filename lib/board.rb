class Board

  attr_accessor :board_width, :current_board
	
  def initialize
    @board_width = 3
    @current_board = squares_with_integers
  end
	
  def squares_with_integers
    integer_board = (1..@board_width**2).to_a
    string_board = integer_board.map {|square| square.to_s}
    string_board
  end
	
  def board_to_string
    output = ""
    board = @current_board.dup
    while board.last != nil
      row = board.slice!(0, @board_width)
      output += row.join(' ')
      output += "\n"
    end
    output
  end
		
  def reset_board
    @current_board = squares_with_integers
  end
		
  def set_square(square, marker)
    @current_board[square - 1] = marker
  end
	
  def square_empty?(square)
    @current_board[square - 1] == square.to_s ? true : false
  end
  
  def number_of_empty_squares
    @board_width**2 - number_of_markers
  end

  def board_open?
    number_of_empty_squares >= 1? true : false
  end	

  def number_of_markers
    count = 0
    @current_board.each do |square| 
      if square == 'X' || square == 'O'
      count += 1
      end
    end
    count
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
      marker = @current_board[combo[0]]
      winner = []
      winner << @current_board[combo[0]]
      winner << @current_board[combo[1]]
      winner << @current_board[combo[2]]
      if winner.all? { |square| square == marker }
        winning_marker = marker
      end
    end
    return winning_marker
  end

end