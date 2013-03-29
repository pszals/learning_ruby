require "sample"

describe Sample do

	it 'returns true' do
		sample = Sample.new
		sample.hello.should == true
	end
end