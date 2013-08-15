require 'console_ui'
require 'board'
require 'game'
require 'webgame'
require 'unbeatable_ai'
require 'player'
require 'ttt_rules'

class Configuration

  attr_accessor  :marker, :opponent, :ui, :board_width, :ai, :player_1, :player_2, :board, :rules 

  def initialize(marker, opponent, board_width, user_interface)
    @marker = marker
    @opponent = opponent
    @ui = user_interface
    @board_width = board_width
    @ai = Unbeatable_AI.new
    configure_game
  end

  def configure_game
    configure_opponent
    configure_players
    configure_board(player_1, player_2)
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
      @player_1 = Player.new(@marker)
      @player_2 = Player.new('X')
    end
  end

  def configure_board(player_1, player_2)
    @board = Board.new(player_1, player_2)
    if @board_width == '3'
       @board.width = 3
       @rules = TTTRules.new(board)
    elsif @board_width == '4'
       @board.width = 4
       @board.current_board = board.squares_with_integers
       @rules = TTTRules.new(board)
    end
  end
end
