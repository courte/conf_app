require 'spec_helper'

describe Meeting do
	before { @meeting = Meeting.new(title: "How To Be Awesome",
																	location: "Here",
																	description: "Be me!",
																	start_time: Time.now,
																	end_time: Time.now + 1.day ) }

	subject { @meeting }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:location) }
  it { should respond_to(:start_time) }
  it { should respond_to(:end_time) }

  context "when title is blank" do
  	before { @meeting.title = "" }
  	it { should_not be_valid }
  end

  context "when location is blank" do
  	before { @meeting.location = "" }
  	it { should_not be_valid }
  end

  describe "times attributes" do
	  context "when start_time is blank" do
		 	before { @meeting.start_time = "" }
		 	it { should_not be_valid }
		end

		context "when end_time is blank" do
		 	before { @meeting.end_time = "" }
		 	it { should_not be_valid }
		end

		context "when start_time is before current time" do
			
			context "when creating" do
				# before { @meeting.start_time = Time.now - 1.day }
				# it { should_not be_valid }
			end

			context "if editing" do
				# TODO
				# before do
					# @meeting.save
					# @meeting.reload.start_time = Time.now - 1.day
				# end
				
				# it { should be_valid }
			end
		end

		context "when end_time is < start_time" do
			before { @meeting.end_time = @meeting.start_time - 1.day }
		 	it { should_not be_valid }
		end

		context "when end_time == start_time" do
		 	before { @meeting.end_time = @meeting.start_time }
			it { should_not be_valid }
		end

	  context "when time format is invalid" do
	  	## TODO: test invalid time formats
	  	## it "should be invalid" do
	  		## times = ["Thu Jan 18 06:10:17 CST 2007", 20070118061017, "20070118061017", "January 18th, 2007 06:10"]
	  		## times.each do |invalid_time|
	  			## @meeting.start_time = invalid_time
	  			## it { should_not be_valid }
	  		## end
	  	## end
	  end

	  context "when time format is valid" do
	  	## TODO: test valid time formats
	  	## it "should be valid" do
	  		## times = ["2007-01-18 06:10:17 +"]
	  		## times.each do |valid_time|
	  			## @meeting.end_time = valid_time
	  		## end
	  	## end
	  end
	end

	describe "create_duration" do
  	it "returns the length of Meeting in seconds" do
  		length = 1.day.to_i
  		@meeting.create_duration
  		  		
  		expect(@meeting.duration).to eq length
  	end
  end

  describe "duration" do
		before { @meeting.save }
		its(:duration) { should_not be_blank }
	end
end
