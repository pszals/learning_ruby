require 'unbeatable_ai'
require 'board'
require 'pry'

describe Unbeatable_AI do
  
  it "returns 1 if X wins" do
    ai = Unbeatable_AI.new
    board = Board.new
    board.current_board = ['X', 'X', 'X', 
                           '4', '5', '6', 
                           '7', '8', '9']
    ai.score_board(board, 'X').should == 1
  end
  
  it "returns -1 if O wins" do
    ai = Unbeatable_AI.new
    board = Board.new
    board.current_board = ['O', 'O', 'O', 
                           '4', '5', '6', 
                           '7', '8', '9']
    ai.score_board(board, 'X').should == -1
  end
  
  it "returns 0 if game is tied" do
    ai = Unbeatable_AI.new
    board = Board.new
    board.current_board = ['O', 'O', 'X', 
                           'X', 'O', 'O', 
                           'O', 'X', 'X']
    ai.score_board(board, 'O').should == 0
  end
  
  it "gets opponent's marker" do
    ai = Unbeatable_AI.new
    ai.get_opponent('X').should == 'O'
  end
  
  it "returns score for a given board and marker" do
    ai = Unbeatable_AI.new
    board = Board.new
    board.current_board = ['O', 'O', 'X', 
                           'X', 'X', 'O', 
                           'O', 'X', 'O']
    ai.minimax(board, 'X', 1, -1.0/0, 1.0/0).should == 0
  end

  it "returns score for a given board and marker" do
    ai = Unbeatable_AI.new
    board = Board.new
    board.current_board = ['O', 'O', 'X', 
                           'X', 'X', 'O', 
                           '7', 'X', 'O']
    ai.minimax(board, 'X', 0, -1.0/0, 1.0/0).should == -1.0/0
  end

  it "returns score for a given board and marker" do
    ai = Unbeatable_AI.new
    board = Board.new
    board.current_board = ['O', 'X', 'X', 
                           'X', 'O', 'O', 
                           '7', 'X', 'X']
    ai.minimax(board, 'O', 0, 1.0/0, -1.0/0).should == 1.0/0
  end

  it "returns square to be marked that completes three in a row" do
    ai = Unbeatable_AI.new
    board = Board.new
    board.current_board = ['O', 'O', '3', 
                           'X', 'X', '6', 
                           '7', '8', 'X']
    ai.make_move(board, 'O').should == '3'
  end
  
  it "blocks three in a row" do
    ai = Unbeatable_AI.new
    board = Board.new
    board.current_board = ['O', 'X', '3', 
                           'O', '5', '6', 
                           '7', '8', '9']
    ai.make_move(board, 'X').should == '7'  
  end
  
  it "completes three in a row instead of blocking 3 in a row" do
    ai = Unbeatable_AI.new
    board = Board.new
    board.current_board = ['O', 'O', '3', 
                           'X', 'X', '6', 
                           '7', '8', '9']
    ai.make_move(board, 'X').should == '6'
  end

  it "completes three in a row instead of tying" do
    ai = Unbeatable_AI.new
    board = Board.new
    board.current_board = ['O', 'X', '3', 
                           'X', 'O', 'X', 
                           'X', 'X', '9']
    ai.make_move(board, 'O').should == '9'
  end

  it "ties instead of loses" do
    ai = Unbeatable_AI.new
    board = Board.new
    board.current_board = ['O', 'O', 'X', 
                           'X', 'O', 'O', 
                           '7', '8', 'X']
    ai.make_move(board, 'X').should == '8'
  end
  
  it "blocks by choosing 1" do
    ai = Unbeatable_AI.new
    board = Board.new
    board.current_board = ['1', 'O', '3', 
                           'X', '5', '6', 
                           'X', 'X', 'O']
    ai.make_move(board, 'O').should == '1'
  end
end