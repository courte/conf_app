require 'spec_helper'

describe "UserPages" do

	# TODO: describe "signup page" do end

	# TODO: describe "profile page" do end

	describe "signup" do
		before { visit signup_path }

		let(:submit) { "Create My Account!" }

		context "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end

			describe "after submission" do
				before { click_button submit }

				it { should have_title('Sign up') }
				it { should have_content('error') }
			end
		end

		context "with valid information" do
			before do
				fill_in "First name",				with: "Example"
				fill_in "Last name",				with: "User"
				fill_in "Email",						with: "user@example.com"
				fill_in "Password",					with: "foobar00"
				fill_in "Confirmation",			with: "foobar00"
			end

			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end

			describe "after saving the user" do
				before { click_button submit }
				let(:user) { User.find_by_email( 'user@example.com' ) }

				it { should have_link('Sign out') }
				it { should have_title(full_name(user)) }
				it { should have_selector('div.alert.alert-success', text: 'Welcome') }
			end
		end
	end
end