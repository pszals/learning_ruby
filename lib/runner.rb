require 'board'
require 'io'
require 'game'

class Runner
  def start_game
    board = Board.new
    io = Io.new
    game = Game.new(board, io)
    game.play_game
  end
end