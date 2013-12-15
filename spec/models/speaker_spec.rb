require 'spec_helper'

describe Speaker do
  
  let(:meeting) { FactoryGirl.create(:meeting) }
  before do
  	@speaker = meeting.speakers.build(name: "Dr. Mantis Toboggan",
  												 						bio: "Lorem impsum blah blah blah",
  												 						moderator: false)
  end

  subject { @speaker }

  # Attributes
  it { should respond_to(:name) }
  it { should respond_to(:bio) }
  it { should respond_to(:moderator) }
  it { should respond_to(:engagements) }
  it { should respond_to(:meeting_id) }
  it { should respond_to(:meeting) }
  its(:meeting) { should eq meeting }

  # Validations
  it { should be_valid }
  it { should validate_presence_of(:meeting_id) }
  it { should validate_presence_of(:name) }
end
