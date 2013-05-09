require 'board'

class Ai
  
  attr_reader :board
  
  def initialize(board)
    @board = board
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
      row << @board.game_state[combo[0]] 
      row << @board.game_state[combo[1]]
      row << @board.game_state[combo[2]]
      if row[0] == row[1] || row[0] == row[2] || row[1] == row[2]
        to_fill = row.detect { |square| @board.square_empty?(square.to_i)}
        if to_fill == nil
          to_fill = false
        end
        return to_fill
      end
    end  
  end
  
  def mark_center
    center_square = false
    if @board.square_empty?(5)
      center_square = '5'
    end
    center_square
  end
  
  def mark_corner
    open_corner = false
    corners = [1, 3, 7, 9]
    corners.each do |corner|
      if @board.square_empty?(corner)
        open_corner = corner.to_s
      end
    end
    return open_corner
  end

  def mark_opposite_corner
    open_corner = false
    corner_pairs = [[1, 9],[3, 7], [7, 3], [9, 1]]
    corner_pairs.each do |square, opposite|
      if not @board.square_empty?(square) and @board.square_empty?(opposite)
        open_corner = opposite.to_s
      end  
    end
    return open_corner
  end
  
  def mark_side_square
    open_side = false
    sides = [8, 6, 4, 2]
    sides.each do |side|
      if @board.square_empty?(side)
        open_side = side.to_s
      end
    end
    return open_side
  end
end