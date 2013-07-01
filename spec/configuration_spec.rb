require 'configuration'
require 'board'
require 'io'


describe Configuration do

  it "asks for and receives opponent type" do
    io = mock.as_null_object
    configuration = mock.as_null_object
    io.should_receive(:ask_for_opponent)
    io.should_receive(:get_input)
    configuration.configure_opponent
  end

  it "configures the type of game pieces used" do
    io = Io.new
    configuration = mock.as_null_object
    io.should_receive(:ask_for_marker_type)
    io.should_receive(:get_marker_type)
    configuration.configure_markers
  end
  
  it "rejects integers as game pieces" do
    
  end
  
  it "rejects input longer than one character" do
  
  end


end