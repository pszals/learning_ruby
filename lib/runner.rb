require 'player'
require 'board'
require 'io'

class Runner
  
  attr_reader :io, :board, :player_x, :player_o

  def initialize(board, io)
    @player_x = Player.new('X')
    @player_o = Player.new('O')
    @board = board
    @io = io
  end
    
  def place_marker(square, marker)
    @board.set_square(square, marker)
  end
      
  def get_winner
    @board.winner_on_board?
  end
    
  def whose_turn?(empty_squares)
    empty_squares%2 == 0 ? player_o.marker : player_x.marker
  end
  
  def restart?(input)
    input == 1 ? setup : exit  
  end
  
  def take_turn
    empty_squares = @board.number_of_empty_squares
    marker = whose_turn?(empty_squares)
    @io.puts_turn(marker)
    @io.ask_for_square_to_mark? 
    @io.print_board(@board.output_board)
            
    square = @io.get_square_to_mark.to_i
    if @board.square_empty?(square) == false
      @io.marker_error
      check_board
    end
    place_marker(square, marker)
    check_board
  end

  def check_board
    winner = @board.winner_on_board?
    open_board = @board.board_open?

    if winner == false and open_board == true
      take_turn
    elsif winner != false
      @io.puts_winner(winner)
      @io.print_board(@board.output_board)
      @io.ask_to_restart?
      choice = @io.get_input
      restart?(choice)
    else
      @io.puts_tie
      @io.print_board(@board.output_board)
      @io.ask_to_restart?
      choice = @io.get_input
      restart?(choice)
    end
  end
  
  def setup
    board.reset_any_size_board
    take_turn
  end  
end

#board = Board.new
#io = Io.new
#runner = Runner.new(board, io)
#runner.setup