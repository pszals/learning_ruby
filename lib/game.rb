require 'runner'

class Game
  
  attr_accessor :player_1, :player_2
  attr_reader :ui, :board, :ai, :unbeatable_ai, :runner 

  def initialize(board, ui, ai, player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @ui = ui
    @ai = ai
    @unbeatable_ai = Unbeatable_AI.new
    @runner = Runner.new(ui)
  end
                
  def declare_turn(marker)
    @ui.puts_turn(marker)
    @ui.print_board(@board.display_board)
    @ui.ask_for_square_to_mark    
  end
  
  def select_square
    square = nil
    marker = @board.whose_turn
    declare_turn(marker)
   
    if marker == player_2.marker and @ai.opponent == true
      square = @unbeatable_ai.make_move(@board, marker)
    else
      square = @ui.get_square_to_mark
    end
   
    place_marker(square, marker)
  end

  def place_marker(square, marker)
   
    if @board.square_empty?(square) == false 
      @ui.marker_error
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
      game_over(@ui.puts_winner(winner))
    else
      game_over(@ui.puts_tie)
    end
  
  end
  
  def game_over(final_game_message)
    @ui.print_board(@board.display_board)
    final_game_message
    @ui.ask_to_restart
    choice = @ui.get_input
    restart?(choice)  
  end
  
  def restart?(input)
    input == 1 ? @runner.call : exit  
  end
      
  def play_game
    select_square
  end  

end