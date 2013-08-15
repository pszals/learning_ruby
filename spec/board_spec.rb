require "board"
require "player"

describe Board do

  let(:player_1) { Player.new('X')               }
  let(:player_2) { Player.new('O')               }
  let(:board)    { Board.new(player_1, player_2) }


  context 'board data' do
    it 'accesses spaces' do
      board.width = 0
      board.reset_board
      board.current_board.should == []
    end

    it 'accesses width of board' do
      board.width.should == 3
    end

    it 'fills current board with integers based on width' do
      board.width = 2
      board.integer_board.should == [1, 2, 3, 4]
    end

    it 'converts board integers to strings' do
      board.width = 2
      board.integer_board
      board.board_to_strings.should == ['1', '2', '3', '4']
    end

    it 'resets board to be just numbers' do
      board.width = 2
      board.current_board = ['X', 'A', 'B', 'L']
      board.reset_board
      board.current_board.should == ['1', '2', '3', '4']
    end
  end  

  context 'manipulating the board' do
    it 'places a marker on the board' do
      board.width = 2
      board.reset_board
      board.set_square(1, 'k')
      board.current_board.should == ['k', '2', '3', '4']
    end

    it 'undoes a marker placement' do
      board.width = 2
      board.reset_board
      board.set_square(1, 'd')
      board.undo_set_square(1)
      board.current_board.should == ['1', '2', '3', '4']
    end
  end
end
