require 'unbeatable_ai'
require 'board'
require 'pry'

describe UnbeatableAI do
  
  it "returns 1 if X wins" do
    ai = UnbeatableAI.new
    board = Board.new
    board.current_board = ['X', 'X', 'X', 
                           '4', '5', '6', 
                           '7', '8', '9']
    ai.score_board(board, 'X').should == 1
  end
  
  it "returns 1 if O wins" do
    ai = UnbeatableAI.new
    board = Board.new
    board.current_board = ['O', 'O', 'O', 
                           '4', '5', '6', 
                           '7', '8', '9']
    ai.score_board(board, 'O').should == 1
  end
  
  it "returns 0 if game is tied" do
    ai = UnbeatableAI.new
    board = Board.new
    board.current_board = ['O', 'O', 'X', 
                           'X', 'O', 'O', 
                           'O', 'X', 'X']
    ai.score_board(board, 'O').should == 0
  end
  
  it "gets opponent's marker" do
    ai = UnbeatableAI.new
    ai.get_opponent('X').should == 'O'
  end
  
  it "returns score for a given board and marker" do
    ai = UnbeatableAI.new
    board = Board.new
    board.current_board = ['O', 'O', 'X', 
                           'X', 'X', 'O', 
                           'O', 'X', 'O']
    ai.minimax(board, 'X').should == 0
  end

  it "returns score for a given board and marker" do
    ai = UnbeatableAI.new
    board = Board.new
    board.current_board = ['O', 'O', 'X', 
                           'X', 'X', 'O', 
                           '7', 'X', 'O']
    ai.minimax(board, 'X').should == 1
  end

  it "returns score for a given board and marker" do
    ai = UnbeatableAI.new
    board = Board.new
    board.current_board = ['O', 'X', 'X', 
                           'X', 'O', 'O', 
                           '7', 'X', 'X']
    ai.minimax(board, 'O').should == 0
  end

  
end