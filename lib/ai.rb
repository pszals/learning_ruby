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
      row = []
      row << board[combo[0]] and row << board[combo[1]] and row << board[combo[2]]
      if row[0] == row[1] || row[0] == row[2] || row[1] == row[2]
        to_fill = row.detect { |square| @board.square_empty?(board, square.to_i)}
        return to_fill
      end
    end  
  end
  
  def mark_center(board)
    center_square = false
    if @board.square_empty?(board, 5)
      center_square = '5'
    end
    center_square
  end
  
  def mark_corner(board)
    open_corner = false
    corners = [1, 3, 7, 9]
    corners.each do |corner|
      if @board.square_empty?(board, corner)
        open_corner = corner.to_s
      end
    end
    return open_corner
  end

  def mark_opposite_corner(board)
    open_corner = false
    corner_pairs = [[1, 9],[3, 7], [7, 3], [9, 1]]
    corner_pairs.each do |square, opposite|
      if not @board.square_empty?(board, square) and @board.square_empty?(board, opposite)
        open_corner = opposite.to_s
      end  
    end
    return open_corner
  end
  
  def mark_side_square(board)
    open_side = false
    sides = [8, 6, 4, 2]
    sides.each do |side|
      if @board.square_empty?(board, side)
        open_side = side.to_s
      end
    end
    return open_side
  end
end