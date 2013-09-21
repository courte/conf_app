require 'spec_helper'

describe "Meeting pages" do
	
	describe "add new meeting" do
		#TODO
	end

	describe "meeting page" do
		let(:meeting) { FactoryGirl.create(:meeting) }
		let!(:sp1) { FactoryGirl.create(:speaker, meeting: meeting) }
		let!(:sp2) { FactoryGirl.create(:speaker, meeting: meeting, name: "Joe Schmoe") }

		before { visit meeting_path(meeting) }

		it { should have_content(meeting.title) }
		it { should have_title(meeting.title) }

		describe "speakers" do
			it { should have_content(sp1.name) }
			it { should have_content(sp2.name) }
			it { should have_content(meeting.speakers.count) }
		end
	end

	describe "edit" do
		# let(:meeting) { FactoryGirl.create(:meeting) }
		# before { visit edit_meeting_path(meeting) }

		describe "page" do
		end
	end

	describe "agenda page" do
		#TODO
	end
end