require 'new_game'

describe New_Game do
  it "takes a full board with no winner and returns 'Tie Game'" do
    current_board = ['X', 'O', 'X',
                     'O', 'X', 'O',
                     'O', 'X', 'O',
                    ]
    game = New_Game.new(current_board)
    game.play_game.should == "Tie Game"
  end

   it "takes a full board with a winner and returns 'Player X Wins!'" do
    current_board = ['X', 'O', 'X',
                     'O', 'X', 'O',
                     'O', 'X', 'X',
                    ]
    game = New_Game.new(current_board)
    game.play_game.should == "Player X Wins!"
  end

  it "takes a full board with a winner and returns 'Player O Wins!'" do
    current_board = ['O', 'O', 'X',
                     'O', 'X', 'O',
                     'O', 'X', 'X',
                    ]
    game = New_Game.new(current_board)
    game.play_game.should == "Player O Wins!"
  end

end
