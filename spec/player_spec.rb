require "player"

describe Player do

  it "should take and hold a marker selection" do
    player_x = Player.new('X')
    player_x.get_marker.should == 'X'
	 end
	
end