require 'spec_helper'

describe Speaker do
  
  before do
  	@speaker = FactoryGirl.create(:speaker)
  end

  subject { @speaker }

  # Attributes
  it { should respond_to(:name) }
  it { should respond_to(:bio) }
  it { should respond_to(:moderator) }
  it { should respond_to(:engagements) }
  it { should respond_to(:meetings) }
  it { should respond_to(:schedule!) }
  it { should respond_to(:scheduled?) }
  it { should respond_to(:unschedule!) }

  # Validations
  it { should be_valid }
  it { should validate_presence_of(:name) }

  describe "scheduling" do
    let (:meeting) { FactoryGirl.create(:meeting) }
    before do
      @speaker.save
      @speaker.schedule!(meeting)
    end

    describe "#schedule!" do
      it { should be_scheduled(meeting) }
      its(:meetings) { should include(meeting) }
    end

    describe "#unschedule!" do
      before { @speaker.unschedule!(meeting) }

      it { should_not be_scheduled(meeting) }
      its(:meetings) { should_not include(meeting) }
    end
  end
end
