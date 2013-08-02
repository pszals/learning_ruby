require 'new_game'

describe New_Game do

  let(:ui) { double('UI').as_null_object }

  it "checks to see if board is open" do
    current_board = ['X', 'O', 'X',
                     'O', 'X', 'O',
                     'O', 'X', 'O',
                    ]
    game = New_Game.new(ui, current_board)
    game.board.should_receive(:board_open?)
    game.board_open?
  end

  it "checks to see if game is over" do
    current_board = ['X', 'O', 'X',
                     'O', 'X', 'O',
                     'O', 'X', 'O',
                    ]
    game = New_Game.new(ui, current_board)
    game.board.should_receive(:game_over?)
    game.game_over?
  end

  it "makes a move then declares winner" do
    current_board = ['O', 'O', '3',
                     'O', 'X', 'X',
                     'X', '8', 'O',
                    ]
    game = New_Game.new(ui, current_board)
    game.unbeatable_ai.should_receive(:make_move).with(game.board, 'O').and_return('3')
    game.ui.should_receive(:display_winner).with('O')
    game.run_game
  end

  it "retrieves the winning marker" do
    current_board = ['X', 'X', 'X',
                     'O', 'X', 'O',
                     'O', 'X', 'O',
                    ]
    game = New_Game.new(ui, current_board)
#   game.board.should_receive(:winner).exactly(1).times {'X'}
    game.board.winner.should == 'X' 
  end

  it "takes a full board with no winner and sends message to UI" do
    current_board = ['X', 'O', 'X',
                     'O', 'X', 'O',
                     'O', 'X', 'O',
                    ]
    game = New_Game.new(ui, current_board)
    game.ui.should_receive(:display_tie)
    game.run_game
  end

  it "takes a full board with a winner and sends message to UI'" do
    current_board = ['X', 'O', 'X',
                     'O', 'X', 'O',
                     'O', 'X', 'X',
                    ]
    game = New_Game.new(ui, current_board)
    game.ui.should_receive(:display_winner).with('X')
    game.run_game
  end

  it "makes ideal move with AI" do
    current_board = ['X', '2', '3',
                     '4', 'X', 'O',
                     '7', 'X', 'O',
                    ]
    game = New_Game.new(ui, current_board)
    game.ui.should_receive(:place_marker).with('3')
    game.run_game 
  end

  it "makes ideal move with AI" do
    current_board = ['X', '2', '3',
                     '4', '5', '6',
                     '7', '8', '9',
                    ]
    game = New_Game.new(ui, current_board)
    game.ui.should_receive(:place_marker).with('5')
    game.run_game 
  end

  it "makes no move with AI when it is not player 2's turn" do
    current_board = ['X', '2', '3',
                     '4', 'O', 'X',
                     '7', 'O', 'X',
                    ]
    game = New_Game.new(ui, current_board)
    game.ui.should_receive(:place_marker).with('square')
    game.run_game 
  end

  it "takes a full board with a winner and sends message to UI" do
    current_board = ['O', 'O', 'X',
                     'O', 'X', 'O',
                     'O', 'X', 'X',
                    ]
    game = New_Game.new(ui, current_board)
    game.ui.should_receive(:display_winner).with('O')
    game.run_game
  end

end
