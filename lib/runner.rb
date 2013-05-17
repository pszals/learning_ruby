require 'player'
require 'board'
require 'io'
require 'ai'

class Runner
  
  attr_reader :io, :board, :player_1, :player_2, :ai 

  def initialize(board, io)
    @player_1 = Player.new('X')
    @player_2 = Player.new('O')
    @board = board
    @io = io
    @ai = Ai.new(board)
  end
              
  def whose_turn?(empty_squares)
    empty_squares%2 == 0 ? player_2.marker : player_1.marker
  end
  
  def take_turn
    empty_squares = @board.number_of_empty_squares
    marker = whose_turn?(empty_squares)
    @io.puts_turn(marker)
    @io.print_board(@board.board_to_string)
    @io.ask_for_square_to_mark?
    
    if marker == 'O' and @ai.opponent == true
      square = @ai.make_move
    else
      square = @io.get_square_to_mark
    end
    
    if @board.square_empty?(square) == false
      @io.marker_error
      find_winner
    end
    @board.set_square(square, marker)
    find_winner
  end

  def find_winner
    winner = @board.winner_on_board?
    open_board = @board.board_open?

    if winner == false and open_board == true
      take_turn
    elsif winner != false
      @io.print_board(@board.board_to_string)
      @io.puts_winner(winner)
      @io.ask_to_restart?
      choice = @io.get_input
      restart?(choice)
    else
      @io.print_board(@board.board_to_string)
      @io.puts_tie
      @io.ask_to_restart?
      choice = @io.get_input
      restart?(choice)
    end
  end

  def restart?(input)
    input == 1 ? setup : exit  
  end
    
  def setup
    board.reset_board
    configure_opponent
    take_turn
  end  

  def configure_opponent
    @io.ask_for_opponent
    opponent_type = @io.get_opponent
    if opponent_type == 2  
      @ai.opponent = true
    else
      @ai.opponent = false 
    end 
  end

end

#board = Board.new
#io = Io.new
#runner = Runner.new(board, io)
#runner.setup