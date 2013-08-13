class BoardBase
  attr_accessor :current_board, :width

  def initialize
    @current_board = []
    @width         = 0
  end

  def integer_board
    (1..@width**2).to_a
  end

  def board_to_strings
    integer_board.map { |square| square.to_s }
  end

  def reset_board
    @current_board = board_to_strings
  end
end
