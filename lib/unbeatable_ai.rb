require 'board'

class UnbeatableAI
  
  attr_accessor :board
  
  def initialize
    @board = Board.new
  end
  
  def get_opponent(marker)
    marker == 'X' ? 'O' : 'X'
  end

  def score_board(board)
    if !board.board_open? and !board.winner_on_board?
      return 0 
    elsif board.winner_on_board? == 'X'
      return 1
    else
      return -1
    end
  end

end


=begin
  
    IF it is marker's turn
      For each empty square on board, set_square(square, marker)
      IF winner_on_board == True
        square_score += 1
        undo_set_square(square)

      ELSE 
        put a O in that square
        undo_set_square(square)
    
    IF it is O's turn and Find winner on board == True
      square_score -= 1
    ELSIF it is X's turn and Find winner on board == True
      square_score += 1
      
=end
