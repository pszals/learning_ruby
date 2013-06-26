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

  def minimax(board, marker, depth, alpha)
    alpha = 1.0/0
    opponent = get_opponent(marker)
    
    if board.game_over?
      return score_board(board, marker) + depth
    else
      board.list_of_open_squares.each do |square|
        board.set_square(square, marker)
        score = -minimax(board, opponent, depth + 1, alpha)
        board.undo_set_square(square)
        if score < alpha
          alpha = score
        end
      end
      return alpha
    end
  end
  
  def make_move(board, marker)
    opponent = get_opponent(marker)
    best_square = '1'
    best_score = 1.0/0
    board.list_of_open_squares.each do |square|
      board.set_square(square, marker)
      score = -minimax(board, opponent, 0, -1.0/0)
      board.undo_set_square(square)
      
      if score < best_score
        score = best_score
        best_square = square
      end
      
    return best_square
    end
  end
end