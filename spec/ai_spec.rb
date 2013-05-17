require 'ai'

describe Ai do

  it "should return true when two markers of the top row are the same" do
    board = Board.new
    board.game_state = ['X', 'X', '3', 
                        '4', '5', '6', 
                        '7', '8', '9']
    ai = Ai.new(board)
    ai.complete_any_row.should == '3'
  end
  
  it "should return false if two top row markers are the same but one square is marked other" do
    board = Board.new
    board.game_state = ['X', 'X', 'O', 
                        '4', '5', '6', 
                        '7', '8', '9']
    ai = Ai.new(board)
    ai.complete_any_row.should == false
  end

  it "should return position of empty square when two markers of the second row are the same" do
    board = Board.new
    board.game_state = ['1', '2', '3', 
                        'X', '5', 'X', 
                        'O', '8', '9']
    ai = Ai.new(board)
    ai.complete_any_row.should == '5'
  end

  it "should return position of empty square when two in row are the same but one is empty" do
    board = Board.new
    board.game_state = ['1', '2', '3', 
                        '4', '5', 'O', 
                        'X', '8', 'X']
    ai = Ai.new(board)
    ai.complete_any_row.should == '8'  
  end
  
  it "should return false if there are two of same but one of other in row" do
    board = Board.new
    board.game_state = ['1', '2', '3', 
                        '4', '5', 'O', 
                        'X', 'O', 'X']
    ai = Ai.new(board)
    ai.complete_any_row.should == false
  end
  
  it "should block opponent's three in a row" do
    board = Board.new
    board.game_state = ['1', '2', '3', 
                        'O', '5', 'O', 
                        'X', 'O', 'X']
    ai = Ai.new(board)
    ai.complete_any_row.should == '5'  
  end
  
  it "should mark the center of the board if center is empty" do
    board = Board.new
    board.game_state = ['1', '2', '3', 
                        '4', '5', 'O', 
                        'X', 'O', 'X']
    ai = Ai.new(board)
    ai.mark_center.should == '5'
  end

  it "should return false if center square is already marked" do
    board = Board.new
    board.game_state = ['1', '2', '3', 
                        '4', 'X', 'O', 
                        'X', 'O', 'X']
    ai = Ai.new(board)
    ai.mark_center.should == false 
  end
  
  it "should mark first empty corner encountered" do
    board = Board.new
    board.game_state = ['O', '2', '3', 
                        '4', 'X', 'O', 
                        'X', 'O', 'X']
    ai = Ai.new(board)
    ai.mark_corner.should == '3'
  end
  
  it "should return false if no corners are empty" do
    board = Board.new
    board.game_state = ['O', '2', 'X', 
                        '4', 'X', 'O', 
                        'X', 'O', 'X']
    ai = Ai.new(board)
    ai.mark_corner.should == false
  end
  
  it "should mark opposite corner of square oppoent has marked" do
    board = Board.new
    board.game_state = ['X', '2', '3', 
                        '4', '5', '6', 
                        '7', '8', '9']
    ai = Ai.new(board)
    ai.mark_opposite_corner.should == '9'
  end
  
  it "should return false if no opposite corners can be marked" do
    board = Board.new
    board.game_state = ['X', '2', 'O', 
                        '4', '5', '6', 
                        'X', '8', 'O']
    ai = Ai.new(board)
    ai.mark_opposite_corner.should == false  
  end
  
  it "should mark a side square" do
    board = Board.new
    board.game_state = ['X', '2', 'O', 
                        '4', '5', '6', 
                        'X', 'O', 'O']
    ai = Ai.new(board)
    ai.mark_side_square.should == '2'  
  end
  
  it "should return false if no side square can be marked" do
    board = Board.new
    board.game_state = ['X', 'X', 'X', 
                        'X', 'X', 'X', 
                        'X', 'X', 'X']
    ai = Ai.new(board)
    ai.mark_side_square.should == false
  end
  
  it "should create a fork" do
    board = Board.new
    board.game_state = ['X', '2', '3', 
                        '4', 'O', '6', 
                        '7', '8', 'X']
    ai = Ai.new(board)
    ai.make_fork.should == '3'                        
  end
  
  it "makes a move" do
    board = Board.new
    board.game_state = ['O', 'X', 'O', 
                        'O', 'X', '6', 
                        'X', 'O', 'X']
    ai = Ai.new(board)
    ai.should_receive(:complete_any_row)
    ai.should_receive(:mark_center)
    ai.should_receive(:mark_opposite_corner)
    ai.should_receive(:mark_corner)
    ai.should_receive(:mark_side)
    ai.make_move
  end
  
  it "makes a move by marking corner" do
    board = Board.new
    board.game_state = ['X', 'X', '3', 
                        'O', 'O', '6', 
                        '7', '8', '9']
    ai = Ai.new(board)
    ai.make_move.should == '3'
  end

  it "completes or blocks a row" do
    board = Board.new
    board.game_state = ['X', 'O', '3', 
                        'O', 'O', 'X', 
                        '7', '8', '9']
    ai = Ai.new(board)
    ai.complete_any_row.should == '8' 
  end
  
  it "completes or blocks a row" do
    board = Board.new
    board.game_state = ['1', 'O', '3', 
                        'X', 'O', '5', 
                        '7', '8', 'X']
    ai = Ai.new(board)
    ai.complete_any_row.should == '8'  
  end
end