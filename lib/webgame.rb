class WebGame
  
  attr_accessor :player_1, :player_2, :over, :winner, :ai_on, :ai 
  attr_reader :ui, :board, :runner 

  def initialize(configuration)
    @ui            = configuration.ui
    @board         = configuration.board
    @ai            = configuration.ai
    @marker        = configuration.marker
    @player_1      = configuration.player_1
    @player_2      = configuration.player_2
    @over          = board.game_over?
    @winner        = :no_winner
    @ai_on         = ai.opponent
  end

  def make_move(square)
    if board.square_empty?(square)
      board.set_square(square, board.whose_turn)
      @success = true
      find_winner
      ai_move
      find_winner
    else
      @success = false
    end
  end

  def find_winner
    if @board.game_over?
      @winner = board.winner
    end
  end

  def ai_move
    if computer_turn? and !game_over?
      board.set_square(computer_move, board.whose_turn)
    end
  end 

  def game_over_message 
    if winner != :no_winner and over
      ui.display_winner(winner)
    else
      ui.display_tie
    end
  end

  def game_over?
    board.game_over?
  end

  def computer_turn?
    board.whose_turn == player_2.marker && ai.opponent == true
  end

  def computer_move
    ai.make_move(@board, board.whose_turn)
  end

  def toggle_ai 
    if ai.opponent == true
      ai_on = true
    end
  end
  
  def successful_move?
    @success
  end

  def square_empty?(square)
    board.square_empty?(square)
  end

  def play_game
    run_game
  end  
               
  def best_move 
    @unbeatable_ai.make_move(@board, @board.whose_turn)
  end
 
  def board_open?
    @board.board_open?
  end
  
  def restart?(input)
    input == 1 ? @Sinatra_TTT.new_game : exit  
  end
end
