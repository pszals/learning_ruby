require 'board'

class Ai
  
  attr_reader :board
  attr_accessor :opponent
  
  def initialize(board)
    @board = board
    @opponent = false
  end
  
  def make_move
    if (ai_move = complete_any_row)
      return ai_move
    elsif (ai_move = make_or_block_fork)
      return ai_move
    elsif (ai_move = mark_center)
      return ai_move
    elsif (ai_move = mark_opposite_corner)
      return ai_move
    elsif (ai_move = mark_corner)
      return ai_move
    else
      mark_side
    end
  end
  
  def complete_any_row
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
      row = []
      row << @board.current_board[combo[0]] 
      row << @board.current_board[combo[1]]
      row << @board.current_board[combo[2]]
      if row[0] == row[1] || row[0] == row[2] || row[1] == row[2]
        to_fill = row.detect { |square| @board.square_empty?(square.to_i)}
        if to_fill != nil
          return to_fill.to_i
        end
      end
    end
    return false
  end
  
  def make_or_block_fork
    ai_move = false
    if @board.current_board[0] == @board.current_board[8]
      if @board.square_empty?(2) and @board.square_empty?(6)
        ai_move = 2
      elsif @board.square_empty?(4) and @board.square_empty?(8)
        ai_move = 4
      end
    elsif @board.current_board[2] == @board.current_board[6] 
      if @board.square_empty?(2) and @board.square_empty?(4)
        ai_move = 2
      elsif @board.square_empty?(6) and @board.square_empty?(8)
        ai_move = 4
      end
    end
    ai_move
  end

  def mark_center
    center_square = false
    if @board.square_empty?(5)
      center_square = 5
    end
    center_square
  end
  
  def mark_opposite_corner
    corner_pairs = [[1, 9],[3, 7], [7, 3], [9, 1]]
    corner_pairs.each do |square, opposite|
      if not @board.square_empty?(square) and @board.square_empty?(opposite)
        return opposite
      end  
    end
    return false
  end
  
  def mark_corner
    corners = [1, 3, 7, 9]
    corners.each do |corner|
      if @board.square_empty?(corner)
        return corner
      end
    end
    return false
  end
 
  def mark_side
    sides = [8, 6, 4, 2]
    sides.each do |side|
      if @board.square_empty?(side)
        return side
      end
    end
    return false
  end
end