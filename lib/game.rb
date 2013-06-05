require 'player'
require 'board'
require 'io'
require 'ai'

class Game
  
  attr_reader :io, :board, :player_1, :player_2, :ai 

  def initialize(board, io)
    @player_1 = Player.new('X')
    @player_2 = Player.new('O')
    @board = board
    @io = io
    @ai = Ai.new(board)
  end
              
  def whose_turn
    @board.empty_squares%2 == 0 ? player_2.marker : player_1.marker
  end
  
  def declare_turn(marker)
    @io.puts_turn(marker)
    @io.print_board(@board.display_board)
    @io.ask_for_square_to_mark    
  end
  
  def select_square
    square = nil
    marker = whose_turn
    declare_turn(marker)
    if marker == 'O' and @ai.opponent == true
      square = @ai.make_move
    else
      square = @io.get_square_to_mark
    end
    place_marker(square, marker)
  end

  def place_marker(square, marker)
    if @board.square_empty?(square) == false 
      @io.marker_error
      select_square
    end
    @board.set_square(square, marker)
    find_winner
  end

  def find_winner
    winner = @board.winner_on_board?
    open_board = @board.board_open?
    if winner == false and open_board == true
      select_square
    elsif winner != false
      game_over(@io.puts_winner(winner))
    else
      game_over(@io.puts_tie)
    end
  end
  
  def game_over(final_game_message)
    @io.print_board(@board.display_board)
    final_game_message
    @io.ask_to_restart
    choice = @io.get_input
    restart?(choice)  
  end
  
  def restart?(input)
    input == 1 ? play_game : exit  
  end
    
  def play_game
    @board.reset_board
    configure_opponent
    select_square
  end  

  def configure_opponent
    @io.ask_for_opponent
    opponent_type = @io.get_opponent
    if opponent_type == 1  
      @ai.opponent = true
    else
      @ai.opponent = false 
    end 
  end
  
  def configure_markers
    @io.ask_for_marker_type
    marker = @io.get_marker_type
  end

end