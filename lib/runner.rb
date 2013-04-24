require 'player'
require 'board'
require 'io'

class Runner
  
  def initialize
    @player_x = Player.new('X')
    @player_o = Player.new('O')
    @board = Board.new
  end
  
  def get_player_x
    @player_x    
  end
  
  def get_player_o
    @player_o
  end
  
  def get_board
    @board
  end
  
  def place_marker(square, marker)
    @board.set_square(square, marker)
  end
    
  def board_open?(board)
    number_of_empty_squares = 0
    empty_board = @board.reset_board
    board.map { |square| number_of_empty_squares += 1 if square == empty_board[square.to_i - 1]}
    if number_of_empty_squares >= 1
      true
    else
      false
    end
  end
  
  def winner_on_board?(board)
    winning_marker = false
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
      marker = board[combo[0]]
      winner = []
      winner << board[combo[0]] and winner << board[combo[1]] and winner << board[combo[2]]
      if winner.all? { |square| square == marker }
        winning_marker = marker
      end
    end
    return winning_marker
  end
  
  def winner_name(board)
    winner_on_board?(board)
  end
  
  def number_of_markers(board)
    count = 0
    board.map {|square| count += 1 if square[board] == 'X' || sqauare[board] == 'O'}
    count
  end
  
  def whos_turn?(board)
    number_of_empty_squares = 0
    empty_board = @board.reset_board
    board.map { |square| number_of_empty_squares += 1 if square == empty_board[square.to_i - 1]}
    if number_of_empty_squares == 9
      rand = rand(10)
      if rand>5 
        return 'X'
      else 
        return 'O' 
      end
    elsif number_of_empty_squares%2 == 0
      return 'O'
    else
      return 'X'
    end
  end
  
  def play
    @board.get_state_of_board(board)
  end
  
  def check_top_row(board)
    marker = board[0]
    if board[0..2].all? { |square| square == marker }
      true
    else
      false
    end
  end
  
  def check_second_row(board)
    marker = board[3]
    if board[3..5].all? { |square| square == marker }
      true
    else
      false
    end
  end

  def check_third_row(board)
    marker = board[6]
    if board[6..8].all? { |square| square == marker }
      true
    else
      false
    end
  end

  def check_first_column(board)
    marker = board[0]
    first_column = []
    first_column << board[0] and board[3] and board[6]
    if first_column.all? { |square| square == marker }
      true
    else
      false
    end
  end  

  def check_second_column(board)
    marker = board[1]
    column = []
    column << board[1] and board[4] and board[7]
    if column.all? { |square| square == marker }
      true
    else
      false
    end
  end  

  def check_third_column(board)
    marker = board[2]
    column = []
    column << board[2] and board[5] and board[8]
    if column.all? { |square| square == square }
      true
    else
      false
    end
  end  

  def check_diagonal_down(board)
    marker = board[0]
    diagonal = []
    diagonal << board[0] and board[4] and board[8]
    if diagonal.all? { |square| square == marker }
      true
    else
      false
    end
  end  

  def check_diagonal_up(board)
    marker = board[6]
    diagonal = []
    diagonal << board[6] and board[4] and board[2]
    if diagonal.all? { |square| square == marker }
      true
    else
      false
    end
  end  
end
  
  