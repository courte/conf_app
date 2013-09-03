require 'spec_helper'

describe "UserPages" do

	subject { page }

	describe "index" do
		let(:user) { FactoryGirl.create(:user) }
		before(:each) do
			sign_in user
			visit users_path
		end

		it { should have_title('Attendees') }
		it { should have_content('Attendees') }

		describe "pagination" do

			before(:all) { 30.times { FactoryGirl.create(:user) } }
			after(:all) { User.delete_all }

			it { should have_selector('div.pagination') }

			it "should list each user" do
				User.paginate(page: 1).each do |user|
					expect(page).to have_selector('li', text: user.name)
				end
			end
		end
	end

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