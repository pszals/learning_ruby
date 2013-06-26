require 'board'

class Unbeatable_AI

  def get_opponent(marker)
    marker == 'X' ? 'O' : 'X'
  end

  def score_board(board, marker)
    if !board.board_open? and !board.winner_on_board?
      return 0 
    elsif board.game_won?(marker)
      return 1
    else
      return -1
    end
  end

  def minimax(board, marker, depth, alpha=1.0/0)
    opponent = get_opponent(marker)
    
    if board.game_over?
      return score_board(board, marker) + depth
    else
      board.list_of_open_squares.each do |square|
        board.set_square(square, marker)
        score = -minimax(board, opponent, depth + 1, alpha)
        board.undo_set_square(square)
        alpha = score
      end
      return alpha
    end
  end
  
  def make_move(board, marker)
    opponent = get_opponent(marker)
    best_square = '1'
    best_score = -1.0/0
    board.list_of_open_squares.each do |square|
      board.set_square(square, marker)
      score = -minimax(board, opponent, 0)
      board.undo_set_square(square)
      
      if score > best_score
        score = best_score
        best_square = square
      end
      
    return best_square
    end
  end

  
 #  def minimax(board, marker, alpha, beta, depth)
#     alpha = alpha
#     beta = beta
#     opponent = get_opponent(marker)
#     if board.winner_on_board?
#       return score_board(board) + depth
#     else
#       new_alpha = alpha
#       board.list_of_open_squares.each do |square|
#         board.set_square(square, marker)
#         score = -minimax(board, opponent, -new_alpha, -beta, depth+1)
#         board.undo_set_square(square)
#         new_alpha = score
#   
#         if new_alpha >= beta
#           return new_alpha
#         end 
#   
#       end
#     end
#     
#     return new_alpha
#   end
#   
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
