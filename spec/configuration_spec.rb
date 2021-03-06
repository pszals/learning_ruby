require 'configuration'
require 'board'
require 'ttt_rules'

describe Configuration do
  let(:player_1)      { Player.new('X')                                    }
  let(:player_2)      { Player.new('O')                                    }
  let(:board)         { Board.new(player_1, player_2)                      }
  let(:rules)         { TTTRules.new(board)                                }
  let(:io)            { Console_UI.new(board)                              }
  let(:marker)        { 'X'                                                }
  let(:configuration) { Configuration.new('marker', 'computer', '3', io)   }
 
  it "configures game piece for player 1" do
    configuration.configure_players
    configuration.player_1.should be_kind_of(Player)
    
    new_configuration = Configuration.new('O', 'computer', '3', io)    
    new_configuration.configure_players
    new_configuration.player_1.should be_kind_of(Player)
    new_configuration.player_1.marker.should == 'O'
  end

  it "configures game piece for player 2" do
    configuration.configure_players
    configuration.player_2.should be_kind_of(Player)
    configuration.player_2.marker.should_not ==  configuration.player_1.marker
  end
  
  it "configures the board" do
    configuration.configure_board(player_1, player_2)
    
    configuration.board.should be_kind_of(Board)
    configuration.player_1.should be_kind_of(Player)
    configuration.player_2.should be_kind_of(Player)
    configuration.rules.should be_kind_of(TTTRules)
    configuration.board.width.should == 3
  end
  
  it "configures AI opponent" do
    ai = configuration.configure_opponent
    ai.opponent.should == true
    
    new_configuration = Configuration.new('O', 'human', '3', io)    
    new_configuration.configure_opponent
    new_configuration.ai.opponent.should == false 
  end

  it "configures the game" do
    configuration.should_receive(:configure_opponent)
    configuration.should_receive(:configure_players)
    configuration.should_receive(:configure_board)
    configuration.configure_game
  end

  it 'configures 4x4 game with O as player 1 marker' do
    new_configuration = Configuration.new('O', 'computer', '4', io)    
    new_configuration.configure_players

    new_configuration.player_1.marker.should == 'O'
    new_configuration.player_2.marker.should == 'X'
  end
end
