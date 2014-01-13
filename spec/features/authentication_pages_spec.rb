require 'spec_helper'

describe "AuthenticationPages" do
	subject { page }

	describe "signin page" do
		before { visit signin_path }

		it { should have_content('Sign in') }
		it { should have_title('Sign in') }

		context "with invalid information" do
			before { click_button "Sign in" }

			it { should have_title("Sign in") }
			it { should have_selector('div.alert.alert-error', text: 'Invalid') }

			describe "after visiting another page" do
				before { click_link "Woodrow Wilson Events" }
				it { should_not have_selector('div.alert.alert-error') }
			end
		end

		context "with valid information" do
			let(:user) { FactoryGirl.create(:user) }
			before do
				fill_in "Email", 		with: user.email.upcase
				fill_in "Password",	with: user.password
				click_button "Sign in"
			end

			it { should have_title(full_name(user))}
			it { should have_link('Profile',			href: user_path(user)) }
			it { should have_link('Sign out',			href: signout_path) }
			it { should_not have_link('Sign in',	href: signin_path) }

			describe "followed by signout" do
				before { click_link "Sign out" }
				it { should have_link('Sign in') }
			end
		end
	end

	describe "authorization" do

		describe "for non-signed-in users" do

			describe "in the Meetings controller" do

				describe "visiting the agenda" do
					before { visit agenda_path }
					it { should have_title('Sign in') }
				end
			end

			describe "in the Speakers controller" do

				describe "viewing the index" do
					before { visit speakers_path }
					it { should have_title('Speakers') }
				end

				describe "submitting to the create action" do
					before { post speakers_path }
					specify { expect(response).to redirect_to(signin_path) }
				end

				describe "submitting to the destroy action" do
					before { delete speaker_path(FactoryGirl.create(:speaker)) }
					specify { expect(response).to redirect_to(signin_path) }
				end
			end
		end

		describe "for signed-in users" do

			let(:user) { FactoryGirl.create(:user) }
			before { sign_in user, no_capybara: true }

			describe "in the Meetings controller" do

				describe "visiting the agenda" do
					before { visit agenda_path }
					it { should have_title('Agenda') }
				end
			end
		end
	end
end