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
  
  it "should pass or something if there are two of same but one of other in row" do
    board = ['1', '2', '3', '4', '5', 'O', 'X', 'O', 'X']
    ai = Ai.new
    ai.complete_any_row(board).should == nil
  end
  
  it "should block opponents three in a row" do
    board = ['1', '2', '3', 'O', '5', 'O', 'X', 'O', 'X']
    ai = Ai.new
    ai.complete_any_row(board).should == '5'  
  end
  
  it "should mark the center of the board if center is empty" do
    board = ['1', '2', '3', '4', '5', 'O', 'X', 'O', 'X']
    ai = Ai.new
    ai.mark_center(board).should == '5'
  end

  it "should return false if center square is already marked" do
    board = ['1', '2', '3', '4', 'X', 'O', 'X', 'O', 'X']
    ai = Ai.new
    ai.mark_center(board).should == false 
  end
  
  it "should mark first empty corner encountered" do
    board = ['O', '2', '3', '4', 'X', 'O', 'X', 'O', 'X']
    ai = Ai.new
    ai.mark_corner(board).should == '3'
  end
  
  it "should return false if no corners are empty" do
    board = ['O', '2', 'X', '4', 'X', 'O', 'X', 'O', 'X']
    ai = Ai.new
    ai.mark_corner(board).should == false
  end
  
  it "should mark opposite corner of square oppoent has marked" do
    board = ['X', '2', '3', '4', '5', '6', '7', '8', '9']
    ai = Ai.new
    ai.mark_opposite_corner(board).should == '9'
  end
  
  it "should return false if no opposite corners can be marked" do
    board = ['X', '2', 'O', '4', '5', '6', 'X', '8', 'O']
    ai = Ai.new
    ai.mark_opposite_corner(board).should == false  
  end
  
end