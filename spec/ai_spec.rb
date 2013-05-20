require 'ai'

describe Ai do

  it "returns true when two markers of the top row are the same" do
    board = Board.new
    board.current_board = ['X', 'X', '3', 
                           '4', '5', '6', 
                           '7', '8', '9']
    ai = Ai.new(board)
    ai.complete_any_row.should == 3
  end
  
  it "returns false if two top row markers are the same but one square is marked other" do
    board = Board.new
    board.current_board = ['X', 'X', 'O', 
                           '4', '5', '6', 
                           '7', '8', '9']
    ai = Ai.new(board)
    ai.complete_any_row.should == false
  end

  it "returns position of empty square when two markers of the second row are the same" do
    board = Board.new
    board.current_board = ['1', '2', '3', 
                           'X', '5', 'X', 
                           'O', '8', '9']
    ai = Ai.new(board)
    ai.complete_any_row.should == 5
  end

  it "returns position of empty square when two in row are the same but one is empty" do
    board = Board.new
    board.current_board = ['1', '2', '3', 
                           '4', '5', 'O', 
                           'X', '8', 'X']
    ai = Ai.new(board)
    ai.complete_any_row.should == 8
  end
  
  it "returns false if there are two of same but one of other in row" do
    board = Board.new
    board.current_board = ['1', '2', '3', 
                           '4', '5', 'O', 
                           'X', 'O', 'X']
    ai = Ai.new(board)
    ai.complete_any_row.should == false
  end
  
  it "blocks opponent's three in a row" do
    board = Board.new
    board.current_board = ['1', '2', '3', 
                           'O', '5', 'O', 
                           'X', 'O', 'X']
    ai = Ai.new(board)
    ai.complete_any_row.should == 5
  end

  it "blocks a corner fork" do
    board = Board.new
    board.current_board = ['X', '2', '3', 
                           '4', 'O', '6', 
                           'O', '8', 'X']
    ai = Ai.new(board)
    ai.make_or_block_fork.should == 2                        
  end
  
  it "blocks a corner fork" do
    board = Board.new
    board.current_board = ['1', '2', 'X', 
                           '4', 'O', '6', 
                           'X', '8', '9']
    ai = Ai.new(board)
    ai.make_or_block_fork.should == 2                        
  end

  it "blocks a side fork bottom right" do
    board = Board.new
    board.current_board = ['1', '2', '3', 
                           '4', 'O', 'X', 
                           '7', 'X', '9']
    ai = Ai.new(board)
    ai.make_or_block_fork.should == 9                      
  end

  it "blocks a side fork top right" do
    board = Board.new
    board.current_board = ['1', 'X', '3', 
                           '4', 'O', 'X', 
                           '7', '8', '9']
    ai = Ai.new(board)
    ai.make_or_block_fork.should == 3                      
  end

  it "blocks a side fork top left" do
    board = Board.new
    board.current_board = ['1', 'X', '3', 
                           'X', 'O', '6', 
                           '7', '8', '9']
    ai = Ai.new(board)
    ai.make_or_block_fork.should == 1                    
  end
  
  it "blocks a side fork bottom left" do
    board = Board.new
    board.current_board = ['1', '2', '3', 
                           'X', 'O', '6', 
                           '7', 'X', '9']
    ai = Ai.new(board)
    ai.make_or_block_fork.should == 7                     
  end  

  it "marks the center of the board if center is empty" do
    board = Board.new
    board.current_board = ['1', '2', '3', 
                           '4', '5', 'O', 
                           'X', 'O', 'X']
    ai = Ai.new(board)
    ai.mark_center.should == 5
  end

  it "returns false if center square is already marked" do
    board = Board.new
    board.current_board = ['1', '2', '3', 
                           '4', 'X', 'O', 
                           'X', 'O', 'X']
    ai = Ai.new(board)
    ai.mark_center.should == false 
  end
  
  it "marks first empty corner encountered" do
    board = Board.new
    board.current_board = ['O', '2', '3', 
                           '4', 'X', 'O', 
                           'X', 'O', 'X']
    ai = Ai.new(board)
    ai.mark_corner.should == 3
  end
  
  it "returns false if no corners are empty" do
    board = Board.new
    board.current_board = ['O', '2', 'X', 
                           '4', 'X', 'O', 
                           'X', 'O', 'X']
    ai = Ai.new(board)
    ai.mark_corner.should == false
  end
  
  it "marks opposite corner of square oppoent has marked" do
    board = Board.new
    board.current_board = ['X', '2', '3', 
                           '4', '5', '6', 
                           '7', '8', '9']
    ai = Ai.new(board)
    ai.mark_opposite_corner.should == 9
  end
  
  it "returns false if no opposite corners can be marked" do
    board = Board.new
    board.current_board = ['X', '2', 'O', 
                           '4', '5', '6', 
                           'X', '8', 'O']
    ai = Ai.new(board)
    ai.mark_opposite_corner.should == false  
  end
  
  it "marks a side square" do
    board = Board.new
    board.current_board = ['X', '2', 'O', 
                           '4', '5', '6', 
                           'X', 'O', 'O']
    ai = Ai.new(board)
    ai.mark_side.should == 6  
  end
  
  it "returns false if no side square can be marked" do
    board = Board.new
    board.current_board = ['X', 'X', 'X', 
                           'X', 'X', 'X', 
                           'X', 'X', 'X']
    ai = Ai.new(board)
    ai.mark_side.should == false
  end
    
  it "makes a move" do
    board = Board.new
    board.current_board = ['O', 'X', 'O', 
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

  it "makes a move" do
    board = Board.new
    board.current_board = ['O', 'X', 'O', 
                           'O', 'X', 'O', 
                           'X', '8', 'X']
    ai = Ai.new(board)
    ai.make_move.should == 8
  end

  
  it "makes a move by marking corner" do
    board = Board.new
    board.current_board = ['X', 'X', '3', 
                           'O', 'O', '6', 
                           '7', '8', '9']
    ai = Ai.new(board)
    ai.make_move.should == 3
  end

  it "completes or blocks a row" do
    board = Board.new
    board.current_board = ['X', 'O', '3', 
                           'O', 'O', 'X', 
                           '7', '8', '9']
    ai = Ai.new(board)
    ai.complete_any_row.should == 8
  end
  
  it "completes or blocks a row" do
    board = Board.new
    board.current_board = ['1', 'O', '3', 
                           'X', 'O', '5', 
                           '7', '8', 'X']
    ai = Ai.new(board)
    ai.complete_any_row.should == 8
  end
end