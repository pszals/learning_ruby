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
      
  def get_winner(board)
    @board.winner_on_board?(board)
  end
  
  def number_of_empty_squares(board)
    empty_squares = 0
    empty_board = @board.reset_board
    board.map do |square| 
      empty_squares += 1 if square == empty_board[square.to_i - 1]
    end
    empty_squares  
  end
  
  def whose_turn?(empty_squares)
    if empty_squares%2 == 0
      return get_player_o.get_marker
    else
      return get_player_x.get_marker
    end
  end
  
  def play
    @board.print_board(get_board)
  end
  
  def restart?(input)
    input == 1 ? restart : exit  
  end
  
  def restart
  
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
  
  