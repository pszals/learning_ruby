class MockBoard
  Surrogate.endow self
  define(:current_board)
  define(:set_square)    {|marker, square|}
end
