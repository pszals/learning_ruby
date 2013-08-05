require 'console_ui'
require 'board'
require 'game'
require 'webgame'
require 'unbeatable_ai'
require 'player'

class Configuration

  attr_accessor :ai, :ui, :board_width, :web_game, :player_1, :player_2, :marker
  
  def initialize(marker, opponent, board_width, user_interface)
    @marker = marker
    @opponent = opponent
    @ui = user_interface
    @board_width = board_width
    @ai = Unbeatable_AI.new
  end
    
  def get_marker
    @ui.ask_for_marker_type  
    marker = @ui.get_marker_type
    return marker
  end

   def configure_opponent
    if @opponent == 'computer'
      @ai.opponent = true
      @ai
    else
      @ai.opponent = false 
      @ai
    end 
  end
 
  def configure_players
    if marker == 'X' 
      @player_1 = Player.new(@marker)
      @player_2 = Player.new('O')
    else
      @player_1 = Player.new('O')
      @player_2 = Player.new(@marker)
    end
  end

  def configure_board(player_1, player_2)
    board = Board.new(player_1, player_2)
    if @board_width == '3'
       board.width = 3
       board
    elsif @board_width == '4'
       board.width = 4
       board.current_board = board.squares_with_integers
       board
    else
      configure_board(player_1, player_2)
    end      
  end
end
