class Board
	def self.make_board
		board = (1...10).to_a
		board.map! { |num| "#{num}" }
		board
	end
end