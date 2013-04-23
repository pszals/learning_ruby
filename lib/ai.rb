require 'board'

class Ai
  
  def initialize
    @board = Board.new
  end
  
  def complete_top_row(board)
    if board[0] == board[1] || board[0] == board[2] || board[1] == board[2]
      if board[0] != 'O' && board[1] != 'O' && board[2] != 'O'
        true
      else
        false
      end
    else
      false
    end
  end

    def complete_second_row(board)
    if board[3] == board[4] || board[3] == board[5] || board[4] == board[5]
      if board[3] != 'O' && board[4] != 'O' && board[5] != 'O'
        true
      else
        false
      end
    else
      false
    end
  end
  
  def complete_any_row(board)
    combos = [
              [0, 1, 2],
              [3, 4, 5],
              [6, 7, 8],
              [0, 3, 6],
              [1, 4, 7],
              [2, 5, 8],
              [0, 4, 8],
              [6, 4, 2]
            ]
    combos.each do |combo|
      marker = 'X'
      row = []
      row << board[combo[0]] and row << board[combo[1]] and row << board[combo[2]]
      if row[0] == row[1] || row[0] == row[2] || row[1] == row[2]
        to_fill = row.detect { |square| square != marker }
        return to_fill
      else
        return false
      end
    end  
  end
  
end