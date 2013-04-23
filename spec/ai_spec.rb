require 'ai'

describe Ai do

  it "should return true when two markers of the top row are the same" do
    board = ['X', 'X', '3', '4', '5', '6', '7', '8', '9']
    ai = Ai.new
    ai.complete_top_row(board).should == true
  end
  
  it "should return false if two top row markers are the same but one square is marked other" do
    board = ['X', 'X', 'O', '4', '5', '6', '7', '8', '9']
    ai = Ai.new
    ai.complete_top_row(board).should == false
  end

  it "should return true when two markers of the second row are the same" do
    board = ['1', '2', '3', 'X', '5', 'X', 'O', '8', '9']
    ai = Ai.new
    ai.complete_second_row(board).should == true
  end

  it "should return position of empty square when two in row are the same but one is empty" do
    board = ['1', '2', '3', '4', '5', 'O', 'X', '8', 'X']
    ai = Ai.new
    ai.complete_any_row(board).should == '8'  
  end

end