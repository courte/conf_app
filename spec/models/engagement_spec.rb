require 'spec_helper'

describe Engagement do
  
  let(:speaker) { FactoryGirl.create(:speaker) }
  let(:meeting) { FactoryGirl.create(:meeting) }
  let(:engagement) { speaker.engagements.build(meeting_id: meeting.id) }

  subject { engagement }

  it { should be_valid }
  it { should validate_presence_of(:speaker_id) }
  it { should validate_presence_of(:meeting_id) }

  describe "scheduling methods" do
  	it { should respond_to(:speaker) }
  	it { should respond_to(:meeting) }
  	its(:speaker) { should eq speaker }
  	its(:meeting) { should eq meeting }
  end
end
