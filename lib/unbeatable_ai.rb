require 'board'

class Unbeatable_AI

  def get_opponent(marker)
    marker == 'X' ? 'O' : 'X'
  end

  def score_board(board, marker)
    if !board.board_open? and !board.winner_on_board?
      return 0 
    elsif board.game_won?(marker)
      1.0
    else
      -1.0
    end
  end

  def minimax(board, marker, depth)
    opponent = get_opponent(marker)
    score = 0
    best_score = -1.0/0
    if board.game_over?
      return score_board(board, marker) / depth
    else
      board.list_of_open_squares.each do |square|
        board.set_square(square, marker)
        score = -minimax(board, opponent, depth + 1)
        best_score = score if score > best_score
        board.undo_set_square(square)
      end
      return best_score 
    end
  end
  
  def make_move(board, marker)
    list_of_scores = []
    best_square = nil
    best_score = -1.0/0
    opponent = get_opponent(marker)
    board.list_of_open_squares.each do |square|
      board.set_square(square, marker)
      score = -minimax(board, opponent, 1)
      board.undo_set_square(square)
      list_of_scores << score      
      if score > best_score

        best_score = score
        best_square = square
      end
    end
    p list_of_scores
    return best_square

  end
  
end