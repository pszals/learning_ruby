require 'board'
require 'game'
require 'configuration'

class Runner

  def initialize(ui)
    @ui = ui
  end
  
  def call
    configure_game
    play_game
  end

  def configure_game
    configuration = Configuration.new(@ui)
    ai = configuration.configure_opponent
    player_1 = configuration.configure_player_1(configuration.get_marker)
    player_2 = configuration.configure_player_2(configuration.get_marker)
    board = configuration.configure_board(player_1, player_2)
    @game = Game.new(board, @ui, ai, player_1, player_2)
  end
    
  def play_game
    @game.play_game
#    break if ...
  end
  
end