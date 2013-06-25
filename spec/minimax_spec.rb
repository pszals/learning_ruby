require 'minimax'
require 'board'

describe Minimax do
  it "returns 1 if X wins" do
    minimax = Minimax.new
    marker = 'X'
    board = Board.new
    board.current_board = ['X', 'X', 'X', 
                           '4', '5', '6', 
                           '7', '8', '9']
    minimax.score_board(board).should == 1
  end
  
  it "returns -1 if O wins" do
    minimax = Minimax.new
    marker = 'X'
    board = Board.new
    board.current_board = ['O', 'O', 'O', 
                           '4', '5', '6', 
                           '7', '8', '9']
    minimax.score_board(board).should == -1      
  end
  
  it "returns 0 if game is tied" do
    minimax = Minimax.new
    marker = 'X'
    board = Board.new
    board.current_board = ['O', 'O', 'X', 
                           'X', 'O', 'O', 
                           'O', 'X', 'X']
    minimax.score_board(board).should == 0
  end
end