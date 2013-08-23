require 'spec_helper'

describe Meeting do
	before { @meeting = Meeting.new(name: "How To Be Awesome",
																	description: "Be me!",
																	start_time: Time.now,
																	end_time: Time.now + 1.days) }

	subject { @meeting }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:start_time) }
  it { should respond_to(:end_time) }

  context "when name is blank" do
  	before { @meeting.name = "" }
  	it { should_not be_valid }
  end

  describe "start_time and end_time" do
	  context "when start_time is blank" do
	  	before { @meeting.start_time = "" }
	  	it { should_not be_valid }
	  end

	  context "when end_time is blank" do
	  	before { @meeting.end_time = "" }
	  	it { should_not be_valid }
	  end

	  context "when end_time is < start_time" do
	  	before { @meeting.end_time = @meeting.start_time - 1.days }
	  	it { should_not be_valid }
	  end

	  context "when end_time is == start_time" do
	  	before { @meeting.end_time = @meeting.start_time }
	  	it { should_not be_valid }
	  end
	end

  # describe "Meeting.length" do
  	# expect(@meeting.length).to 
  # end
end
