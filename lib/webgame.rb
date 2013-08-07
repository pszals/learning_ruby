class WebGame
  
  attr_accessor :player_1, :player_2, :over, :winning_piece
  attr_reader :ui, :board, :ai, :runner 

  def initialize(configuration)
    @ui            = configuration.ui
    @board         = configuration.board
    @ai            = configuration.ai
    @marker        = configuration.marker
    @player_1      = configuration.player_1
    @player_2      = configuration.player_2
    @over          = false
  end

  def make_move(square)
    if board.square_empty?(square)
      board.set_square(square, board.whose_turn)
      @success = true
      game_over?
    else
      @success = false
    end
  end

  def check_game_over
    if game_over?
    end
  end

  def game_over(final_game_message)
    @ui.print_board(@board.display_board)
    final_game_message
    @ui.ask_to_restart
    choice = @ui.get_input
    restart?(choice)  
  end

  def game_over?
    if @board.game_over?
      @over = true
    end
  end

  def find_winner
    if winning_piece != :no_winner
      ui.display_winner(@winning_piece)
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

  def winner 
    @winning_piece = @board.winner
  end

  
  def restart?(input)
    input == 1 ? @runner.call : exit  
  end
      
end