class TTTBoard < BoardBase
  
  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
  end

  def square_empty?(square)
    @current_board[square.to_i - 1] == square.to_s
  end
end 
