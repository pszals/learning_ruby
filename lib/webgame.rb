class WebGame
  
  attr_accessor :player_1, :player_2, :over, :winner, :ai 
  attr_reader :ui, :board, :runner 

  def initialize(configuration)
    @ui            = configuration.ui
    @board         = configuration.board
    @ai            = configuration.ai
    @marker        = configuration.marker
    @player_1      = configuration.player_1
    @player_2      = configuration.player_2
    @over          = false
    @winner        = :no_winner
  end

  def play_game(square)
    if eligible?(square)
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
      @over = true
    end
  end

  def ai_move
    if computer_turn? and !over 
      board.set_square(computer_move, board.whose_turn)
    end
  end 

  def game_over_message 
    if winner != :no_winner
      ui.display_winner(winner)
    elsif over
      ui.display_tie
    end
  end

  def eligible?(square)
    square_empty?(square) and !over
  end

  def computer_turn?
    board.whose_turn == player_2.marker && ai.opponent
  end

  def computer_move
    ai.make_move(@board, board.whose_turn)
  end

  def successful_move?
    @success
  end

  def square_empty?(square)
    board.square_empty?(square)
  end

  def board_open?
    @board.board_open?
  end
end
