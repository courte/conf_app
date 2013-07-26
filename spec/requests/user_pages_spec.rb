require 'spec_helper'

describe "UserPages" do
	describe "signup" do
		before { visit signup_path }

		let(:submit) { "Create My Account!" }

		context "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end

		context "with valid information" do
			before do
				fill_in "First name",				with: "X"
				fill_in "Last name",				with: "Ample"
				fill_in "Email",						with: "x.ample@user.com"
				fill_in "Password",					with: "foobar00"
				fill_in "Confirmation",			with: "foobar00"
			end

			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end
		end
	end
end