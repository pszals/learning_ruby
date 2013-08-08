class Board

  attr_accessor :width, :current_board, :player_1, :player_2
	
  def initialize(player_1, player_2)
    @width = 3
    @current_board = squares_with_integers
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def whose_turn
    number_of_empty_squares%2 == 0 ? @player_2.marker : @player_1.marker
  end
  
  def get_opponent
    number_of_empty_squares%2 != 0 ? @player_2.marker : @player_1.marker
  end
  
  def integer_board
    (1..@width**2).to_a
  end
	
  def squares_with_integers
    integer_board.map {|square| square.to_s}
  end
	
  def display_board
    if @width == 3
      @current_board.each_slice(@width).
                     map { |a,b,c| " #{a} | #{b} | #{c} \n" }.
                     join("---|---|---\n")
    else
      @current_board.each_slice(@width).
                     map { |a,b,c,d| " #{a} | #{b} | #{c} | #{d} \n" }.
                     join("---|---|---|---\n")      
    end
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
  
  def number_of_empty_squares
    list_of_open_squares.length
  end

  def board_open?
    number_of_empty_squares >= 1? true : false
  end	

  def number_of_filled_squares
    @current_board.length - list_of_open_squares.length
  end

  def winner
    winning_marker = :no_winner
    gather_winning_combinations.each do |combo|
      marker = @current_board[combo[0]]
      winner = []
      positions = (0...@width).to_a
      positions.each {|position| winner << @current_board[combo[position]]}
      if winner.all? { |square| square == marker }
        winning_marker = marker
      end
    end
    return winning_marker
  end
  
  def game_over?
     !board_open? or game_won?
  end
  
 def game_won?
    winner == :no_winner ? false : true
 end

 def rows
    @current_board.each_slice(@width)
 end
  
  def board_indices
    (0...@width**2).to_a
  end
  
  def winning_rows
    board_indices.each_slice(@width).reduce([]) {|rows, slice| rows << slice}
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
  
  def gather_winning_combinations
    combos = []
    winning_rows.each {|row| combos << row } and
    combos << diagonal_down and
    combos << diagonal_up and
    winning_columns.each {|column| combos << column}
    combos
  end

end
