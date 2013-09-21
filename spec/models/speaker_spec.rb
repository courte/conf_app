require 'spec_helper'

describe Speaker do
  
  let(:meeting) { FactoryGirl.create(:meeting) }
  before do
  	@speaker = meeting.speakers.build(name: "Dr. Mantis Toboggan",
  												 						bio: "Lorem impsum blah blah blah",
  												 						moderator: false)
  end

  subject { @speaker }

  it { should respond_to(:name) }
  it { should respond_to(:bio) }
  it { should respond_to(:moderator) }
  it { should respond_to(:meeting_id) }
  it { should respond_to(:meeting) }
  its(:meeting) { should eq meeting }

  it { should be_valid }

  context "when meeting_id is not present" do
  	before { @speaker.meeting_id = nil }
  	it { should_not be_valid }
  end

  context "when name is not present" do
  	before { @speaker.name = "" }
  	it { should_not be_valid }
  end
end
