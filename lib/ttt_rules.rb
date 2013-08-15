class TTTRules

  attr_accessor :current_board, :board, :player_1, :player_2, :width

  def initialize(board)
    @board         = board
    @width         = board.width
    @current_board = board.current_board
    @player_1      = board.player_1
    @player_2      = board.player_2
  end

  def list_of_open_squares
    @current_board.select {|square| square_empty?(square.to_i)}
  end
  
  def number_of_empty_squares
    list_of_open_squares.length
  end

  def board_open?
    number_of_empty_squares >= 1 
  end	

  def which_player(conditional)
    conditional ? player_2.marker : player_1.marker
  end
  
  def whose_turn
    which_player(number_of_empty_squares%2 == 0) 
  end

  def get_opponent
    which_player(whose_turn == player_1.marker) 
  end

  def square_empty?(square)
    if square.to_i != 0
      @current_board[square.to_i - 1] == square.to_s
    else
      false
    end
  end

  def game_over?
    !board_open? or game_won?
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

  def game_won?
    winner != :no_winner
  end

  def gather_winning_combinations
    combos = []
    winning_rows.each {|row| combos << row } and
    combos << diagonal_down and
    combos << diagonal_up and
    winning_columns.each {|column| combos << column}
    combos
  end

  def winning_rows
    board.board_indices.each_slice(@width).reduce([]) {|rows, slice| rows << slice}
  end
  
  def rows
    @current_board.each_slice(@width)
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

end
