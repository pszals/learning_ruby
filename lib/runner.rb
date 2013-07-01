require 'board'
require 'ai'
require 'game'
require 'io'
require 'configuration'

class Runner
  def start_game
    board = Board.new
    io = Io.new
    ai = Ai.new(board)
    game = Game.new(board, io, ai)
    configuration = Configuration.new(board, ai, game)
    configuration.configure_opponent
    game.play_game
  end
end