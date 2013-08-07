require 'webgame'
require 'configuration'

describe WebGame do
  context 'making a move' do
    let(:configs) {Configuration.new('X', :human, 3, double(:ui))}
    let(:game)    {described_class.new(configs)}

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
  end
end
