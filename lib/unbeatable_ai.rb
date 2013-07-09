require 'board'
require 'game'

class Unbeatable_AI
  
  attr_accessor :opponent

  def initialize
    @opponent = false
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

   def minimax(board, marker, depth, alpha, beta)
    opponent = board.get_opponent
    score = 0
    best_score = -1.0/0
    if board.game_over?
      return score_board(board, marker) / depth
    else
      new_alpha = alpha
      board.list_of_open_squares.each do |square|
        board.set_square(square, marker)
        score = -minimax(board, opponent, depth + 1, -new_alpha, -beta)
        new_alpha = score
        board.undo_set_square(square)
#         if new_alpha >= beta
#           return new_alpha
#         end
        best_score = score if score > best_score
#         new_alpha = best_score if score > alpha
      end
      return best_score 
    end
  end
  
  def make_move(board, marker)
    best_square = nil
    best_score = -1.0/0
    opponent = board.get_opponent
    board.list_of_open_squares.each do |square|
      board.set_square(square, marker)
      score = -minimax(board, opponent, 1, -1.0/0, 1.0/0)
      board.undo_set_square(square)
      if score > best_score
        best_score = score
        best_square = square
      end 
    end
    return best_square
  end
end