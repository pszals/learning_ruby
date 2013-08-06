require 'board'    
require 'runner'
require 'player'
require 'configuration'

class WebGame
  
  attr_accessor :player_1, :player_2
  attr_reader :ui, :board, :ai, :unbeatable_ai, :runner 

  def make_move(peice)
    @game.make_move(peice)
  end
 
  def play_game
    run_game
  end  
               
  def select_square
    square = 'square' 
    marker = @board.whose_turn
    @ai.opponent = true

    if marker == @player_2.marker 
      square = @unbeatable_ai.make_move(@board, marker)
      place_marker(square, marker)
    end 
    
    if !game_over?
      return square
    elsif winner != :no_winner 
      ui.display_winner(winner) 
    else
      ui.display_tie
    end
  end

  def place_marker(square, marker)
   
    if @board.square_empty?(square) == false 
      @ui.marker_error
      select_square
    end
   
    @board.set_square(square, marker)
    run_game
  end

  def run_game
    if !game_over?
      ui.place_marker(select_square)
    elsif winner != :no_winner 
      ui.display_winner(winner) 
    else
      ui.display_tie
    end
  end

  def best_move 
    @unbeatable_ai.make_move(@board, @board.whose_turn)
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
