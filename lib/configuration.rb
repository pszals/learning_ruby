require 'io'
require 'board'
require 'ai'
require 'game'

class Configuration

  attr_accessor :board, :ai, :game, :io
  
  def initialize(board, ai, game)
    @io = Io.new
    @board = board
    @ai = ai
    @game = game
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
    marker = @io.get_marker_type #game.player_1 = marker, game.player_2 = marker
  end

end