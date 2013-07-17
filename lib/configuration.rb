require 'console_ui'
require 'board'
require 'game'
require 'unbeatable_ai'
require 'player'

class Configuration

  attr_accessor :ai, :ui#, :marker_type, :opponent, :board_width
  
  def initialize
    @ui = Console_UI.new
    @ai = Unbeatable_AI.new
#     @marker_type = false
#     @opponent = false
#     @board_width = false
  end
  
  def configure_opponent
    @ui.ask_for_opponent
    opponent_type = @ui.get_opponent
    if opponent_type == 1  
      @ai.opponent = true
      @ai
    else
      @ai.opponent = false 
      @ai
    end 
  end
    
  def get_marker
    @ui.ask_for_marker_type  
    marker = @ui.get_marker_type
    return marker
  end
  
  def configure_player_1(marker)
    if marker.length == 1 and marker =~ /[A-Za-z]/
      player_1 = Player.new(marker)
    else
      ui.marker_error
      configure_player_1(get_marker) 
    end
  end
  
  def configure_player_2(marker)
    if marker.length == 1 and marker =~ /[A-Za-z]/
      player_2 = Player.new(marker)
    else
      ui.marker_error
      configure_player_2(get_marker) 
    end  
  end

  def configure_board(player_1, player_2)
    board = Board.new(player_1, player_2)
    @ui.ask_for_width_of_board
    board_width = @ui.get_width_of_board
    if board_width == 3
      board.width = 3
      board
    elsif board_width == 4
      board.width = 4
      board.current_board = board.squares_with_integers
      board
    else
      configure_width
    end      
  end
end