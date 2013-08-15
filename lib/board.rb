class Board

  attr_accessor :player_1, :player_2, :current_board, :width

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @width = 3
    @current_board = board_to_strings
  end

  def reset_board
    @current_board = board_to_strings
  end

  def set_square(index_plus_one, marker)
    current_board[index_plus_one.to_i - 1] = marker
  end

  def undo_set_square(square)
    set_square(square, square.to_s)
  end

  def integer_board
    (1..@width**2).to_a
  end

  def board_to_strings
    integer_board.map { |square| square.to_s }
  end

  def board_indices
    (0...@width**2).to_a
  end
end
