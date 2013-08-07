require 'webgame'
require 'configuration'

describe WebGame do
    let(:configs) {Configuration.new('X', 'human', 3, double(:ui))}
    let(:game)    {described_class.new(configs)}

  context 'making a move' do
    it 'sets the move for the current player' do
      game.square_empty?(1).should be_true

      game.make_move(1)

      game.square_empty?(1).should be_false
      game.successful_move?.should be_true
    end

    it 'throws an error if the square is not empty' do
      game.make_move(1)
      game.make_move(1)

      game.successful_move?.should be_false
    end

    it 'checks for end of game if move is successful' do
      game.should_receive(:game_over?)
      game.over.should == false
      game.make_move(1)
    end

    it 'turns AI on' do
      game.toggle_ai
      game.ai_on.should == false
    end
  end

  context 'game is over' do
    it 'tells if there is a tie game' do
      game.over = true
      game.winner = :no_winner
      game.ui.should_receive(:display_tie)
      game.end_game
    end

    it 'tells who won' do
      game.over   = true
      game.winner = 'X'
      game.ui.should_receive(:display_winner).with('X')
      game.end_game
    end
  end
end
