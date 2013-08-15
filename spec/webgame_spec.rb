require 'webgame'
require 'configuration'
require '../sinatra_ttt/lib/sinatra_ui'

describe WebGame do

  context 'making a move' do
    let(:configs) {Configuration.new('X', 'human', '3', double(:ui))}
    let(:game)    {described_class.new(configs)}

    it "tttrules changes the state of board" do
      game.play_game(1)
      game.rules.current_board.should == [ 'X', '2', '3',
        '4', '5', '6',
        '7', '8', '9'
      ]
      game.rules.number_of_empty_squares.should be 8
    end

    it 'sets the move for the current player' do
      game.square_empty?(1).should be_true

      game.play_game(1)

      game.square_empty?(1).should be_false
      game.successful_move?.should be_true
    end

    it 'throws an error if the square is not empty' do
      game.play_game(1)
      game.play_game(1)

      game.successful_move?.should be_false
    end

    context 'responses when the game is over' do
      it 'over is false when there is no winner' do
        game.play_game(1)
        game.over.should be_false
      end

      it 'sets over to true when there is a winner' do
        configs.board.set_square(1, "X")
        configs.board.set_square(4, "X")
        game.play_game(7)

        game.over.should be_true
      end
    end
  end

  context 'using AI' do 
    let(:configs) {Configuration.new('X', 'computer', '3', double(:ui))}
    let(:game)    {described_class.new(configs)}

    it 'makes a move with AI if it is computer turn' do
      game.board.current_board = [
                                      'X', 'O', 'X',
                                      '4', 'O', 'O',
                                      '7', 'X', '9'
      ]                 
      game.rules.current_board = [
                                      'X', 'O', 'X',
                                      '4', 'O', 'O',
                                      '7', 'X', '9'
      ]                 
      game.ai.opponent.should be_true
      game.play_game(4)
      game.rules.number_of_empty_squares.should be 1
      game.board.current_board.should == [
                                      'X', 'O', 'X',
                                      'X', 'O', 'O',
                                      'O', 'X', '9'
      ]     
    end

    it 'does not make move when game is over' do
      game.over = true
      game.ai_move.should == nil
      game.play_game(4).should == false
    end
  end

  context 'game is over' do
    let(:configs) {Configuration.new('X', 'human', '3', Sinatra_UI.new)}
    let(:game)    {described_class.new(configs)}

    it 'tells if there is a tie game' do
      game.over = true
      game.winner = :no_winner
      game.game_over_message.should == "Tie Game!"
    end

    it 'tells who won' do
      game.over   = true
      game.winner = 'X'
      game.game_over_message.should == "Player X wins!"
    end
  end
end
