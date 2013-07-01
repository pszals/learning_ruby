require 'player'
require 'board'
require 'io'
require 'ai'
require 'unbeatable_ai'
require 'runner'

class Game
  
  attr_reader :io, :board, :player_1, :player_2, :ai, :unbeatable_ai, :runner

  def initialize(board, io, ai)
    @player_1 = Player.new('X')
    @player_2 = Player.new('O')
    @board = board
    @io = io
    @ai = ai
    @unbeatable_ai = Unbeatable_AI.new
    @runner = Runner.new
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
      square = @unbeatable_ai.make_move(@board, marker)
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
   
    if winner == false and open_board
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
    input == 1 ? @runner.start_game : exit  
  end
    
  def play_game
    select_square
  end  

end