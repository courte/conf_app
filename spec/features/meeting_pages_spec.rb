include 'spec_helper'

describe "Meeting pages" do
	
	describe "add new meeting" do
		#TODO
	end

	describe "edit" do
		let(:meeting) { FactoryGirl.create(:meeting) }
		before { visit edit_meeting_path(meeting) }

		describe "page" do
		end
	end

	describe "agenda page" do
		#TODO
	end
end