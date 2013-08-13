require 'board_base'
require 'player'

describe BoardBase do
  let(:board) { BoardBase.new }

  context 'core board elements' do
    it 'accesses spaces' do
     board.current_board.should == []
    end

    it 'accesses width of board' do
      board.width.should == 0
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
