require "ttt"

describe Board do
	it "contains list of 9 board places" do
		board = Board.new
		board.make_board.should == [1,2,3,4,5,6,7,8,9] 
		end
end

describe Player do

end