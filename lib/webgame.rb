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
    @over          = false
    @winner        = :no_winner
    @ai_on         = ai.opponent
  end

  def make_move(square)
    if board.square_empty?(square)
      board.set_square(square, board.whose_turn)
      @success = true
      game_over?
      ai_move
      game_over?
    else
      @success = false
    end
  end

  def game_over?
    if @board.game_over?
      over = true
      @winner = board.winner
    end
  end

  def check_game_over
    if game_over?
      end_game
    end
  end

  def ai_move
    if computer_turn?
      board.set_square(computer_move, board.whose_turn)
    end
  end 

  def computer_turn?
    board.whose_turn == player_2.marker && ai.opponent == true
  end

  def computer_move
    ai.make_move(@board, board.whose_turn)
  end

  def game_over(final_game_message)
    @ui.print_board(@board.display_board)
    final_game_message
    @ui.ask_to_restart
    choice = @ui.get_input
    restart?(choice)  
  end

  def toggle_ai 
    if ai.opponent == true
      ai_on = true
    end
  end
  
  def end_game 
    if winner != :no_winner
      ui.display_winner(winner)
    else
      ui.display_tie
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
               
  def select_square
    square = 'square' 
    marker = @board.whose_turn
    @ai.opponent = true

    if marker == @player_2.marker 
      square = @ai.make_move(@board, marker)
      @board.place_marker(square, marker)
    end 
    
    if !@board.game_over?
      return square
    elsif winner != :no_winner 
      ui.display_winner(winner) 
    else
      ui.display_tie
    end
  end

  def place_marker(square, marker)
   
    if @board.square_empty?(square) == false 
      @ui.marker_error
      select_square
    end
   
    @board.set_square(square, marker)
    run_game
  end

  def run_game
    if !game_over?
      ui.place_marker(select_square)
    elsif winner != :no_winner 
      ui.display_winner(winner) 
    else
      ui.display_tie
    end
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
