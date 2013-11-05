require 'ttt_board'
require 'player'

describe TTTBoard do
  let(:player_1) { Player.new('X')                  }
  let(:player_2) { Player.new('O')                  }
  let(:board)    { TTTBoard.new(player_1, player_2) }

  context 'taking a turn' do
    it 'tells if a square is empty' do
      board.current_board = ['1', '2', '3', '4']
      board.square_empty?(1).should be_true
    end
  end
end
