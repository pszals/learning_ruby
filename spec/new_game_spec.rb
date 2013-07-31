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

  it "retrieves the winning marker" do
    current_board = ['X', 'O', 'X',
                     'O', 'X', 'O',
                     'O', 'X', 'O',
                    ]
    game = New_Game.new(ui, current_board)
    game.board.should_receive(:winner)
    game.winner 
  end

  it "takes a full board with no winner and sends message to UI" do
    current_board = ['X', 'O', 'X',
                     'O', 'X', 'O',
                     'O', 'X', 'O',
                    ]
    game = New_Game.new(ui, current_board)
    game.ui.should_receive(:display_tie)
    game.game_loop
  end

   it "takes a full board with a winner and sends message to UI'" do
    current_board = ['X', 'O', 'X',
                     'O', 'X', 'O',
                     'O', 'X', 'X',
                    ]
    game = New_Game.new(ui, current_board)
    game.ui.should_receive(:display_winner).with('X')
    game.game_loop
  end

  it "makes ideal move with AI" do
    current_board = ['X', '2', '3',
                     'O', 'O', 'X',
                     '7', 'O', 'X',
                    ]
    game = New_Game.new(ui, current_board)
    game.ui.should_receive(:take_turn).with('3')
    game.game_loop 
  end

  it "takes a full board with a winner and sends message to UI" do
    current_board = ['O', 'O', 'X',
                     'O', 'X', 'O',
                     'O', 'X', 'X',
                    ]
    game = New_Game.new(ui, current_board)
    game.ui.should_receive(:display_winner).with('O')
    game.game_loop
  end
end
