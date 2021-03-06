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
    @unbeatable_ai = ai
    @runner = Runner.new(ui)
  end
                
  def select_square
    square = nil
    marker = @board.whose_turn
    ui.declare_turn(marker, @board.display_board)
   
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
    find_winner if game_won?
    game_loop
  end

  def game_won?
    @board.game_won?
  end

  def find_winner
    @board.winner
  end
 
  def game_loop 
    if !game_over?
      select_square
    elsif game_won?
      game_over(@ui.puts_winner(find_winner))
    else
      game_over(@ui.puts_tie)
    end
  end

  def game_over?
    @board.game_over?
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
