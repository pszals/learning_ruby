require 'configuration'
require 'board'

describe Configuration do
  let(:player_1)      { Player.new('X') }
  let(:player_2)      { Player.new('O') }
  let(:io)            { Console_UI.new                                     }
  let(:configuration) { Configuration.new('X', 'computer', '3', io)        }
 
  it "configures game piece for player 1" do
    configuration.configure_players
    configuration.player_1.should be_kind_of(Player)
  end

  it "configures game piece for player 2" do
    configuration.configure_players
    configuration.player_2.should be_kind_of(Player)
    configuration.player_2.marker.should_not ==  configuration.player_1.marker
  end
  
  it "configures the board size" do
    new_board = configuration.configure_board(player_1, player_2)
    new_board.should be_kind_of(Board)
    new_board.player_1.should be_kind_of(Player)
    new_board.player_2.should be_kind_of(Player)
    new_board.width.should == 3
  end
  
  it "sets ai.opponent to be true" do
    ai = configuration.configure_opponent
    ai.opponent.should == true
  end

end
