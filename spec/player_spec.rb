require "player"

describe Player do

  it "should take and hold a marker selection" do
    player_x = Player.new('X')
    player_x.marker.should == 'X'
    player_o = Player.new('O')
    player_o.marker.should == 'O'
	 end
	
end