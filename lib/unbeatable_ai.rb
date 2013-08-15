require 'board'

class Unbeatable_AI
  
  attr_accessor :opponent

  def initialize
    @opponent = false
  end

  def score_board(rules, marker)
    if rules.winner == :no_winner 
      return 0 
    elsif rules.winner == marker
      1.0
    else
      -1.0
    end
  end

  def minimax(rules, marker, depth, alpha, beta)
    opponent = rules.get_opponent
    score = 0
    best_score = -1.0/0
    if rules.game_over?
      return score_board(rules, marker) / depth
    else
      new_alpha = alpha
      rules.list_of_open_squares.each do |square|
        rules.board.set_square(square, marker)
        score = -minimax(rules, opponent, depth + 1, -new_alpha, -beta)
        rules.board.undo_set_square(square)
        best_score = score if score > best_score
      end
      return best_score 
    end
  end
  
  def make_move(rules, marker)
    best_square = nil
    best_score = -1.0/0
    opponent = rules.get_opponent
    rules.list_of_open_squares.each do |square|
      rules.board.set_square(square, marker)
      score = -minimax(rules, opponent, 1, -1.0/0, 1.0/0)
      rules.board.undo_set_square(square)
      if score > best_score
        best_score = score
        best_square = square
      end 
    end
    return best_square
  end
end
