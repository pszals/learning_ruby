require 'board'    
require 'runner'
require 'player'

class New_Game
  
  attr_accessor :player_1, :player_2
  attr_reader :ui, :board, :ai, :unbeatable_ai, :runner 

  def initialize(ui, current_board, ai = Unbeatable_AI.new)
    @player_1 = Player.new('X')
    @player_2 = Player.new('O')
    @board = Board.new(@player_1, @player_2) 
    @ui = ui
    @ai = ai
    @unbeatable_ai = ai
    @runner = Runner.new(ui)
    @board.current_board = current_board
  end
 
  def play_game
    find_winner
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
    find_winner
  end

  def find_winner
    if !game_over?
      select_square
    elsif winner != :no_winner 
      ui.display_winner(winner) 
    else
      ui.display_tie
    end
  end
 
  def board_open?
    @board.board_open?
  end

  def game_over?
    @board.game_over?
  end

  def winner 
    @board.winner
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
      
end
