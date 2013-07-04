class Board

  attr_accessor :width, :current_board
	
  def initialize
    @width = 3
    @current_board = squares_with_integers
  end
  
  def integer_board
    (1..@width**2).to_a
  end
	
  def squares_with_integers
    string_board = integer_board.map {|square| square.to_s}
    string_board
  end
	
  def display_board
    @current_board.each_slice(@width).
                   map { |a,b,c| " #{a} | #{b} | #{c} \n" }.
                   join("---|---|---\n")
  end
		
  def reset_board
    @current_board = squares_with_integers
  end
		
  def set_square(square, marker)
    @current_board[square.to_i - 1] = marker
  end
  
  def undo_set_square(square)
    set_square(square, square.to_s)
  end
	
  def square_empty?(square)
    @current_board[square.to_i - 1] == square.to_s ? true : false
  end
  
  def list_of_open_squares
    @current_board.select {|square| square_empty?(square.to_i)}
  end
  
  def empty_squares
    list_of_open_squares.length
  end

  def board_open?
    empty_squares >= 1? true : false
  end	

  def number_of_filled_squares
    @current_board.length - list_of_open_squares.length
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
  
  def game_over?
    (!board_open? or winner_on_board?) ? true : false
  end
  
  def game_won?(marker)
    winner_on_board? == marker ? true : false
  end
  
  def board_indices
    (0..@width**2-1).to_a
  end
  
  def winning_rows
    rows = []
    board_indices.each_slice(@width) {|slice| rows << slice}
    rows
  end
  
  def generate_column(starting_index)
    (0...@width).reduce([]) {|column, index| 
      column << (index*@width+starting_index)
    }
  end
  
  def winning_columns
    (0...@width).reduce([]) {|set_of_columns, index| 
      set_of_columns << generate_column(index)
    }
  end
  
  def diagonal_down
    (0...@width).reduce([]) {|diagonal, index| 
      diagonal << index*(@width + 1)
    }
  end
  
  def diagonal_up
    (0...@width).reduce([]) {|diagonal, index| 
      diagonal << (index + 1)*(@width - 1)
    }
  end

  def winning_diagonals
    [] << diagonal_down << diagonal_up 
  end

end