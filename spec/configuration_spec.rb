require 'configuration'
require 'board'
require 'io'


describe Configuration do

  let(:player_1)      { Player.new('X')     }
  let(:player_2)      { Player.new('O')     }
  let(:io)            { mock.as_null_object }
  let(:configuration) { Configuration.new   }

  it "configures game piece for player 1" do
    configuration.configure_player_1('z').should be_kind_of(Player)
  end

  it "configures game piece for player " do
    new_player_2 = configuration.configure_player_2('b')
    new_player_2.should be_kind_of(Player)
    new_player_2.marker.should == 'b'
  end
  
  it "configures the board size" do
    configuration.io.should_receive(:gets).and_return("4")
    configuration.io.should_receive(:ask_for_width_of_board)
    new_board = configuration.configure_board(player_1, player_2)
    new_board.should be_kind_of(Board)
    new_board.player_1.should be_kind_of(Player)
    new_board.player_2.should be_kind_of(Player)
    new_board.width.should == 4
  end
  
  it "sets ai.opponent to be true" do
    configuration.io.should_receive(:gets).and_return('1')
    configuration.io.should_receive(:ask_for_opponent)
    ai = configuration.configure_opponent
    ai.opponent.should == true
  end

end