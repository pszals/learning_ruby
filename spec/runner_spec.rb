require 'runner'
require 'board'
require 'io'
require 'game'
require 'configuration'

describe Runner do

  let(:player_1)      { Player.new('X')                             }
  let(:player_2)      { Player.new('O')                             }
  let(:board)         { Board.new(player_1, player_2)               }
  let(:io)            { mock.as_null_object                         }
  let(:ai)            { Unbeatable_AI.new                           }
  let(:game)          { Game.new(board, io, ai, player_1, player_2) }
  let(:configuration) { Configuration.new                           }
  let(:runner)        { Runner.new                                  }

  it "starts up the game" do
    runner.should_receive(:start_game)
    runner.start_game
  end  
end
