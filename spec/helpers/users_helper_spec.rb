require 'spec_helper'

describe UsersHelper do
	
	describe "#full_name" do
		let(:user) { FactoryGirl.create(:user, first_name: 'Martha', last_name: 'Jones') }

		it "should return a user's full name" do
			expect(full_name(user)).to eq("Martha Jones")
		end
	end
end